#include "BoardRuntimeConfig.h"

// The default board configuration
// TODO: It would be handly if this was at a special place in memory so we could flash just the board config (vs recompiling the firmware w/ a different configuration)
const BoardRuntimeConfig g_NQ1BoardRuntimeConfig = {
    .DIOChannels = {
        .Data = {
            {.IsInput = true, .IsReadOnly = false, .Value = false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
            {true, false, false},
        },
        .Size = 16,
    },
    .DIOGlobalEnable = false,
    .AInModules = {
        .Data = {
            {.IsEnabled = true, .Range = 5.0},
        },
        .Size = 1,
    },
    .AInChannels = {
        .Data = {
            // Public Internal ADC
            {.IsEnabled = false, .IsDifferential = false, .Frequency = 0, .CalM = 1, .CalB = 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0}, // Ch 0
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0}, // Ch 1
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0}, // Ch 2
            {false, false, 0, 1, 0},
            {false, false, 0, 1, 0}, // Ch 3
            {false, false, 0, 1, 0},
            
            // Private Internal ADC
            {.IsEnabled = true, .IsDifferential = false, .Frequency = 0, .CalM = 1, .CalB = 0},
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
        },
        .Size = 24
    },
    .PowerWriteVars = {
       .EN_Vref_Val = false,    // Vref rail off
       .EN_3_3V_Val = false,     // 3.3V rail off
       .EN_5_10V_Val = false,   // 5V rail off
       .EN_5V_ADC_Val = false,   // 5V ADC rail off
       .EN_12V_Val = true,      // 12V rail off (inverse logic)
       .MCP73871WriteVars.SEL_Val = true,  // true = charger - but we cannot assume charger until we've checked TODO:change this back to false for production
       .MCP73871WriteVars.PROG2_Val = false, // true = 500mA false = 100mA - must assume 100mA until we've checked
       .MCP73871WriteVars.TE_Val = true,    // Timer Enable; Enables Safety Timer when active Low - no charging so no timer
       .MCP73871WriteVars.CE_Val = false,   // Device Charge Enable; Enabled when CE = High - don't begin charging until we've checked charger status
    },
    .UIWriteVars = {
        .LED1 = false,
        .LED2 = false,
    },
    .StreamingConfig = {
        .IsEnabled = false,
        .TimerHandle = 0,
        .Running = false,
        .ClockDivider = 50000000,   // 1 sec default
        .StreamCountTrigger = 0,
        .StreamCount = 0,
        .Encoding = Streaming_ProtoBuffer,
        .TSTimerHandle = 0,
        .TSClockDivider = 0xFFFFFFFF,   // maximum
    },
    .wifiSettings = {
        .type = DaqifiSettings_Wifi
    },
    //.usbSettings = {0},
    //.serverData = {0}
};
