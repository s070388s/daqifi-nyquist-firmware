#include "streaming.h"

#include "HAL/ADC.h"
#include "HAL/DIO.h"
#include "json/Encoder.h"
#include "nanopb/DaqifiOutMessage.pb.h"
#include "nanopb/Encoder.h"

#define UNUSED(x) (void)(x)

static void Streaming_TriggerADC(AInModule* module)
{
    if (module->Type == AIn_MC12bADC)
    {
        g_BoardData.PowerData.MCP73871Data.chargeAllowed = false;
        
        MCP73871_ChargeEnable(g_BoardConfig.PowerConfig.MCP73871Config,
            &g_BoardData.PowerData.MCP73871Data,
            &g_BoardRuntimeConfig.PowerWriteVars.MCP73871WriteVars,
            false, g_BoardData.PowerData.pONBattPresent);
    }
    
    ADC_TriggerConversion(module);
}

static void Streaming_TimerHandler(uintptr_t context, uint32_t alarmCount)
{
    static bool inHandler = false;
    
    UNUSED(context);
    UNUSED(alarmCount);
    
    if(inHandler) return;
    inHandler = true;
    
    // On a 'System' prescale match
    // - Read the latest DIO (if it's not streaming- otherwise we'll wind up with an extra sample)
    // - Read the latest ADC (if it's not streaming- otherwise we'll wind up with an extra sample)
    // - Disable the charger and read battery voltages (Omit the regular channels so we don't wind up with extra samples)
    // Otherwise
    // - Trigger conversions if, and only if, their prescale has been matched
    
 
    uint8_t i=0;
    for (i=0; i < g_BoardRuntimeConfig.AInModules.Size; ++i)
    {
        // Only trigger conversions if the previous conversion is complete
        if (g_BoardData.AInState.Data[i].AInTaskState == AINTASK_IDLE &&
            g_BoardRuntimeConfig.StreamingConfig.StreamCount == g_BoardRuntimeConfig.StreamingConfig.StreamCountTrigger) // TODO: Replace with ADCPrescale[i]
        {
            Streaming_TriggerADC(&g_BoardConfig.AInModules.Data[i]);
        }

    }

    if (g_BoardRuntimeConfig.StreamingConfig.StreamCount == g_BoardRuntimeConfig.StreamingConfig.StreamCountTrigger) // TODO: Replace with DIOPrescale
    {
        DIO_Tasks(&g_BoardConfig.DIOChannels, &g_BoardRuntimeConfig, &g_BoardData.DIOLatest, &g_BoardData.DIOSamples);
    }
    
    g_BoardRuntimeConfig.StreamingConfig.StreamCount = (g_BoardRuntimeConfig.StreamingConfig.StreamCount + 1) % g_BoardRuntimeConfig.StreamingConfig.MaxStreamCount;
    
    inHandler = false;
}

void Streaming_Init(const StreamingConfig* config, StreamingRuntimeConfig* runtimeConfig)
{
    // Initialize sample trigger timer
    runtimeConfig->TimerHandle = DRV_TMR_Open(config->TimerIndex, config->TimerIntent);
    if( runtimeConfig->TimerHandle == DRV_HANDLE_INVALID )
    {
        // Client cannot open the instance.
         SYS_DEBUG_BreakPoint();
    }
    
    runtimeConfig->Running = false;
}

void Streaming_Start(const StreamingConfig* config, StreamingRuntimeConfig* runtimeConfig)
{
    UNUSED(config);
    
    if (!runtimeConfig->Running)
    {       
        DRV_TMR_AlarmRegister(runtimeConfig->TimerHandle,
            runtimeConfig->ClockDivider,
            true,
            0,
            Streaming_TimerHandler);
        
        DRV_TMR_Start(runtimeConfig->TimerHandle);
        
        runtimeConfig->Running = true;
    }
    
}

void Streaming_Stop(const StreamingConfig* config, StreamingRuntimeConfig* runtimeConfig)
{
    UNUSED(config);
    if (runtimeConfig->Running)
    {
        DRV_TMR_Stop(runtimeConfig->TimerHandle);
        DRV_TMR_AlarmDeregister(runtimeConfig->TimerHandle);
        runtimeConfig->Running = false;
    }
    DRV_TMR_CounterValue32BitSet(runtimeConfig->TimerHandle, 0);
}

void Streaming_UpdateState(const BoardConfig* boardConfig, BoardRuntimeConfig* runtimeConfig)
{
    Streaming_Stop(&boardConfig->StreamingConfig, &runtimeConfig->StreamingConfig);
    
    // TODO: Calculate an appropriate runtimeConfig->ClockDivider and Prescale value for each module/channel
    //  - ClockDivider = Least Common Denominator of all the desired frequencies
    //  - Prescale = The integral multiple of ClockDivider closest to the desired frequency
    //  - The 'System' prescale should be selected to be approximately 1s (if possible), and should probably be excluded from the LCD calculation
    runtimeConfig->StreamingConfig.StreamCountTrigger = 0;
    runtimeConfig->StreamingConfig.MaxStreamCount = runtimeConfig->StreamingConfig.StreamCountTrigger + 1;
    
    // We never actually disable the streaming time because the system functions (battery level, voltages, actually depend on it)
    Streaming_Start(&boardConfig->StreamingConfig, &runtimeConfig->StreamingConfig);
}
    
