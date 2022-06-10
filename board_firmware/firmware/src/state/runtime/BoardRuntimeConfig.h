/*! @file BoardRunTimeConfig.h
 * @brief Header of the board configuration module
 * 
 * @author Javier Longares Abaiz
 * j.longares@abluethinginthecloud.com
 * 
 * A Blue Thing In The Cloud S.L.U.
 *   === When Technology becomes art ===
 * www.abluethinginthecloud.com
 *     
 */

#ifndef __BOARDRUNTIMECONFIG_H__
#define __BOARDRUNTIMECONFIG_H__

#include "system_config.h"
#include "system_definitions.h"

#include "AInRuntimeConfig.h"
#include "DIORuntimeConfig.h"
#include "StreamingRuntimeConfig.h"
#include "TcpServerConfig.h"
#include "UsbRuntimeConfig.h"
#include "Util/ArrayWrapper.h"
#include "HAL/Power/PowerApi.h"
#include "HAL/UI/UI.h"
#include "HAL/NVM/DaqifiSettings.h"

#ifdef __cplusplus
extern "C" {
#endif
    
//! Enumeration with the board runtime configuration parameters
enum eBoardRTParameters{
    //! Digital I/O channels
    BOARDRUNTIMECONFIG_DIO_CHANNELS,
    //! Digital I/O enable
    BOARDRUNTIMECONFIG_DIO_ENABLE,
    //! Analog Input modules
    BOARDRUNTIMECONFIG_AIN_MODULES,
    //! Analog Input channels
    BOARDRUNTIMECONFIG_AIN_CHANNELS,
    //! Power Write Variables
    BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES,
    //! User Interface Write Variables
    BOARDRUNTIMECONFIG_UI_WRITE_VARIABLES,
    //! Streaming configuration
    BOARDRUNTIMECONFIG_STREAMING_CONFIGURATION,
    //! WiFi Settings
    BOARDRUNTIMECONFIG_WIFI_SETTINGS,
    //! USB Settings
    BOARDRUNTIMECONFIG_USB_SETTINGS,
    //! TCP Server related data
    BOARDRUNTIMECONFIG_TCP_SERVER_DATA,
    //! Number of runtime configurable parameters of the board
    BOARDRUNTIECONFIG_NUM_OF_PARAMETERS
};

//! Enumeration with the board variants
enum eBoardVariant{
    //! Niquist 1 board
    BOARDRINTIMECONFIG_NQ1 = 1,
    //! Niquist 2 board
    BOARDRINTIMECONFIG_NQ2 = 2,
    //! Niquist 3 board
    BOARDRINTIMECONFIG_NQ3 = 3,
};
    
/*! @struct sBoardRunTimeConfig
 * @brief Data structure with the fields of the intrinsic /inmutable
 * configuration
 * @typedef tBoardRunTimeConfig
 * @brief Data type related to the structure sBoardRunTimeConfig
 */
typedef struct sBoardRuntimeConfig
{
    /**
     * Runtime settings for the digital IO channels
     * This is an array where index = channel and data = configuration
     */
    DIORuntimeArray DIOChannels;

    /**
     * The defined digital IO global enable
     * This is an bool which defines the global DIO enable (true, DIO is transmitted when streaming)
     */
    bool DIOGlobalEnable;

    /**
     * Runtime settings for the analog input modules
     * This is an array where index = module and data = configuration
     */
    AInModRuntimeArray AInModules;

    /**
     * Runtime settings for the analog input channels
     * This is an array where index = channel and data = configuration
     */
    AInRuntimeArray AInChannels;

    // Power Variables that can be written
    tPowerWriteVars PowerWriteVars;

    //! UI Variables that can be written
    sUIWriteVars UIWriteVars;

    //! Streaming configuration
    StreamingRuntimeConfig StreamingConfig;

    /**
     * The desired wifi settings
     */
    DaqifiSettings wifiSettings;

    /**
     * The desired USB settings
     */
    UsbCdcData usbSettings;

    /**
     * The TCP server state
     */
    TcpServerData serverData;
}tBoardRuntimeConfig;


   /**
 * The board configuration
 */
extern tBoardRuntimeConfig __attribute__((coherent)) g_BoardRuntimeConfig;

/**
 * The Nyquist 1 board configuration
 */
extern const tBoardRuntimeConfig g_NQ1BoardRuntimeConfig;

/**
 * The Nyquist 2 board configuration
 */
extern const tBoardRuntimeConfig g_NQ2BoardRuntimeConfig;

/**
 * The Nyquist 3 board configuration
 */
extern const tBoardRuntimeConfig g_NQ3BoardRuntimeConfig;
    
/*! Function for initializaing the board realtime configuration data structure
 * @param[in] boardVariant Board Variant
 */
void BoardRunTimeConfig_Init(enum eBoardVariant boardVariant);

/*! Function for getting a parameter from the internal board runtime 
 * configuration data structure
 + @param[in] parameter Parameter to be get
 * @return Pointer to the parameter
 */
const void *BoardRunTimeConfig_Get( enum eBoardRTParameters parameter );

/*! This function is used for setting a board runtime configuration parameter
 * @param[in] parameter Parameter to be set
 * @param[in] index In case that the parameter is an array, an index can be 
 * specified here for setting a specific member of the array
 * @param[in] pSetValue Pointer to the configuration value to be set
 */
void BoardRunTimeConfig_Set(                                                \
                            enum eBoardRTParameters parameter,              \
                            uint8_t index,                                  \
                            const void *pSetValue );
#ifdef __cplusplus
}
#endif

#endif /* __BOARDRUNTIMECONFIG_H__ */