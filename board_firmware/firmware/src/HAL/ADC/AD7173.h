/* 
 * File:   AD7173.h
 * Author: Daniel
 *
 * Created on March 29, 2017, 12:01 PM
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
     * @param moduleConfig The module configuration
     * @param channelConfig The channel configuration
     */
    bool AD7173_InitHardware(const AD7173ModuleConfig* moduleConfig, const AInArray* channelConfig);

    /**
     * Updates the module state based on the provided config
     */
    bool AD7173_WriteModuleState(const AD7173ModuleConfig* moduleConfig, AInModuleRuntimeConfig* moduleRuntimeConfig, bool isPowered);
    
    /**
     * Sets the state for all ADC channels
     */
    bool AD7173_WriteStateAll(const AD7173ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfig,
            AInRuntimeArray* channelRuntimeConfig);
    
    /**
     * Updates the state for a single ADC channel
     */
    bool AD7173_WriteStateSingle(const AD7173ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AD7173ChannelConfig* channelConfig,
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
    bool AD7173_ReadSamples(AInSampleArray* samples, const AD7173ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfig,
            AInRuntimeArray* channelRuntimeConfig,
            uint32_t triggerTimeStamp);

    /**
     * Triggers a conversion
     * @param moduleConfig Describes the hardware configuration
     * @return true on success, false otherwise
     */
    bool AD7173_TriggerConversion(const AD7173ModuleConfig* moduleConfig);
    
    /**
     * Calculates a voltage based on the given sample
     * NOTE: This is NOT safe to call in an ISR
     * @param channelConfig Information about the channel
     * @param runtimeConfig Runtime channel information
     * @param moduleConfig The module configuration
     * @param sample The sample to process
     * @return The converted voltage
     */
    double AD7173_ConvertToVoltage(const AD7173ChannelConfig* channelConfig,
            const AInRuntimeConfig* runtimeConfig,
            const AD7173ModuleConfig* moduleConfig,
            const AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInSample* sample);
    
#ifdef	__cplusplus
}
#endif


