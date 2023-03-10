#pragma once

#include "AInSample.h"
#include "DIOSample.h"
#include "Util/HeapList.h"
#include "HAL/Power/PowerApi.h"
#include "HAL/UI/UI.h"
#include "HAL/NVM/DaqifiSettings.h"

#ifdef __cplusplus
extern "C" {
#endif    
    /**
     * Defines the data space for the board's acquisition functions to use
     */
    typedef struct s_BoardData
    {
        /**
         * Indicates whether the application is currently inside of an isr
         */
        int InISR;
        
        /**
         * The latest DIO sample
         */
        DIOSample DIOLatest;
        
        /**
         * Collected DIO samples
         */
        DIOSampleList DIOSamples;
        
        /**
         * The current state of the module
         */
        AInModDataArray AInState;

        /**
         * The latest AIn samples
         */
        AInSampleArray AInLatest;
        
        /**
         * Collected Analog-input samples
         */
        AInSampleList AInSamples;
        
        /**
         * Global Power structure
         */
        sPowerData PowerData;
        
        /**
         * Global UI Structure
         */
        sUIReadVars UIReadVars;
        
        /**
         * The active wifi settings
         */
        DaqifiSettings wifiSettings;
        
        /**
         * The streaming trigger timestamp
         */
        uint32_t StreamTrigStamp; //The current module's streaming trigger timestamp
    } BoardData;
    
    /**
     * The board configuration
     */
    extern BoardData __attribute__((coherent)) g_BoardData;

    /**
     * Initializes the board data 
     */
    void InitializeBoardData(BoardData* boardData);
    
#ifdef __cplusplus
}
#endif