#pragma once

#include "scpi/scpi.h"

#ifdef	__cplusplus
extern "C" {
#endif

/**
 * SCPI Callback: Sets the direction of one or more pins
 * @param context The associated SCPI context
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIODirectionSet(scpi_t * context);

/**
 * SCPI Callback: Gets the direction of one or more pins
 * @param context The associated SCPI context
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIODirectionGet(scpi_t * context);

/**
 * SCPI Callback: Sets the state of one or more pins
 * @param context The associated SCPI context
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOStateSet(scpi_t * context);

/**
 * SCPI Callback: Gets the state of one or more pins
 * @param context The associated SCPI context
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOStateGet(scpi_t * context);

/**
 * SCPI Callback: Enables or disables one or more more pins
 * @param context The associated SCPI context
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOEnableSet(scpi_t * context);

/**
 * SCPI Callback: Gets the enable status of one or more pins
 * @param context The associated SCPI context
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOEnableGet(scpi_t * context);

/**
 * Sets the GPIO direction for a single pin
 * @param id The id of the pin to change
 * @param isInput Indicates whether the value is an input
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOSingleDirectionSet(uint8_t id, bool isInput);

/**
 * Sets the GPIO direction for all pins
 * @param mask A mask where each bit corresponds to the pin with the given id (BIT(1) == PIN(1))
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOMultiDirectionSet(uint32_t mask);

/**
 * Gets the direction of a single GPIO pin
 * @param id The id of the pin
 * @param result [out] The direction of the pin
 * @return A boolean indicating whether the pin is an output (true) or input (false)
 */
scpi_result_t SCPI_GPIOSingleDirectionGet(uint8_t id, bool* result);

/**
 * Gets the direction of all GPIO pins
 * @param mask [out] A mask where each bit corresponds to the pin with the given id (BIT(1) == PIN(1))
 * @return A value indicating successfullness of the operation
 */
scpi_result_t SCPI_GPIOMultiDirectionGet(uint32_t* mask);

/**
 * Sets the GPIO value for a single (output) pin
 * @param id The id of the pin to change
 * @param value The new value of the pin
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOSingleStateSet(uint8_t id, bool value);

/**
 * Sets the value (high/low) for all pins
 * @param mask A mask where each bit corresponds to the pin with the given id (BIT(1) == PIN(1))
 * @return SCPI_RES_OK on success SCPI_RES_ERR on error
 */
scpi_result_t SCPI_GPIOMultiStateSet(uint32_t mask);

/**
 * Gets the value of a single GPIO pin
 * @param id The id of the pin
 * @param result [out] The direction of the pin
 * @return A boolean indicating whether the pin is an output (true) or input (false)
 */
scpi_result_t SCPI_GPIOSingleStateGet(uint8_t id, bool* result);

/**
 * Gets the value (high/low) of all GPIO pins
 * @return A mask where each bit corresponds to the pin with the given id (BIT(1) == PIN(1))
 */
scpi_result_t SCPI_GPIOMultiStateGet(uint32_t* result);

#ifdef	__cplusplus
}
#endif
