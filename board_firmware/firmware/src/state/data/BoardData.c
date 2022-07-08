/*! @file BoardConfig.c
 * @brief Implementation of the board data module
 * 
 * @author Javier Longares Abaiz
 * j.longares@abluethinginthecloud.com
 * 
 * A Blue Thing In The Cloud S.L.U.
 *   === When Technology becomes art ===
 * www.abluethinginthecloud.com
 *     
 */

#include "BoardData.h"

#include "Util/NullLockProvider.h"
#include "../../HAL/ADC.h"
tBoardData __attribute__((coherent)) g_BoardData;

/*! Initializes the board data 
 * @param[in] pBoardData Pointer to the data structure to be initialized
 */
void BoardData_Init( void )
{    
    tBoardData *pBoardData = &g_BoardData;
    
    // Initialize variable to known state
    memset( &g_BoardData, 0, sizeof(g_BoardData) );
        
    memset( &pBoardData->DIOLatest, 0, sizeof(DIOSample) );
    DIOSampleList_Initialize(                                               \
                            &pBoardData->DIOSamples,                        \
                            MAX_DIO_SAMPLE_COUNT,                           \
                            false,                                          \
                            &g_NullLockProvider);
    
    memset(&pBoardData->AInState, 0, sizeof(AInModDataArray));
    
    memset(&pBoardData->AInLatest, 0, sizeof(AInSampleArray));
    pBoardData->AInLatest.Size = MAX_AIN_DATA_MOD;
    AInSampleList_Initialize(                                               \
                            &pBoardData->AInSamples,                        \
                            MAX_AIN_SAMPLE_COUNT,                           \
                            false,                                          \
                            &g_NullLockProvider );
    
    // Set default battery values for debugging - allows power on without 
    // ADC active
    // TODO: This should be omitted for production
    // size_t index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, 
    // ADC_CHANNEL_VBATT);
    // boardData->AInLatest.Data[index].Value = 4095;
    
    pBoardData->PowerData.powerState = MICRO_ON;
    pBoardData->PowerData.battLow = false;
    pBoardData->PowerData.battVoltage = 0.0;
    pBoardData->PowerData.chargePct = 0;
    pBoardData->PowerData.USBSleep = false;
    // Initialize to NO_CHANGE nominally for debugging, can use DO_POWER_UP to 
    // power immediately
    pBoardData->PowerData.requestedPowerState = NO_CHANGE;
    pBoardData->PowerData.powerDnAllowed = false;
    pBoardData->PowerData.externalPowerSource = NO_EXT_POWER;
    pBoardData->PowerData.BQ24297Data.chargeAllowed = true;
   
    
    pBoardData->UIReadVars.LED1 = false;
    pBoardData->UIReadVars.LED2 = false;
    pBoardData->UIReadVars.button = false;
    pBoardData->wifiSettings.type = DaqifiSettings_Wifi;
    
}


/*! This function is used for getting a board data parameter
 * @param[in] parameter Parameter to be get
 * @param[in] index In case that the parameter is an array, an index can be 
 * specified here for getting a specific member of the array
 * @return Parameter which is part of the global Board Configuration structure
 */
const void *BoardData_Get(                                                  \
                            enum eBoardData parameter,                      \
                            uint8_t index )
{
    switch( parameter ){
        case BOARDDATA_IN_ISR:
            return &g_BoardData.InISR;
        case BOARDDATA_DIO_LATEST:
            return &g_BoardData.DIOLatest;
        case BOARDDATA_DIO_SAMPLES:
            return &g_BoardData.DIOSamples;
        case BOARDATA_AIN_MODULE:
            if( index < g_BoardData.AInState.Size ){
                return &g_BoardData.AInState.Data[ index ];
            }
            return NULL;
        case BOARDDATA_AIN_LATEST:
            if( index < g_BoardData.AInLatest.Size ){
                return &g_BoardData.AInLatest.Data[ index ];
            }
            return NULL;
        case BOARDDATA_AIN_SAMPLES:
            return &g_BoardData.AInSamples;
        case BOARDATA_POWER_DATA:
            return &g_BoardData.PowerData;
        case BOARDDATA_UI_VARIABLES:
            return &g_BoardData.UIReadVars;
        case BOARDDATA_WIFI_SETTINGS:
            return &g_BoardData.wifiSettings;
        case BOARDDATA_STREAMING_TIMESTAMP:
            return &g_BoardData.StreamTrigStamp;
        case BOARDDATA_NUM_OF_FIELDS:
        default:
            return NULL;
    }
}

/*! This function is used for setting a board data parameter
 * @param[in] parameter Parameter to be set
 * @param[in] index In case that the parameter is an array, an index can be 
 * specified here for setting a specific member of the array
 * @param[in] pSetValue Pointer to the configuration value to be set
 */
void BoardData_Set(                                                         \
                            enum eBoardData parameter,                      \
                            uint8_t index,                                  \
                            const void *pSetValue )
{
    if( NULL == pSetValue ){
        return;
    }
    
    switch( parameter ){
        case BOARDDATA_IN_ISR:
            memcpy(                                                         \
                            &g_BoardData.InISR,                             \
                            pSetValue,                                      \
                            sizeof(g_BoardData.InISR) );
            break;
        case BOARDDATA_DIO_LATEST:
            memcpy(                                                         \
                            &g_BoardData.DIOLatest,                         \
                            pSetValue,                                      \
                            sizeof(g_BoardData.DIOLatest) );
            break;
        case BOARDDATA_DIO_SAMPLES:
            memcpy(                                                         \
                            &g_BoardData.DIOSamples.List,                   \
                            pSetValue,                                      \
                            sizeof(g_BoardData.DIOSamples) );
            break;
        case BOARDATA_AIN_MODULE:
            if( index < g_BoardData.AInState.Size ){
                memcpy(                                                     \
                            &g_BoardData.AInState.Data[ index ],            \
                            pSetValue,                                      \
                            sizeof(AInSample) );
            }
            break;
        case BOARDDATA_AIN_LATEST:
            if( index < g_BoardData.AInLatest.Size ){
                memcpy(                                                     \
                            &g_BoardData.AInLatest.Data[ index ],           \
                            pSetValue,                                      \
                            sizeof(AInSample) );
            }
            break;
        case BOARDDATA_AIN_SAMPLES:
            memcpy(                                                         \
                            &g_BoardData.AInSamples.List,                   \
                            pSetValue,                                      \
                            sizeof(HeapList) );
            break;
        case BOARDATA_POWER_DATA:
            memcpy(                                                         \
                            &g_BoardData.PowerData,                         \
                            pSetValue,                                      \
                            sizeof(g_BoardData.PowerData) );
            break;
        case BOARDDATA_UI_VARIABLES:
            memcpy(                                                         \
                            &g_BoardData.UIReadVars,                        \
                            pSetValue,                                      \
                            sizeof(g_BoardData.UIReadVars) );
            break;
        case BOARDDATA_WIFI_SETTINGS:
            memcpy(                                                         \
                            &g_BoardData.wifiSettings,                      \
                            pSetValue,                                      \
                            sizeof(g_BoardData.wifiSettings) );
            break;
        case BOARDDATA_STREAMING_TIMESTAMP:
            memcpy(                                                         \
                            &g_BoardData.StreamTrigStamp,                   \
                            pSetValue,                                      \
                            sizeof(g_BoardData.StreamTrigStamp) );
            break;
        case BOARDDATA_NUM_OF_FIELDS:
        default:
            break;
    }
}
