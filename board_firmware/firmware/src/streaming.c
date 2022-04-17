#include "streaming.h"

#include "HAL/ADC.h"
#include "HAL/DIO.h"
#include "json/Encoder.h"
#include "nanopb/DaqifiOutMessage.pb.h"
#include "nanopb/Encoder.h"
#include "Util/Logger.h"
#include "TcpServer/TcpServer.h"
#include "state/data/RunTimeStats.h"
#include "Util/CircularBuffer.h"

#define UNUSED(x) (void)(x)

#define BUFFER_SIZE  USB_WBUFFER_SIZE//2048
uint8_t buffer[BUFFER_SIZE];
size_t loop = 0;
    
static void Streaming_FillTestData(char* buffer, uint16_t len);
void Streaming_StuffDummyData (void); // Function for debugging - fills buffer with dummy data

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
    
    // TODO: Remove for production
    //Streaming_StuffDummyData();
    //inHandler = false;
    //return;
 
    Streaming_Defer_Interrupt();
    
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
        DBG_DIO_2_SET(0);
        return;
    }

    bool stream = false;
    bool AINDataAvailable, DIODataAvailable;
    NanopbFlagsArray flags;
    size_t usbSize, wifiSize, maxSize;
    bool hasUsb, hasWifi;
    int wifi_cnt;
    
    do{
        AINDataAvailable=!AInSampleList_IsEmpty(&boardData->AInSamples);
        DIODataAvailable=!DIOSampleList_IsEmpty(&boardData->DIOSamples);
        flags.Size = 0;
        usbSize    = 0;
        hasUsb     = hasWifi    = false;
        usbSize    = wifiSize   = 0;
        maxSize    = 0;
        
        if(AINDataAvailable || DIODataAvailable){
            DBG_DIO_2_SET(1);
            flags.Data[flags.Size++] = DaqifiOutMessage_msg_time_stamp_tag;
        }else{
            DBG_DIO_2_SET(0);
            return;
        }
         
        // Decide how many samples we can send out
        if (runtimeConfig->usbSettings.state == USB_CDC_STATE_PROCESS)
        {
            usbSize = CircularBuf_NumBytesFree(&runtimeConfig->usbSettings.wCirbuf);
            hasUsb  = true;
        }

        if (runtimeConfig->serverData.state == IP_SERVER_PROCESS)
        {
            for (wifi_cnt=0; wifi_cnt<WIFI_MAX_CLIENT; ++wifi_cnt)
            {
                if (runtimeConfig->serverData.clients[wifi_cnt].client != INVALID_SOCKET)
                {
                    wifiSize = min(wifiSize, WIFI_BUFFER_SIZE - runtimeConfig->serverData.clients[wifi_cnt].writeBufferLength);
                    hasWifi = true;
                }
            }
        }
        
        if (hasUsb && hasWifi){
            maxSize = min(usbSize, wifiSize);
        }
        else if(hasUsb){
            maxSize = usbSize;
        }
        else{
            maxSize = wifiSize;
        }

        if (maxSize < 128){
            DBG_DIO_2_SET(0);
            return;
        }
        
        if (AINDataAvailable){
            flags.Data[flags.Size++] = DaqifiOutMessage_analog_in_data_tag;
        }

        if (DIODataAvailable){
            flags.Data[flags.Size++] = DaqifiOutMessage_digital_data_tag;
            flags.Data[flags.Size++] = DaqifiOutMessage_digital_port_dir_tag;
        }
           
        // Generate a packet
        // TODO: ASCII Encoder
        if(flags.Size>0){
            
            size_t size = 0;
            if (runtimeConfig->StreamingConfig.Encoding == Streaming_Json){
                size = Json_Encode(boardData, &flags, buffer, maxSize);
            }
            else{
                DBG_DIO_5_SET(1);
                size = Nanopb_Encode(boardData, &flags, buffer, maxSize);
                //Streaming_FillTestData(buffer,size);
                DBG_DIO_5_SET(0);
            }

            // Write the packet out
            if (size > 0){

                if (hasUsb){
                    runTimeStats.NumBytesStreamToUsbBuf += UsbCdc_WriteToBuffer(&g_BoardRuntimeConfig.usbSettings, buffer, size);
                }

                if (hasWifi){
                    
                    if( TCP_Server_Is_Blocked() == 0 ){
                        for (wifi_cnt=0; wifi_cnt<WIFI_MAX_CLIENT; ++wifi_cnt)
                        {
                            if (runtimeConfig->serverData.clients[wifi_cnt].client != INVALID_SOCKET)
                            {
                                memcpy(runtimeConfig->serverData.clients[wifi_cnt].writeBuffer + runtimeConfig->serverData.clients[wifi_cnt].writeBufferLength, buffer, size);
                                runtimeConfig->serverData.clients[wifi_cnt].writeBufferLength += size;
                            }
                        }
                    }
                    else{
                        maxSize = 0;
                        continue;
                    }
                }
                maxSize = maxSize - size;
            }else
            {
                // We don't have enough available buffer to encode another message
                // Set maxSize to 0 to break out of loop
                maxSize = 0;                
            }
        }
    }while(1);
    
    DBG_DIO_2_SET(0);
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

void Streaming_StuffDummyData (void)
{
    // Stuff stream with some data
    // Copy dummy samples to the data list
    uint32_t i = 0;
    static AInSample data;
    data.Value = 'O';
    data.Timestamp ++;
    if (data.Timestamp == 0) data.Timestamp++;  // Skip zero so as not to allow multiple duplicate timestamps (uninitialized channels will have 0 timestamp)

    for (i=0; i<16; ++i)
    {
        data.Channel = i;
        AInSampleList_PushBack(&g_BoardData.AInSamples, &data); 
    }
}

static void Streaming_FillTestData(char* buffer, uint16_t len)
{
    static uint16_t counter = 0;
    int i;
    uint32_t timestamp = xTaskGetTickCount();
    uint16_t chksum16=0;
    // byte[0]        = #                               // 1 bytes
    // byte[1] - [4]  = timer tick                      // 4 bytes
    // byte[5] - [6]  = counter                         // 2 bytes
    // byte[7] - [n]  = padding with .                  // n bytes
    // byte[n+1] - [n+2] = checksum 16                  // 2 bytes
    // byte[n+3] - [n+4] = \r\n                         // 2 bytes
    configASSERT(len>=11); //minimun length required is 11
    
    memset(buffer, '.', len);
    buffer[0] = '#';
    memcpy(buffer+1, (uint8_t*)&timestamp, sizeof(uint32_t));
    memcpy(buffer+5, (uint8_t*)&counter, sizeof(uint16_t));
    for(i=0;i<(len-4);i++){
        chksum16+= buffer[i];
    }
    memcpy(buffer+(len-4), (uint16_t*)&chksum16, sizeof(uint16_t));
    buffer[len-2] = '\r';
    buffer[len-1] = '\n';
    counter++;
   
}