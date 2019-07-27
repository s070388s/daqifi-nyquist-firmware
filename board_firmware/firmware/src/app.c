/*******************************************************************************
  File Name:
    app.c

  Summary:


  Description:

 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <sys/attribs.h>
#include "streaming.h"
#include "HAL/DIO.h"
#include "HAL/ADC.h"
#include "HAL/Power/PowerApi.h"
#include "HAL/Wifi/WifiApi.h"
#include "HAL/NVM/DaqifiSettings.h"
#include "TCPServer/TcpServer.h"
#include "UsbCdc/UsbCdc.h"
#include "state/board/BoardConfig.h"
#include "state/runtime/BoardRuntimeConfig.h"
#include "state/data/BoardData.h"
#include "SCPI/SCPIDIO.h"

const char BOARD_HARDWARE_REV[16] = "2.0.0";
const char BOARD_FIRMWARE_REV[16] = "1.0.3";
#define BOARD_VARIANT       1

#define UNUSED(x) (void)(x)

//TODO needed? WDRV_SCAN_STATUS g_scanStatus; // This is part of the wifi command code. IF we remove the commands, we have to define it ourselves


// *****************************************************************************
// *****************************************************************************
// Section: Global Variable Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */



// Declare force bootloader RAM flag location (FORCE_BOOTLOADER_FLAG_ADDR defined in preprocessor directives as 0x8007FFFC)
// 0x8007FFFC is the last word of RAM - this value must match what is defined in the bootloader project as well!
extern volatile uint32_t force_bootloader_flag __attribute__((persistent, coherent, address(FORCE_BOOTLOADER_FLAG_ADDR)));

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize(void)

  Remarks:
    See prototype in app.h.
 */
void APP_Initialize(void)
{
	force_bootloader_flag = 0;    // Reset force bootloader flag
    
    DaqifiSettings tmpTopLevelSettings;
    tmpTopLevelSettings.type = DaqifiSettings_TopLevelSettings;
    
    // Try to load TopLevelSettings from NVM - if this fails, store default settings to NVM (first run after a program)
    if(!LoadNvmSettings(DaqifiSettings_TopLevelSettings, &tmpTopLevelSettings))
    {
        // Get board variant and cal param type from TopLevelSettings NVM variable
        LoadFactorySettings(DaqifiSettings_TopLevelSettings, &tmpTopLevelSettings);
        strcpy(tmpTopLevelSettings.settings.topLevelSettings.boardHardwareRev, BOARD_HARDWARE_REV);
        strcpy(tmpTopLevelSettings.settings.topLevelSettings.boardFirmwareRev, BOARD_FIRMWARE_REV);
        tmpTopLevelSettings.settings.topLevelSettings.boardVariant = BOARD_VARIANT;
        SaveNvmSettings(&tmpTopLevelSettings);
    }
    
    // Load board config structures with the correct board variant values
    InitBoardConfig(&tmpTopLevelSettings.settings.topLevelSettings);
    InitBoardRuntimeConfig(tmpTopLevelSettings.settings.topLevelSettings.boardVariant);
    InitializeBoardData(&g_BoardData);
    
    // Try to load WiFiSettings from NVM - if this fails, store default settings to NVM (first run after a program)
    DaqifiSettings tmpWifiSettings;
    tmpWifiSettings.type = DaqifiSettings_Wifi;
    
    if(!LoadNvmSettings(DaqifiSettings_Wifi, &tmpWifiSettings))
    {
        // Get board wifi settings from Wifi NVM variable
        LoadFactorySettings(DaqifiSettings_Wifi, &tmpWifiSettings);
        SaveNvmSettings(&tmpWifiSettings);
    }
    // Move temp variable to global variables
    memcpy(&g_BoardRuntimeConfig.wifiSettings.settings.wifi, &tmpWifiSettings.settings.wifi, sizeof(WifiSettings));
    memcpy(&g_BoardData.wifiSettings.settings.wifi, &tmpWifiSettings.settings.wifi, sizeof(WifiSettings));
        
    // Load factory calibration parameters - if they are not initialized, store them (first run after a program)
    if(!LoadADCCalSettings(DaqifiSettings_FactAInCalParams, &g_BoardRuntimeConfig.AInChannels)) SaveADCCalSettings(DaqifiSettings_FactAInCalParams, &g_BoardRuntimeConfig.AInChannels);
    // If calVals has been set to 1 (user cal params), overwrite with user calibration parameters
    if(tmpTopLevelSettings.settings.topLevelSettings.calVals) LoadADCCalSettings(DaqifiSettings_UserAInCalParams, &g_BoardRuntimeConfig.AInChannels);

 	// Power initialization - enables 3.3V rail by default - other power functions are in power task
    Power_Init(g_BoardConfig.PowerConfig, &g_BoardData.PowerData, g_BoardRuntimeConfig.PowerWriteVars);
    
    // Init DIO Hardware
    DIO_InitHardware(&g_BoardConfig.DIOChannels);
    
	// Write initial values
    DIO_WriteStateAll(&g_BoardConfig.DIOChannels, &g_BoardRuntimeConfig.DIOChannels);
   
	TimestampTimer_Init(&g_BoardConfig.StreamingConfig, &g_BoardRuntimeConfig.StreamingConfig);
    Streaming_Init(&g_BoardConfig.StreamingConfig, &g_BoardRuntimeConfig.StreamingConfig);
    Streaming_UpdateState(&g_BoardConfig, &g_BoardRuntimeConfig);
}


