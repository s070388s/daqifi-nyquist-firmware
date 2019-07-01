#pragma once


#include "AInConfig.h"
#include "DIOConfig.h"
#include "StreamingConfig.h"
#include "HAL/Power/PowerApi.h"
#include "HAL/UI/UI.h"
#include "HAL/NVM/DaqifiSettings.h"
#include "HAL/BQ24297/BQ24297.h"


#ifdef __cplusplus
extern "C" {
#endif
    /**
     * Defines the intrinsic/immutable board configuration
     */
    typedef struct s_BoardConfig
    {
        //The board variant we are configured to run
        uint8_t BoardVariant;
        
        /**
         * The board hardware revision
         */
        char boardHardwareRev[16];
        
        /**
         * The board firmware revision
         */
        char boardFirmwareRev[16]; 
        
        /**
         * The board serial number
         */
        uint64_t boardSerialNumber;   
        
        /**
         * The defined digital IO channels
         * This is an array where index = channel and data = configuration
         */
        DIOArray DIOChannels;
        
        /**
         * The defined analog input modules
         * This is an array where index = module and data = configuration
         */
        AInModArray AInModules;
        
        /**
         * The defined analog input channels
         * This is an array where index = channel and data = configuration
         */
        AInArray AInChannels;
        
        //Power Structure
        sPowerConfig PowerConfig;
        
        //User Interface Structure
        sUIConfig UIConfig;
        
        StreamingConfig StreamingConfig;
    } BoardConfig;
    
    /**
     * The board configuration
     */
    extern BoardConfig g_BoardConfig;
    
    /**
     * The Nyquist 1 board configuration
     */
    extern const BoardConfig g_NQ1BoardConfig;
    
    /**
     * The Nyquist 2 board configuration
     */
    extern const BoardConfig g_NQ2BoardConfig;
    
    /**
     * The Nyquist 3 board configuration
     */
    extern const BoardConfig g_NQ3BoardConfig;
    
    /**
     * Initializes the g_BoardConfig structure for the current board
     */
    void InitBoardConfig(TopLevelSettings* topLevelSettings);
    
#ifdef __cplusplus
}
#endif