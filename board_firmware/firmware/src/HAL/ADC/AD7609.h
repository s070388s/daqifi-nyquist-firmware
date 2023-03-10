/* 
 * File:   AD7609.h
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
     * @param boardConfig The module configuration
     * @param channelConfig The channel configuration
     */
    bool AD7609_InitHardware(const AD7609ModuleConfig* boardConfig, const AInArray* channelConfig);

    /**
     * Updates the module state based on the provided config
     */
    bool AD7609_WriteModuleState(const AD7609ModuleConfig* moduleConfig, AInModuleRuntimeConfig* moduleRuntimeConfig, bool isPowered);
    
    /**
     * Sets the state for all ADC channels
     */
    bool AD7609_WriteStateAll(const AD7609ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfig,
            AInRuntimeArray* channelRuntimeConfig);
    
    /**
     * Updates the state for a single ADC channel
     */
    bool AD7609_WriteStateSingle(const AD7609ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AD7609ChannelConfig* channelConfig,
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
    bool AD7609_ReadSamples(AInSampleArray* samples, const AD7609ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfig,
            AInRuntimeArray* channelRuntimeConfig,
            uint32_t triggerTimeStamp);
    
    /**
     * Triggers a conversion
     * @param moduleConfig Describes the hardware configuration
     * @return true on success, false otherwise
     */
    bool AD7609_TriggerConversion(const AD7609ModuleConfig* moduleConfig);
    
    /**
     * Calculates a voltage based on the given sample
     * NOTE: This is NOT safe to call in an ISR
     * @param channelConfig Information about the channel
     * @param runtimeConfig Runtime channel information
     * @param moduleConfig The module configuration
     * @param sample The sample to process
     * @return The converted voltage
     */
    double AD7609_ConvertToVoltage(const AD7609ChannelConfig* channelConfig,
            const AInRuntimeConfig* runtimeConfig,
            const AD7609ModuleConfig* moduleConfig,
            const AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInSample* sample);
    
#ifdef	__cplusplus
}
#endif


