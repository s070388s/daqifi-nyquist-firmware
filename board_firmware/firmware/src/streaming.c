

#include "HAL/ADC.h"
#include "HAL/DIO.h"
#include "json/Encoder.h"
#include "nanopb/DaqifiOutMessage.pb.h"
#include "nanopb/Encoder.h"
#include "Util/Logger.h"
#include "state/runtime/BoardRuntimeConfig.h"
#include "state/board/BoardConfig.h"
#include "state/data/BoardData.h"
#include "streaming.h"

#define UNUSED(x) (void)(x)
void Streaming_StuffDummyData (void); // Function for debugging - fills buffer with dummy data

static void Streaming_TriggerADC( AInModule* module )
{
    if (module->Type == AIn_MC12bADC)
    {
        
    }
    
    ADC_TriggerConversion(module);
}

static void Streaming_TimerHandler(uintptr_t context, uint32_t alarmCount)
{
    static bool inHandler = false;
    
    UNUSED(context);
    UNUSED(alarmCount);
    
    AInModRuntimeArray *pRunTimeAnalogInputArray = BoardRunTimeConfig_Get(  \
                    BOARDRUNTIMECONFIG_AIN_MODULES );
    AInModData *pAinModuleData;
    AInModule *pAinModuleConfig;
    StreamingRuntimeConfig *pStreamingConfig =                              \
                    BoardRunTimeConfig_Get(                                 \
                                BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    if(inHandler) return;
    inHandler = true;
    
    // On a 'System' prescale match
    // - Read the latest DIO (if it's not streaming- otherwise we'll wind up
    //      with an extra sample)
    // - Read the latest ADC (if it's not streaming- otherwise we'll wind up
    //      with an extra sample)
    // - Disable the charger and read battery voltages (Omit the regular 
    //      channels so we don't wind up with extra samples)
    // Otherwise
    // - Trigger conversions if, and only if, their prescale has been matched
    
    // TODO: Remove for production
    //Streaming_StuffDummyData();
    //inHandler = false;
    //return;
 
    uint8_t i=0;
    for( i=0; i < pRunTimeAnalogInputArray->Size; ++i ){
        pAinModuleData = BoardData_Get( BOARDATA_AIN_MODULE, i );
        // Only trigger conversions if the previous conversion is complete
        // @TODO: Replace with ADCPrescale[i]
        if( pAinModuleData->AInTaskState == AINTASK_IDLE &&                 \
            pStreamingConfig->StreamCount == pStreamingConfig->StreamCountTrigger ){
            pAinModuleConfig = BoardConfig_Get(                             \
                    BOARDCONFIG_AIN_MODULE, i );
            Streaming_TriggerADC( pAinModuleConfig );
        }

    }

    // @TODO: Replace with DIOPrescale
    if( pStreamingConfig->StreamCount == pStreamingConfig->StreamCountTrigger ){ 
        DIO_Tasks( &g_BoardData.DIOLatest, &g_BoardData.DIOSamples );
    }
    
    pStreamingConfig->StreamCount =                                         \
            (pStreamingConfig->StreamCount + 1) % pStreamingConfig->MaxStreamCount;
    
    inHandler = false;
}

void Streaming_Init( void )
{
    tStreamingConfig *pStreamingConfig = BoardConfig_Get(                   \
            BOARDCONFIG_STREAMING_CONFIG,                                   \
            0 );
    StreamingRuntimeConfig *pRuntimeStreaming = BoardRunTimeConfig_Get(     \
            BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    // Initialize sample trigger timer
    pRuntimeStreaming->TimerHandle =                                        \
            DRV_TMR_Open(                                                   \
                            pStreamingConfig->TimerIndex,                   \
                            pStreamingConfig->TimerIntent );
    if( pRuntimeStreaming->TimerHandle == DRV_HANDLE_INVALID )
    {
        // Client cannot open the instance.
         SYS_DEBUG_BreakPoint();
    }
    
    pRuntimeStreaming->Running = false;
}

void Streaming_Start( void )
{
    
    StreamingRuntimeConfig *pRuntimeStreaming = BoardRunTimeConfig_Get(     \
            BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    
    if (!pRuntimeStreaming->Running)
    {       
        DRV_TMR_AlarmRegister(                                              \
                pRuntimeStreaming->TimerHandle,                             \
                pRuntimeStreaming->ClockDivider,                            \
                true,                                                       \
                0,                                                          \
                Streaming_TimerHandler );
        
        DRV_TMR_Start( pRuntimeStreaming->TimerHandle );
        
        pRuntimeStreaming->Running = true;
    }
    
}

void Streaming_Stop( void )
{
    StreamingRuntimeConfig *pRuntimeStreaming = BoardRunTimeConfig_Get(     \
            BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    
    if( pRuntimeStreaming->Running ){
        DRV_TMR_Stop(pRuntimeStreaming->TimerHandle);
        DRV_TMR_AlarmDeregister(pRuntimeStreaming->TimerHandle);
        pRuntimeStreaming->Running = false;
    }
    DRV_TMR_CounterValue32BitSet( pRuntimeStreaming->TimerHandle, 0 );
}

void Streaming_UpdateState( void )
{
    tStreamingConfig *pStreamingConfig = BoardConfig_Get(                   \
            BOARDCONFIG_STREAMING_CONFIG,                                   \
            0 );
    StreamingRuntimeConfig *pRuntimeStreaming = BoardRunTimeConfig_Get(     \
            BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    
    Streaming_Stop( );
    
    // TODO: Calculate an appropriate runtimeConfig->ClockDivider and Prescale
    //          value for each module/channel
    //  - ClockDivider = Least Common Denominator of all the desired frequencies
    //  - Prescale = The integral multiple of ClockDivider closest to the 
    //          desired frequency
    //  - The 'System' prescale should be selected to be approximately 1s 
    //          (if possible), and should probably be excluded from the 
    //          LCD calculation
    pRuntimeStreaming->StreamCountTrigger = 0;
    pRuntimeStreaming->MaxStreamCount =                                     \
            pRuntimeStreaming->StreamCountTrigger + 1;
    
    // We never actually disable the streaming time because the system functions
    // (battery level, voltages, actually depend on it)
    Streaming_Start();
}
    
void Streaming_Tasks( tBoardData* boardData)
{
    DIOConfig *pDIO;
    DIORuntimeArray *pDIORunTimeArray;
    TcpServerData *pServerData = BoardRunTimeConfig_Get(                    \
            BOARDRUNTIMECONFIG_TCP_SERVER_DATA );
    UsbCdcData *pUSBSettings = BoardRunTimeConfig_Get(                      \
            BOARDRUNTIMECONFIG_USB_SETTINGS );
    StreamingRuntimeConfig *pRuntimeStreaming = BoardRunTimeConfig_Get(     \
            BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    AInSampleList *pAinSamplesList = BoardData_Get(                         \
            BOARDDATA_AIN_SAMPLES,                                          \
            0 );
    DIOSampleList *pDIOSamplesList = BoardData_Get(                         \
            BOARDDATA_DIO_SAMPLES,                                          \
            0 );
    
    if( !pRuntimeStreaming->IsEnabled ){
        return;
    }
    
    const size_t BUFFER_SIZE = 2048;
    uint8_t buffer[BUFFER_SIZE];
    bool AINDataAvailable = !AInSampleList_IsEmpty( pAinSamplesList );
    bool DIODataAvailable = !DIOSampleList_IsEmpty( pDIOSamplesList );
    
    #if(DAQIFI_DIO_DEBUG == 1)
    {
        // For diagnostic purposes, setup DIO pin 1
        //TODO: DAQiFi For diagnostic purposes, setup DIO pin 1
        g_BoardRuntimeConfig.DIOChannels.Data[1].IsInput = false;
        g_BoardRuntimeConfig.DIOChannels.Data[1].IsReadOnly = false;
        g_BoardRuntimeConfig.DIOChannels.Data[1].Value = !g_BoardRuntimeConfig.DIOChannels.Data[1].Value;
    }
    #endif
    
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
    }else
    {
        return;
    }
    
    // Decide how many samples we can send out
    size_t usbSize = 0;
    bool hasUsb = false;
    if( pUSBSettings->state == USB_CDC_STATE_PROCESS )
    {
        usbSize = min(                                                      \
                BUFFER_SIZE,                                                \
                USB_BUFFER_SIZE - pUSBSettings->writeBufferLength );
        hasUsb = true;
    }

    size_t i=0;
    size_t wifiSize = BUFFER_SIZE;
    bool hasWifi = false;
    if( pServerData->state == IP_SERVER_PROCESS )
    {
        for (i=0; i<WIFI_MAX_CLIENT; ++i)
        {
            if( pServerData->clients[i].client != INVALID_SOCKET)
            {
                 wifiSize = min(                                            \
                         wifiSize,                                          \
                         WIFI_BUFFER_SIZE -                                 \
                         pServerData->clients[i].writeBufferLength );
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
    
    while(maxSize > 0 && (AINDataAvailable || DIODataAvailable))
    {
        AINDataAvailable=!AInSampleList_IsEmpty( pAinSamplesList );
        DIODataAvailable=!DIOSampleList_IsEmpty( pDIOSamplesList );

        if( AINDataAvailable ){
            flags.Data[ flags.Size ] = DaqifiOutMessage_analog_in_data_tag;
            flags.Size += 1;
        }

        if( DIODataAvailable ){
            flags.Data[ flags.Size ] = DaqifiOutMessage_digital_data_tag;
            flags.Data[ flags.Size + 1 ] = DaqifiOutMessage_digital_port_dir_tag;
            flags.Size += 2;
        }



        // Generate a packet
        // TODO: ASCII Encoder
        if(flags.Size>0){
            size_t size = 0;
            if (pRuntimeStreaming->Encoding == Streaming_Json)
            {
                size = Json_Encode( boardData, &flags, buffer, maxSize );
            }
            else
            {
                size = Nanopb_Encode( boardData, &flags, buffer, maxSize );
            }

            // Write the packet out
            if (size > 0)
            {
                // Toggle DIO pin for diagnostic use
                pDIO = BoardConfig_Get( BOARDCONFIG_DIO_CHANNEL, 1);
                pDIORunTimeArray = BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_DIO_CHANNELS );
                
                DIO_WriteStateSingle( pDIO, &pDIORunTimeArray->Data[1] );
                
                if (hasUsb)
                {
                    memcpy(                                                 \
                            pUSBSettings->writeBuffer +                     \
                            pUSBSettings->writeBufferLength,                \
                            buffer,                                         \
                            size );
                    pUSBSettings->writeBufferLength += size;
                }

                if( hasWifi ){
                    for( i = 0; i < WIFI_MAX_CLIENT; ++i ){
                        if( pServerData->clients[ i ].client != INVALID_SOCKET ){
                            memcpy(                                         \
                                    pServerData->clients[i].writeBuffer +   \
                                    pServerData->clients[i].writeBufferLength,\
                                    buffer,                                 \
                                    size);
                            pServerData->clients[i].writeBufferLength += size;
                        }
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
    }
}

void TimestampTimer_Init( void )
{
    tStreamingConfig *pStreamingConfig = BoardConfig_Get(                   \
            BOARDCONFIG_STREAMING_CONFIG,                                   \
            0 );
    StreamingRuntimeConfig *pRuntimeStreaming = BoardRunTimeConfig_Get(     \
            BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    // Initialize and start timestamp timer
    // This is a free running timer used for reference - this doesn't interrupt
    // or callback
    pRuntimeStreaming->TSTimerHandle = DRV_TMR_Open(                         \
            pStreamingConfig->TSTimerIndex,                                 \
            pStreamingConfig->TSTimerIntent );
    if( pRuntimeStreaming->TSTimerHandle == DRV_HANDLE_INVALID ){
        // Client cannot open the instance.
         SYS_DEBUG_BreakPoint();
    }
    DRV_TMR_AlarmRegister(                                                  \
            pRuntimeStreaming->TSTimerHandle,                               \
            pRuntimeStreaming->TSClockDivider,                              \
            true,                                                           \
            0,                                                              \
            NULL );
    DRV_TMR_AlarmDisable( pRuntimeStreaming->TSTimerHandle );
    DRV_TMR_Start( pRuntimeStreaming->TSTimerHandle );
}

void Streaming_StuffDummyData (void)
{
    // Stuff stream with some data
    // Copy dummy samples to the data list
    uint32_t i = 0;
    static AInSample data;
    data.Value = 'O';
    data.Timestamp ++;
    // Skip zero so as not to allow multiple duplicate timestamps 
    // (uninitialized channels will have 0 timestamp)
    if (data.Timestamp == 0) data.Timestamp++;  

    for (i=0; i<16; ++i)
    {
        data.Channel = i;
        AInSampleList_PushBack(&g_BoardData.AInSamples, &data); 
    }
}