void Streaming_Tasks(const BoardConfig* boardConfig, BoardRuntimeConfig* runtimeConfig, BoardData* boardData)
{
    if (!runtimeConfig->StreamingConfig.IsEnabled)
    {
        return;
    }
    
    const size_t BUFFER_SIZE = 2048;
    uint8_t buffer[BUFFER_SIZE];
    bool AINDataAvailable=!AInSampleList_IsEmpty(&boardData->AInSamples);
    bool DIODataAvailable=!DIOSampleList_IsEmpty(&boardData->DIOSamples);
    
    // Decide what to write
    NanopbFlagsArray flags;
    
    flags.Size=0;   // Initialize array size to zero
    
    // See if we have anything to write at all, if so, proceed with creating message header, etc.
    if(AINDataAvailable || DIODataAvailable){
        flags.Data[0] = DaqifiOutMessage_msg_time_stamp_tag;
//        flags.Data[1] = DaqifiOutMessage_device_status_tag;
//        flags.Data[2] = DaqifiOutMessage_bat_level_tag;
//        flags.Data[3] = DaqifiOutMessage_pwr_status_tag;
//        flags.Data[4] = DaqifiOutMessage_temp_status_tag;
        flags.Size = 1;
    }
    
    if (AINDataAvailable)
    {
        flags.Data[flags.Size] = DaqifiOutMessage_analog_in_data_tag;
        //flags.Data[flags.Size + 1] = DaqifiOutMessage_analog_in_data_b_tag;   
        //flags.Data[flags.Size + 2] = DaqifiOutMessage_analog_in_port_rse_tag;
        //flags.Data[flags.Size + 3] = DaqifiOutMessage_analog_in_port_enabled_tag;
        //flags.Data[flags.Size + 4] = DaqifiOutMessage_analog_in_port_range_tag;
        //flags.Data[flags.Size + 5] = DaqifiOutMessage_analog_in_res_tag;
        flags.Size += 1;
    }
    
    if (DIODataAvailable)
    {
        flags.Data[flags.Size] = DaqifiOutMessage_digital_data_tag;
        flags.Data[flags.Size + 1] = DaqifiOutMessage_digital_port_dir_tag;
        flags.Size += 2;
    }
    
    // Decide how many samples we can send out
    size_t usbSize = 0;
    bool hasUsb = false;
    if (runtimeConfig->usbSettings.state == USB_CDC_STATE_PROCESS)
    {
        usbSize = min(BUFFER_SIZE, USB_BUFFER_SIZE - runtimeConfig->usbSettings.writeBufferLength);
        hasUsb = true;
    }

    size_t i=0;
    size_t wifiSize = BUFFER_SIZE;
    bool hasWifi = false;
    if (runtimeConfig->serverData.state == IP_SERVER_PROCESS)
    {
        for (i=0; i<WIFI_MAX_CLIENT; ++i)
        {
            if (runtimeConfig->serverData.clients[i].client != INVALID_SOCKET)
            {
                 wifiSize = min(wifiSize, WIFI_BUFFER_SIZE - runtimeConfig->serverData.clients[i].writeBufferLength);
                 hasWifi = true;
            }
        }
    }
    
    size_t maxSize = 0;
    if (hasUsb && hasWifi)
    {
        maxSize = min(usbSize, wifiSize);
    }
    else if (hasUsb)
    {
        maxSize = usbSize;
    }
    else
    {
        maxSize = wifiSize;
    }
    
    if (maxSize < 128)
    {
        return;
    }
    
    // Generate a packet
    // TODO: ASCII Encoder
    if(flags.Size>0){
        size_t size = 0;
        if (runtimeConfig->StreamingConfig.Encoding == Streaming_Json)
        {
            size = Json_Encode(boardData, &flags, buffer, maxSize);
        }
        else
        {
            size = Nanopb_Encode(boardData, &flags, buffer, maxSize);
        }

        // Write the packet out
        if (size > 0)
        {
            if (hasUsb)
            {
                memcpy(runtimeConfig->usbSettings.writeBuffer + runtimeConfig->usbSettings.writeBufferLength, buffer, size);
                runtimeConfig->usbSettings.writeBufferLength += size;
            }

            if (hasWifi)
            {
                for (i=0; i<WIFI_MAX_CLIENT; ++i)
                {
                    if (runtimeConfig->serverData.clients[i].client != INVALID_SOCKET)
                    {
                        memcpy(runtimeConfig->serverData.clients[i].writeBuffer + runtimeConfig->serverData.clients[i].writeBufferLength, buffer, size);
                        runtimeConfig->serverData.clients[i].writeBufferLength += size;
                    }
                }
            }
        }else
        {
            // TODO: Add error to the error log and/or some other error handling
            //  If we get here, we have a flag to encode, but our encoded size = 0 so something went wrong
            //while(1);
            LogMessage("Stream overflow streaming.c ln 251\n\r");
        }
    }
}

void TimestampTimer_Init(const StreamingConfig* config, StreamingRuntimeConfig* runtimeConfig)
{
    // Initialize and start timestamp timer
    // This is a free running timer used for reference - this doesn't interrupt or callback
    runtimeConfig->TSTimerHandle = DRV_TMR_Open(config->TSTimerIndex, config->TSTimerIntent);
    if( runtimeConfig->TSTimerHandle == DRV_HANDLE_INVALID )
    {
        // Client cannot open the instance.
         SYS_DEBUG_BreakPoint();
    }
    DRV_TMR_AlarmRegister(runtimeConfig->TSTimerHandle,
            runtimeConfig->TSClockDivider,
            true,
            0,
            NULL);
    DRV_TMR_AlarmDisable(runtimeConfig->TSTimerHandle);
    DRV_TMR_Start(runtimeConfig->TSTimerHandle);
}