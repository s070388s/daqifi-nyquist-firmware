#include "BoardConfig.h"

// The board configuration
// TODO: It would be handy if this was at a special place in memory so we could flash just the board config (vs recompiling the firmware w/ a different configuration)
const BoardConfig g_NQ1BoardConfig = {
    .BoardVariant = 1,
    .DIOChannels = {
        .Data = {
            {PORTS_ID_0, DIO_0_PORT, DIO_0_PIN, PORTS_ID_0, PORT_CHANNEL_D, PORTS_BIT_POS_2, false},
            {PORTS_ID_0, DIO_1_PORT, DIO_1_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_2, true},
            {PORTS_ID_0, DIO_2_PORT, DIO_2_PIN, PORTS_ID_0, PORT_CHANNEL_D, PORTS_BIT_POS_13, true},
            {PORTS_ID_0, DIO_3_PORT, DIO_3_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_0, false},
            {PORTS_ID_0, DIO_4_PORT, DIO_4_PIN, PORTS_ID_0, PORT_CHANNEL_D, PORTS_BIT_POS_7, true},
            {PORTS_ID_0, DIO_5_PORT, DIO_5_PIN, PORTS_ID_0, PORT_CHANNEL_K, PORTS_BIT_POS_7, false},
            {PORTS_ID_0, DIO_6_PORT, DIO_6_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_4, true},
            {PORTS_ID_0, DIO_7_PORT, DIO_7_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_5, false},
            {PORTS_ID_0, DIO_8_PORT, DIO_8_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_7, false},
            {PORTS_ID_0, DIO_9_PORT, DIO_9_PIN, PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_0, true},
            {PORTS_ID_0, DIO_10_PORT, DIO_10_PIN, PORTS_ID_0, PORT_CHANNEL_G, PORTS_BIT_POS_15, false},
            {PORTS_ID_0, DIO_11_PORT, DIO_11_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_10, true},
            {PORTS_ID_0, DIO_12_PORT, DIO_12_PIN, PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_2, true},
            {PORTS_ID_0, DIO_13_PORT, DIO_13_PIN, PORTS_ID_0, PORT_CHANNEL_E, PORTS_BIT_POS_7, false},
            {PORTS_ID_0, DIO_14_PORT, DIO_14_PIN, PORTS_ID_0, PORT_CHANNEL_A, PORTS_BIT_POS_5, true},
            {PORTS_ID_0, DIO_15_PORT, DIO_15_PIN, PORTS_ID_0, PORT_CHANNEL_J, PORTS_BIT_POS_12, false},  
        },
        .Size = 16,
    },
    .AInModules = {
        .Data = {
            {
                .Type = AIn_MC12bADC,
                .Config = {.MC12b = { .moduleId = DRV_ADC_ID_1, .Resolution = 4096 } },
                .Size = 16
            },
        },
        .Size = 1
    },
    .AInChannels = {
        .Data = {
            // Internal ADC
            // Internal scale = ((R2Ain)/(R1Ain+R2Ain)) * ((R1+R2)/(R2)) 
            // where RAin is the resistor divider for the 16 RAin channels
            // and R is the resistor divider for the internal channels
            
            {
                .ChannelId = 0,
                .DataModule = 0,
                .Config = {.MC12b = {.AllowDifferential = false, .BufferIndex = 11, .ChannelType = 2, .IsPublic = true, .InternalScale = 1}}
            },
            {
                .ChannelId = 1,
                .DataModule = 0,
                .Config = {.MC12b = {false, 24, 2, true, 1}}
            },
            {
                .ChannelId = 2,
                .DataModule = 0,
                .Config = {.MC12b = {false, 25, 2, true, 1}}
            },
            {
                .ChannelId = 3,
                .DataModule = 0,
                .Config = {.MC12b = {false, 26, 2, true, 1}}
            },
            {
                .ChannelId = 4,
                .DataModule = 0,
                .Config = {.MC12b = {false, 4, 1, true, 1}} // Type 1
            },
            {
                .ChannelId = 5,
                .DataModule = 0,
                .Config = {.MC12b = {false, 39, 2, true, 1}}
            },
            {
                .ChannelId = 6,
                .DataModule = 0,
                .Config = {.MC12b = {false, 38, 2, true, 1}}
            },
            {
                .ChannelId = 7,
                .DataModule = 0,
                .Config = {.MC12b = {false, 27, 2, true, 1}}
            },
            {
                .ChannelId = 8,
                .DataModule = 0,
                .Config = {.MC12b = {true, 0, 1, true, 1}} //Ch 0 using alternate pin AN45 - Type 1
            },
            {
                .ChannelId = 9,
                .DataModule = 0,
                .Config = {.MC12b = {false, 5, 2, true, 1}}
            },
            {
                .ChannelId = 10,
                .DataModule = 0,
                .Config = {.MC12b = {true, 1, 1, true, 1}} //Ch 1 using alternate pin AN46 - Type 1
            },
            {
                .ChannelId = 11,
                .DataModule = 0,
                .Config = {.MC12b = {false, 6, 2, true, 1}}
            },
            {
                .ChannelId = 12,
                .DataModule = 0,
                .Config = {.MC12b = {true, 2, 1, true, 1}} //Ch 2 using alternate pin AN47 - Type 1
            },
            {
                .ChannelId = 13,
                .DataModule = 0,
                .Config = {.MC12b = {false, 7, 2, true, 1}}
            },
            {
                .ChannelId = 14,
                .DataModule = 0,
                .Config = {.MC12b = {true, 3, 1, true, 1}} //Ch 3 using alternate pin AN48 - Type 1
            },
            {
                .ChannelId = 15,
                .DataModule = 0,
                .Config = {.MC12b = {false, 8, 2, true, 1}}
            },

            // ADC Channels for internal use
            // TODO: It may make sense to put these in the power settings.
            {
                .ChannelId = ADC_CHANNEL_3_3V,
                .DataModule = 0,
                .Config = {.MC12b = {false, 19, 2, false, 1}} // +3.3V_Mon
            },
            {
                .ChannelId = ADC_CHANNEL_2_5VREF,
                .DataModule = 0,
                .Config = {.MC12b = {false, 31, 2, false, 1}} // +2.5VRef_Mon
            },
            {
                .ChannelId = ADC_CHANNEL_VBATT,
                .DataModule = 0,
                .Config = {.MC12b = {false, 30, 2, false, 1}} // Vbat_Mon
            },
            {
                .ChannelId = ADC_CHANNEL_5V,
                .DataModule = 0,
                .Config = {.MC12b = {false, 42, 2, false, 2.16666666667}} // +5V_Prot_Mon
            },
            {
                .ChannelId = ADC_CHANNEL_10V,
                .DataModule = 0,
                .Config = {.MC12b = {false, 32, 2, false, 3.905000000000}} // +10_Prot_Mon
            },
            {
                .ChannelId = ADC_CHANNEL_TEMP,
                .DataModule = 0,
                .Config = {.MC12b = {false, 44, 2, false, 1}} // On board temperature sensor 5mV/degC 0->5V=-40degC
            },
            {
                .ChannelId = ADC_CHANNEL_5VREF,
                .DataModule = 0,
                .Config = {.MC12b = {false, 29, 2, false, 2.16666666667}} // On board +5V ref (only on Nq2)
            },
            {
                .ChannelId = ADC_CHANNEL_VSYS,
                .DataModule = 0,
                .Config = {.MC12b = {false, 41, 2, false, 1.409090909091}} // Board system power
            },
        },
        .Size = 24
    },
    .PowerConfig = {
        .EN_Vref_Ch = PORT_CHANNEL_J,
        .EN_Vref_Bit = PORTS_BIT_POS_15,
        .EN_3_3V_Ch = PORT_CHANNEL_H,
        .EN_3_3V_Bit = PORTS_BIT_POS_12,
        .EN_5_10V_Ch = PORT_CHANNEL_D,
        .EN_5_10V_Bit = PORTS_BIT_POS_0,
        .EN_12V_Ch = PORT_CHANNEL_H,
        .EN_12V_Bit = PORTS_BIT_POS_15,
        .USB_Dp_Ch = PORT_CHANNEL_H, 
        .USB_Dp_Bit = PORTS_BIT_POS_9, 
        .USB_Dn_Ch = PORT_CHANNEL_H, 
        .USB_Dn_Bit = PORTS_BIT_POS_10,
        .MCP73871Config = {
            .SEL_Ch = PORT_CHANNEL_A,
            .SEL_Bit = PORTS_BIT_POS_14,
            .PROG2_Ch = PORT_CHANNEL_K,
            .PROG2_Bit = PORTS_BIT_POS_6,
            .TE_Ch = PORT_CHANNEL_A,
            .TE_Bit = PORTS_BIT_POS_4,
            .CE_Ch = PORT_CHANNEL_H,
            .CE_Bit = PORTS_BIT_POS_11,
            .STAT1_Ch = PORT_CHANNEL_F,
            .STAT1_Bit = PORTS_BIT_POS_4,
            .STAT2_Ch = PORT_CHANNEL_K,
            .STAT2_Bit = PORTS_BIT_POS_4,
            .PG_Ch = PORT_CHANNEL_K,
            .PG_Bit = PORTS_BIT_POS_5,
        },
    },
    .UIConfig = {
        .LED1_Mod = 0,
        .LED1_Ch = PORT_CHANNEL_C,      // White LED
        .LED1_Bit = PORTS_BIT_POS_3,
        .LED2_Mod = 0,
        .LED2_Ch = PORT_CHANNEL_B,       // Blue LED
        .LED2_Bit = PORTS_BIT_POS_14,
        .button_Mod = 0,
        .button_Ch = PORT_CHANNEL_J,    // The only button
        .button_Bit = PORTS_BIT_POS_14,
        .LED1_Ind = {
            .patterns = {
                {0,0,0,0,0,0,0,0},  // LEDs off
                {0,0,0,0,0,0,0,0},  // Error state
                {0,0,1,1,0,0,1,1},  // Bat exhausted
                {1,1,1,1,1,1,1,1},  // Plugged in
                {0,1,1,1,1,1,1,1},  // Plugged in, power on
                {0,1,0,1,1,1,1,1},  // Plugged in, power on, charging
                {0,1,1,1,1,1,1,1},  // Plugged in, power on, streaming
                {0,1,0,1,1,1,1,1},  // Plugged in, power on, charging, streaming
                {1,0,0,0,0,0,0,0},  // Power on
                {1,0,0,0,0,0,0,0},  // Power on, streaming
                {1,0,1,0,0,0,0,0},  // Power on, batt low
                {1,0,1,0,0,0,0,0},  // Power on, streaming, batt low
                },
            .period = {2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        },
        
        .LED2_Ind = {
            .patterns = {
                {0,0,0,0,0,0,0,0},  // LEDs off
                {1,0,1,0,1,0,1,0},  // Error state
                {1,1,0,0,1,1,0,0},  // Bat exhausted
                {0,0,0,0,0,0,0,0},  // Plugged in
                {0,0,0,0,0,0,0,0},  // Plugged in, power on
                {0,0,0,0,0,0,0,0},  // Plugged in, power on, charging
                {1,0,0,0,0,0,0,0},  // Plugged in, power on, streaming
                {1,0,0,0,0,0,0,0},  // Plugged in, power on, charging, streaming
                {0,0,0,0,0,0,0,0},  // Power on
                {1,0,0,0,0,0,0,0},  // Power on, streaming
                {0,0,0,0,0,0,0,0},  // Power on, batt low
                {1,0,0,0,0,0,0,0},  // Power on, streaming, batt low
                },
            .period = {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
        },
    },
    .StreamingConfig = {
        .TimerIndex = DRV_TMR_INDEX_1,
        .TimerIntent = DRV_IO_INTENT_EXCLUSIVE,
        .TSTimerIndex = DRV_TMR_INDEX_2,
        .TSTimerIntent = DRV_IO_INTENT_EXCLUSIVE,
    }
};