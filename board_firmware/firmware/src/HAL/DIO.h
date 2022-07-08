/* 
 * File:   DIO.h
 * Author: Daniel
 * The DIO Driver using the new state functions
 */

#pragma once

#include "state/board/DIOConfig.h"
#include "state/runtime/DIORuntimeConfig.h"
#include "state/data/DIOSample.h"
#include "state/runtime/BoardRuntimeConfig.h"

#ifdef	__cplusplus
extern "C" {
#endif
    /**
     * Performs board initialization
     */
    bool DIO_InitHardware( void );

    /**
     * Sets the initial state for all DIO channelss
     */
    bool DIO_WriteStateAll( void );
    
    /**
     * Updates the state for a single DIO channel
     */
    bool DIO_WriteStateSingle(                                              \
                    const DIOConfig* boardConfig,                           \
                    DIORuntimeConfig* runtimeConfig );
    
    /**
     * Generates a sample based all enabled samples included in the mask
     * @param sample The sample to populate
     * @param mask Defines the channels that will be included
     */
    bool DIO_ReadSampleByMask(                                              \
                    DIOSample* sample,                                      \
                    uint32_t mask );
    
    /**
     * Performs periodic tasks for DIO
     * @param latest Storage for the latest values
     * @param streamingSamples Storage for the latest streaming values
     */
    void DIO_Tasks( DIOSample* latest, DIOSampleList* pSreamingSamples );
    
#ifdef	__cplusplus
}
#endif

