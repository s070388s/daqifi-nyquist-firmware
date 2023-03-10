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

#ifdef	__cplusplus
}
#endif
