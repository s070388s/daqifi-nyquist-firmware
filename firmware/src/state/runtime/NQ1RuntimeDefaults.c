#include "BoardRuntimeConfig.h"
#include "HAL/BQ24297/BQ24297.h"
#include "services/sd_card_services/sd_card_manager.h"

// The default board configuration
// TODO: It would be handly if this was at a special place in memory so we could flash just the board config (vs recompiling the firmware w/ a different configuration)
const tBoardRuntimeConfig g_NQ1BoardRuntimeConfig = {
    .DIOChannels = {
        .Data = {
            {.IsInput = true, .IsReadOnly = false, .Value = false,.IsPwmActive=false,.PwmFrequency=0,.PwmDutyCycle=0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
            {true, false, false,false,0,0},
        },
        .Size = 16,
    },
    .DIOGlobalEnable = false,
    .AInModules =
    {
        .Data =
        {
            {.IsEnabled = true, .Range = 5.0},
        },
        .Size = 1,
    },
    .AInChannels =
    {
        .Data =
        {
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
            {false, false, 0, 1, 0}, //TODO(Daqifi): Enabling this channel causes hard fault
            {true, false, 0, 1, 0},
            {true, false, 0, 1, 0},
        },
        .Size = 24
    },
    .PowerWriteVars = {
       .EN_3_3V_Val = true,     // 3.3V rail on
       .EN_5_10V_Val = false,   // 5V rail off
       .EN_5V_ADC_Val = false,   // 5V ADC rail off
       .EN_12V_Val = true,      // 12V rail off (inverse logic)
       .EN_Vref_Val = false,    // Vref rail off
       .BQ24297WriteVars.OTG_Val = true,    // Allow more than 100mA (after source check) during power up for debugging
    },
    .UIWriteVars = {
        .LED1 = false,
        .LED2 = false,
    },
    .StreamingConfig = {
        .IsEnabled = false,
        .Running = false,
        .ClockPeriod = 130,   // default 3k hz (15khz is the max)
        .Frequency=30000,
        .ChannelScanFreqDiv=3, //max channel scan frequency should be 1000 hz
        .Encoding = Streaming_ProtoBuffer,
        .TSClockPeriod = 0xFFFFFFFF,   // maximum
    },
//    .wifiSettings = {
//        .type = DaqifiSettings_Wifi
//    },
    //.usbSettings = {0},
    //.serverData = {0},
    .sdCardConfig={
        .enable=false,
        .directory="Daqifi",
        .file="default.bin",
        .mode=SD_CARD_MANAGER_MODE_NONE,
    },    
    
};
