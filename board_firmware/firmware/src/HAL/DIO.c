

#include "system_config.h"
#include "system_definitions.h"
#include "state/runtime/BoardRuntimeConfig.h"
#include "state/board/BoardConfig.h"
#include "DIO.h"

//! Sample streamed to be queued to the list
DIOSample streamingSample;

bool DIO_InitHardware( void )
{
    uint32_t i;
    DIOConfig *pDIO;
    uint32_t *pNumOfChannels = BoardConfig_Get(                             \
                    BOARDCONFIG_NUM_OF_DIO_CHANNELS,                        \
                    0 );
    
    // Initial condition should be handled by the pin manager
    // We can be sure by running the code here
    for ( i = 0; i  < *pNumOfChannels; ++i ){
        pDIO = BoardConfig_Get( BOARDCONFIG_DIO_CHANNEL, i );
        // Disable all channels by default        
        if( pDIO->EnableInverted ){
            PLIB_PORTS_PinSet(                                              \
                    pDIO->EnableModule,                                     \
                    pDIO->EnableChannel ,                                   \
                    pDIO->EnablePin );
        }
        else
        {
            PLIB_PORTS_PinClear(                                            \
                    pDIO->EnableModule,                                     \
                    pDIO->EnableChannel ,                                   \
                    pDIO->EnablePin );
        }
        
        PLIB_PORTS_PinDirectionOutputSet(                                   \
                    pDIO->EnableModule,                                     \
                    pDIO->EnableChannel ,                                   \
                    pDIO->EnablePin );
    }
    return true;
}

bool DIO_WriteStateAll( void )
{
    size_t i;
    bool result = true;
    
    DIOConfig *pDIO;
    DIORuntimeArray *pRunTimeDIOArray =                                     \
                    BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_DIO_CHANNELS );
    DIORuntimeConfig *pRunTimeDIO;
    
    if( pRunTimeDIOArray->Size >= MAX_DIO_RUNTIME_CHANNEL ){
        return false;
    }
    for(i=0; i < pRunTimeDIOArray->Size; ++i)
    {
        pRunTimeDIO = &pRunTimeDIOArray->Data[ i ];
        pDIO = BoardConfig_Get(                                             \
                    BOARDCONFIG_DIO_CHANNEL, i );
        result &= DIO_WriteStateSingle( pDIO, pRunTimeDIO );
    }
    
    return result;
}

bool DIO_WriteStateSingle(                                                  \
                    const DIOConfig* boardConfig,                           \
                    DIORuntimeConfig* runtimeConfig )
{

    if (runtimeConfig->IsInput)
    {
        // Set driver disabled - this value will be the value of EnableInverted
        // config parameter
        PLIB_PORTS_PinWrite(                                                \
                    boardConfig->EnableModule,                              \
                    boardConfig->EnableChannel ,                            \
                    boardConfig->EnablePin,                                 \
                    boardConfig->EnableInverted );
        // Set data pin direction as input
        PLIB_PORTS_PinDirectionInputSet(                                    \
                    boardConfig->DataModule,                                \
                    boardConfig->DataChannel ,                              \
                    boardConfig->DataPin );
    }
    else
    {
        // Set driver enabled - this value will be the inverse of
        // EnableInverted config parameter
        PLIB_PORTS_PinWrite(                                                \
                    boardConfig->EnableModule,                              \
                    boardConfig->EnableChannel ,                            \
                    boardConfig->EnablePin,                                 \
                    !boardConfig->EnableInverted);
        // Set driver value
        PLIB_PORTS_PinWrite(                                                \
                    boardConfig->DataModule,                                \
                    boardConfig->DataChannel,                               \
                    boardConfig->DataPin,                                   \
                    runtimeConfig->Value );
        // Set data pin direction as output
        PLIB_PORTS_PinDirectionOutputSet(                                   \
                    boardConfig->DataModule,                                \
                    boardConfig->DataChannel,                               \
                    boardConfig->DataPin );
    }
    
    return true;
}

bool DIO_ReadSampleByMask(                                                  \
                    DIOSample* sample,                                      \
                    uint32_t mask )
{
    StreamingRuntimeConfig *pStreamingConfig =                              \
                    BoardRunTimeConfig_Get(                                 \
                                BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    DIOConfig *pDIO;
    
    sample->Mask = mask;
    sample->Values = 0;
    // Set module trigger timestamp
    sample->Timestamp = DRV_TMR_CounterValueGet(                            \
                    pStreamingConfig->TSTimerHandle );  
    
    size_t i=0;
    
    DIORuntimeArray *pRunTimeDIO = BoardRunTimeConfig_Get(                  \
                    BOARDRUNTIMECONFIG_DIO_CHANNELS );
    for( i = 0; i < pRunTimeDIO->Size; ++i ){
        pDIO = BoardConfig_Get(                                             \
                    BOARDCONFIG_DIO_CHANNEL, i );
        bool isMatch = (mask & (1 << i));
        if (isMatch)
        {
            uint8_t val = PLIB_PORTS_PinGet(                                \
                    pDIO->DataModule,                                       \
                    pDIO->DataChannel,                                      \
                    pDIO->DataPin) ? 1 : 0;
            sample->Values |= ( val << i );
        }
    }
    
    return true;
}

void DIO_Tasks( DIOSample* latest, DIOSampleList* pSreamingSamples )
{
//    // For debugging streaming frequency only!
//    runtimeConfig->Data[0].Value = !runtimeConfig->Data[0].Value;
    
    DIORuntimeArray* DIOChruntimeConfig = BoardRunTimeConfig_Get(           \
                    BOARDRUNTIMECONFIG_DIO_CHANNELS );
    DIOConfig *pChannelConfig;
    DIORuntimeConfig* pChannelRuntimeConfig;
    bool *pDIOGlobalEnable = BoardRunTimeConfig_Get (                       \
                    BOARDRUNTIMECONFIG_DIO_ENABLE );
    StreamingRuntimeConfig *pStreamingConfig =                              \
                    BoardRunTimeConfig_Get(                                 \
                                BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION );
    size_t i = 0;
    
    // Write DIO values
    for (i=0; i< DIOChruntimeConfig->Size; ++i ){
        pChannelConfig = BoardConfig_Get(                                             \
                    BOARDCONFIG_DIO_CHANNEL, i );
        pChannelRuntimeConfig = &DIOChruntimeConfig->Data[i];
        DIO_WriteStateSingle( pChannelConfig, pChannelRuntimeConfig );
    }
    
    // Read DIO values
    if( DIO_ReadSampleByMask( latest, 0xFFFF ) ){
        // If streaming and the DIO is globally enabled,
        // push the values onto the list
        if( *pDIOGlobalEnable && pStreamingConfig->IsEnabled ){            
            streamingSample.Mask = 0xFFFF;
            streamingSample.Values = latest->Values;
            streamingSample.Timestamp = latest->Timestamp;
            DIOSampleList_PushBack( pSreamingSamples, &streamingSample );
        }
    }
    
}
