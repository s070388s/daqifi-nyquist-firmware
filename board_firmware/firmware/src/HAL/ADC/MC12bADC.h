/* 
 * File:   MC12bADC.h
 * Author: Daniel
 *
 * Created on March 29, 2017, 12:03 PM
 */

#pragma once

#include "state/board/AInConfig.h"
#include "state/runtime/AInRuntimeConfig.h"
#include "state/data/AInSample.h"


#ifdef	__cplusplus
extern "C" {
#endif

    /**
     * Performs board initialization
     * @param boardConfig The module configuration
     * @param channelConfig The channel configuration
     */
    bool MC12b_InitHardware(const MC12bModuleConfig* boardConfig, const AInArray* channelConfig);

    /**
     * Updates the module state based on the provided config
     */
    bool MC12b_WriteModuleState(const MC12bModuleConfig* moduleConfig, AInModuleRuntimeConfig* moduleRuntimeConfig);
    
    /**
     * Sets the state for all ADC channels
     */
    bool MC12b_WriteStateAll(const MC12bModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfig,
            AInRuntimeArray* channelRuntimeConfig);
    
    /**
     * Updates the state for a single ADC channel
     */
    bool MC12b_WriteStateSingle(const MC12bModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const MC12bChannelConfig* channelConfig,
            AInRuntimeConfig* channelRuntimeConfig);
    
    /**
     * Populates the sample array using data in the board config
     * @param samples [out] The array to populate
     * @param moduleConfig The static module configuration for the board
     * @param moduleRuntimeConfig The module runtime configuration for the board
     * @param channelConfig The static channel configuration for the board
     * @param channelRuntimeConfig The runtime channel configuration for the board
     * @param triggerTimeStamp The timestamp when the module was most recently triggered to convert
     */
    bool MC12b_ReadSamples(AInSampleArray* samples, const MC12bModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfig,
            AInRuntimeArray* channelRuntimeConfig,
            uint32_t triggerTimeStamp);
    
    /**
     * Triggers a conversion
     * @param boardConfig Describes the hardware configuration
     * @return true on success, false otherwise
     */
    bool MC12b_TriggerConversion(const MC12bModuleConfig* boardConfig);

    /**
     * Calculates a voltage based on the given sample
     * NOTE: This is NOT safe to call in an ISR
     * @param channelConfig Information about the channel
     * @param runtimeConfig Runtime channel information
     * @param moduleConfig The module configuration
     * @param sample The sample to process
     * @return The converted voltage
     */
    double MC12b_ConvertToVoltage(const MC12bChannelConfig* channelConfig,
            const AInRuntimeConfig* runtimeConfig,
            const MC12bModuleConfig* moduleConfig,
            const AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInSample* sample);
    
#ifdef	__cplusplus
}
#endif


