#pragma once

#include "system_config.h"
#include "system_definitions.h"
#include <peripheral/peripheral.h>

#ifdef	__cplusplus
extern "C" {
#endif

    /**
     * Delays the processor by a specified number of ticks
     * @param ticks
     */
    void Delay(const uint32_t ticks);


#ifdef	__cplusplus
}
#endif