/*******************************************************************************
  Function:
    void APP_Tasks(void)

  Remarks:
    See prototype in app.h.
 */
void APP_Tasks(void)
{   
    ADC_Tasks(&g_BoardConfig, &g_BoardRuntimeConfig, &g_BoardData);
    Streaming_Tasks(&g_BoardConfig, &g_BoardRuntimeConfig, &g_BoardData);
    APP_SelfTest();
        
    // Wait for power-on for WiFi
    if (g_BoardData.PowerData.powerState > MICRO_ON)
    {
        WifiTasks();
    }
}

void APP_SelfTest(void)
{
    size_t index;
    vTaskDelay(1000 / portTICK_PERIOD_MS);  // Delay for voltage to stabilize
    index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_VSYS);
    if (ADC_IsDataValid(&g_BoardData.AInLatest.Data[index]))
    {
        volatile double voltage_Vsys, voltage_3_3V, voltage_2_5_Vref, voltage_5V;
        volatile DIO_result;
        volatile bool test_result[6] = {false,false,false,false,false,false};
        
           
        // Check system voltages
        index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_VSYS);
        voltage_Vsys = ADC_ConvertToVoltage(&g_BoardData.AInLatest.Data[index]);
        if (voltage_Vsys > 3 && voltage_Vsys < 4.3) test_result[0] = true;
        
        index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_3_3V);
        voltage_3_3V = ADC_ConvertToVoltage(&g_BoardData.AInLatest.Data[index]);
        if (voltage_3_3V > 3.24 && voltage_3_3V < 3.35) test_result[1] = true;
        
        index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_2_5VREF);
        voltage_2_5_Vref = ADC_ConvertToVoltage(&g_BoardData.AInLatest.Data[index]);
        if (voltage_2_5_Vref > 2.48 && voltage_2_5_Vref < 2.52) test_result[2] = true;
                
        index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_5V);
        voltage_5V = ADC_ConvertToVoltage(&g_BoardData.AInLatest.Data[index]);
        if (voltage_5V > 5.44 && voltage_5V < 5.6) test_result[3] = true;
        
        // Check DIO
        // Assuming each pair of DIO are connected together with jumpers 0--1, 2--3, etc.
        // Write even DIO
        SCPI_GPIOMultiDirectionSet(~21845);
        SCPI_GPIOMultiStateSet(21845);
        
        SCPI_GPIOMultiStateGet(&DIO_result);
        if(DIO_result == 65535) test_result[4] = true;
        
        // Write odd DIO
        SCPI_GPIOMultiDirectionSet(~43690);
        SCPI_GPIOMultiStateSet(43690);
        
        SCPI_GPIOMultiStateGet(&DIO_result);   
        if(DIO_result == 65535) test_result[5] = true;

        // if (test_result) PLIB_PORTS_PinSet(config.LED1_Mod, config.LED1_Ch, config.LED1_Bit);
    }
}

/*******************************************************************************
 End of File
*/
