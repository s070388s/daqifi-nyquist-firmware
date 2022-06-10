/*! @file BoardRunTimeConfig.c
 * @brief Implementation of the board runtime configuration module
 * 
 * @author Javier Longares Abaiz
 * j.longares@abluethinginthecloud.com
 * 
 * A Blue Thing In The Cloud S.L.U.
 *   === When Technology becomes art ===
 * www.abluethinginthecloud.com
 *     
 */

#include "BoardRuntimeConfig.h"

tBoardRuntimeConfig __attribute__((coherent)) g_BoardRuntimeConfig;

/*! Function for initializaing the board realtime configuration data structure
 * @param[in] boardVariant Board Variant
 */
void BoardRunTimeConfig_Init( enum eBoardVariant boardVariant )
{
    // Initialize variable to known state
    memset( &g_BoardRuntimeConfig, 0, sizeof(g_BoardRuntimeConfig) );
    
    switch( boardVariant )
    {
    case BOARDRINTIMECONFIG_NQ3:
        memcpy(                                                             \
                            &g_BoardRuntimeConfig,                          \
                            &g_NQ3BoardRuntimeConfig,                       \
                            sizeof(tBoardRuntimeConfig) );
        break;
    case BOARDRINTIMECONFIG_NQ2:
        memcpy(                                                             \
                            &g_BoardRuntimeConfig,                          \
                            &g_NQ2BoardRuntimeConfig,                       \
                            sizeof(tBoardRuntimeConfig) );
        break;
    case BOARDRINTIMECONFIG_NQ1: // Everything else is an NQ1
    default:
        memcpy(                                                             \
                            &g_BoardRuntimeConfig,                          \
                            &g_NQ1BoardRuntimeConfig,                       \
                            sizeof(tBoardRuntimeConfig) );
        break;
    }
}

/*! Function for getting a parameter from the internal board runtime 
 * configuration data structure
 + @param[in] parameter Parameter to be get
 * @return Pointer to the parameter
 */
const void *BoardRunTimeConfig_Get( enum eBoardRTParameters parameter )
{
    switch( parameter ){
        case BOARDRUNTIMECONFIG_DIO_CHANNELS:
            return &g_BoardRuntimeConfig.DIOChannels;
            
        case BOARDRUNTIMECONFIG_DIO_ENABLE:
            return &g_BoardRuntimeConfig.DIOGlobalEnable;
            
        case BOARDRUNTIMECONFIG_AIN_MODULES:
            return &g_BoardRuntimeConfig.AInModules;
            
        case BOARDRUNTIMECONFIG_AIN_CHANNELS:
            return &g_BoardRuntimeConfig.AInChannels;
            
        case BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES:
            return &g_BoardRuntimeConfig.PowerWriteVars;
            
        case BOARDRUNTIMECONFIG_UI_WRITE_VARIABLES:
            return &g_BoardRuntimeConfig.UIWriteVars;
            
        case BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION:
            return &g_BoardRuntimeConfig.StreamingConfig;
            
        case BOARDRUNTIMECONFIG_WIFI_SETTINGS:
            return &g_BoardRuntimeConfig.wifiSettings;
            
        case BOARDRUNTIMECONFIG_USB_SETTINGS:
            return &g_BoardRuntimeConfig.usbSettings;
            
        case BOARDRUNTIMECONFIG_TCP_SERVER_DATA:
            return &g_BoardRuntimeConfig.serverData;
            
        case BOARDRUNTIECONFIG_NUM_OF_PARAMETERS:
        default:
            return NULL;
    }
}

/*! This function is used for setting a board runtime configuration parameter
 * @param[in] parameter Parameter to be set
 * @param[in] index In case that the parameter is an array, an index can be 
 * specified here for setting a specific member of the array
 * @param[in] pSetValue Pointer to the configuration value to be set
 */
void BoardRunTimeConfig_Set(                                                \
                            enum eBoardRTParameters parameter,              \
                            uint8_t index,                                  \
                            const void *pSetValue )
{
    if( NULL == pSetValue ){
        return;
    }
    
    switch( parameter ){
        case BOARDRUNTIMECONFIG_DIO_CHANNELS:
            if( index < g_BoardRuntimeConfig.DIOChannels.Size ){
                memcpy(                                                     \
                            &g_BoardRuntimeConfig.DIOChannels.Data[ index ],\
                            pSetValue,                                      \
                            sizeof(DIORuntimeConfig) );
            }
            break;
            
        case BOARDRUNTIMECONFIG_DIO_ENABLE:
            g_BoardRuntimeConfig.DIOGlobalEnable = *(bool *)pSetValue;
            break;
            
        case BOARDRUNTIMECONFIG_AIN_MODULES:
            if( index < g_BoardRuntimeConfig.AInModules.Size ){
                memcpy(                                                     \
                            &g_BoardRuntimeConfig.AInModules.Data[ index ], \
                            pSetValue,                                      \
                            sizeof( AInModuleRuntimeConfig) );
            }
            break;
            
        case BOARDRUNTIMECONFIG_AIN_CHANNELS:
            if( index < g_BoardRuntimeConfig.AInChannels.Size ){
                memcpy(                                                     \
                            &g_BoardRuntimeConfig.AInChannels.Data[ index ],\
                            pSetValue,                                      \
                            sizeof(AInRuntimeConfig) );
            }
            break;
            
        case BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES:
            memcpy(                                                         \
                    &g_BoardRuntimeConfig.PowerWriteVars,                   \
                    pSetValue,                                              \
                    sizeof(tPowerWriteVars) );
            break;
            
        case BOARDRUNTIMECONFIG_UI_WRITE_VARIABLES:
            memcpy(                                                         \
                    &g_BoardRuntimeConfig.UIWriteVars,                      \
                    pSetValue,                                              \
                    sizeof(sUIWriteVars) );
            break;
            
        case BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION:
            memcpy(                                                         \
                    &g_BoardRuntimeConfig.StreamingConfig,                  \
                    pSetValue,                                              \
                    sizeof(StreamingRuntimeConfig) );
            break;
            
        case BOARDRUNTIMECONFIG_WIFI_SETTINGS:
            memcpy(                                                         \
                    &g_BoardRuntimeConfig.wifiSettings,                     \
                    pSetValue,                                              \
                    sizeof(DaqifiSettings) );
            break;
            
        case BOARDRUNTIMECONFIG_USB_SETTINGS:
            memcpy(                                                         \
                    &g_BoardRuntimeConfig.usbSettings,                      \
                    pSetValue,                                              \
                    sizeof(UsbCdcData) );
            break;
            
        case BOARDRUNTIMECONFIG_TCP_SERVER_DATA:
            memcpy(                                                         \
                    &g_BoardRuntimeConfig.serverData,                       \
                    pSetValue,                                              \
                    sizeof(TcpServerData) );
            break;
            
        case BOARDRUNTIECONFIG_NUM_OF_PARAMETERS:
        default:
            return;
    }
}

