/*! @file PowerApi.c
 * @brief Implementation of the Power API library
 * 
 * @author Javier Longares Abaiz
 * j.longares@abluethinginthecloud.com
 * 
 * A Blue Thing In The Cloud S.L.U.
 *   === When Technology becomes art ===
 * www.abluethinginthecloud.com
 *     
 */

#include "HAL/Power/PowerApi.h"
#include "system_definitions.h"
#include "state/board/BoardConfig.h"
#include "state/data/BoardData.h"
#include "HAL/ADC.h"
#include "HAL/Wifi/WifiApi.h"

//! Definition of percentage for indicating that the battery is exhausted
#define POWERAPI_BATTERY_THRESHOLD_EXHAUSTED                        5.0
//! Definition of percentage for indicating battery low
#define POWERAPI_BATTERY_THRESHOLD_LOW                              10.0
//! Minimum percentage at which battery must be charged after being depleted
#define POWERAPI_BATTERY_THRESHOLD_MINIMUM_RECHARGE                 10.0

void Power_Update_Settings(void);
static void Power_Write(void);
static void Power_Up( void );
static void Power_Down( void );
static void Power_UpdateState( void );
void Power_UpdateChgPct( void );

/*! Fucntion to initialize the Power API and the device's power */
void Power_Init(void)
{ 
    const tPowerConfig *pPowerConfig =                                      \
        BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    const tPowerData *pPowerData =                                          \
        BoardData_Get( BOARDATA_POWER_DATA, 0 );
    const tPowerWriteVars *pPowerWriteVariables =                           \
        BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );
    
    
    // NOTE: This is called before the RTOS is running.  
    // Don't call any RTOS functions here!
    BQ24297_InitHardware(                                                   \
                            pPowerConfig->BQ24297Config,                    \
                            pPowerWriteVariables->BQ24297WriteVars,         \
                            (void *)&pPowerData->BQ24297Data );
    
    PLIB_PORTS_PinWrite(                                                    \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_3_3V_Ch,                      \
                            pPowerConfig->EN_3_3V_Bit,                     \
                            pPowerWriteVariables->EN_3_3V_Val );
    
    PLIB_PORTS_PinWrite(                                                    \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_5_10V_Ch,                     \
                            pPowerConfig->EN_5_10V_Bit,                    \
                            pPowerWriteVariables->EN_5_10V_Val );
    
    PLIB_PORTS_PinWrite(                                                    \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_5V_ADC_Ch,                     \
                            pPowerConfig->EN_5V_ADC_Bit,                   \
                            pPowerWriteVariables->EN_5V_ADC_Val );
    
    PLIB_PORTS_PinWrite(                                                    \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_12V_Ch,                       \
                            pPowerConfig->EN_12V_Bit,                      \
                            pPowerWriteVariables->EN_12V_Val );
    
    PLIB_PORTS_PinWrite(                                                    \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_Vref_Ch,                       \
                            pPowerConfig->EN_Vref_Bit,                      \
                            pPowerWriteVariables->EN_Vref_Val );
}

/*! This function writes the run time power variables to the board config power
 *  data structure 
 */
static void Power_Write(void)
{    //tPowerConfig config, tPowerWriteVars *vars
    // Current power state values

    bool EN_3_3V_Val_Current;
    bool EN_5_10V_Val_Current;
    bool EN_5V_ADC_Val_Current;
    bool EN_12V_Val_Current;
    bool EN_Vref_Val_Current;
    const tPowerConfig *pPowerConfig =                                      \
        BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    const tPowerWriteVars *pPowerWriteVariables =                           \
        BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );

    EN_3_3V_Val_Current = PLIB_PORTS_PinGetLatched(                         \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_3_3V_Ch,                       \
                            pPowerConfig->EN_3_3V_Bit );
    
    EN_5_10V_Val_Current = PLIB_PORTS_PinGetLatched(                        \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_5_10V_Ch,                      \
                            pPowerConfig->EN_5_10V_Bit);
    
    EN_5V_ADC_Val_Current = PLIB_PORTS_PinGetLatched(                       \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_5V_ADC_Ch,                     \
                            pPowerConfig->EN_5V_ADC_Bit);
    
    EN_12V_Val_Current = PLIB_PORTS_PinGetLatched(                          \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_12V_Ch,                        \
                            pPowerConfig->EN_12V_Bit );
    
    EN_Vref_Val_Current = PLIB_PORTS_PinGetLatched(                         \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_Vref_Ch,                       \
                            pPowerConfig->EN_Vref_Bit);
             
    // Check to see if we are changing the state of this power pin
    if( EN_3_3V_Val_Current != pPowerWriteVariables->EN_3_3V_Val ){
        
        PLIB_PORTS_PinWrite(                                                \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_3_3V_Ch,                       \
                            pPowerConfig->EN_3_3V_Bit,                      \
                            pPowerWriteVariables->EN_3_3V_Val );
    }
    
    // Check to see if we are changing the state of these power pins
    if( EN_5_10V_Val_Current != pPowerWriteVariables->EN_5_10V_Val ||       \
        EN_5V_ADC_Val_Current != pPowerWriteVariables->EN_5V_ADC_Val ||     \
        EN_12V_Val_Current != pPowerWriteVariables->EN_12V_Val ) {
        
        PLIB_PORTS_PinWrite(                                                \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_5_10V_Ch,                      \
                            pPowerConfig->EN_5_10V_Bit,                     \
                            pPowerWriteVariables->EN_5_10V_Val );

        PLIB_PORTS_PinWrite(                                                \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_5V_ADC_Ch,                     \
                            pPowerConfig->EN_5V_ADC_Bit,                    \
                            pPowerWriteVariables->EN_5V_ADC_Val );

        PLIB_PORTS_PinWrite(                                                \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_12V_Ch,                        \
                            pPowerConfig->EN_12V_Bit,                       \
                            pPowerWriteVariables->EN_12V_Val );
    }
    
    // Check to see if we are changing the state of this power pin
    if( EN_Vref_Val_Current != pPowerWriteVariables->EN_Vref_Val )
    {
        PLIB_PORTS_PinWrite(                                                \
                            PORTS_ID_0,                                     \
                            pPowerConfig->EN_Vref_Ch,                       \
                            pPowerConfig->EN_Vref_Bit,                      \
                            pPowerWriteVariables->EN_Vref_Val);
    }

}

/*! Turns the power up */
static void Power_Up( void )
{
    tPowerData *pPowerData =                                          \
        (void *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tPowerWriteVars *pPowerWriteVariables =                            \
        (void *)BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );
    //uint32_t achievedFrequencyHz=0;
    
    // If the battery management is not enabled, wait for it to become ready
    while( !pPowerData->BQ24297Data.initComplete){
        vTaskDelay(100 / portTICK_PERIOD_MS);   
    }
    
    // Enable processor to run at full speed
    SYS_INT_Disable();
    
    PLIB_DEVCON_SystemUnlock( 0 );
    SLEWCONbits.SYSDIV = 0;
    PLIB_DEVCON_SystemLock( 0 );

    // We still have to call this after setting SYSDIV above for some reason
    SYS_CLK_SystemFrequencySet(                                             \
                            SYS_CLK_SOURCE_PRIMARY_SYSPLL,                  \
                            200000000,                                      \
                            true );

    SYS_DEVCON_PerformanceConfig(SYS_CLK_SystemFrequencyGet());
    
    SYS_INT_Enable();
    // Delay after turning up to full speed to allow steady-state before
    // powering system
    vTaskDelay(50 / portTICK_PERIOD_MS);   
    
    // 3.3V Enable
    pPowerWriteVariables->EN_3_3V_Val = true;
    Power_Write(); 

    // 5V Enable
    if( ( pPowerData->BQ24297Data.status.batPresent) ||                     \
        (pPowerData->BQ24297Data.status.vBusStat == VBUS_CHARGER) ){
        
        pPowerWriteVariables->EN_5_10V_Val = true;
    }
    Power_Write();
    vTaskDelay( 50 / portTICK_PERIOD_MS );
    
    // 5V ADC Enable
    pPowerWriteVariables->EN_5V_ADC_Val = true;
    Power_Write(); 
    vTaskDelay( 50 / portTICK_PERIOD_MS );
    
    // 12V Enable (set low to turn on, set as input (or high if configured as open collector) to turn off)
    pPowerWriteVariables->EN_12V_Val = false;
    Power_Write();
    vTaskDelay( 50 / portTICK_PERIOD_MS );
    
    // Vref Enable
    pPowerWriteVariables->EN_Vref_Val = true;
    Power_Write();  
    vTaskDelay( 50 / portTICK_PERIOD_MS );
    
    pPowerData->powerState = POWERED_UP;
}

/*! Turns the power down */
static void Power_Down( void )
{
    tPowerData *pPowerData =                                                \
        (void *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tPowerWriteVars *pPowerWriteVariables =                                 \
        (void *)BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );
    
    // Turn off WiFi interface to save power
    WifiConnectionDown();
        
    // Divide system frequency by value below to save power
    PLIB_DEVCON_SystemUnlock(0);
    SLEWCONbits.SYSDIV = SYS_CLK_DIV_PWR_SAVE;
    PLIB_DEVCON_SystemLock(0);
    
    // We still have to call SYS_CLK_SystemFrequencySet after setting SYSDIV
    // above for some reason and the frequency must be 200MHz to avoid crashing
    // (even though we are actually dividing the full speed (200MHz by a 
    // divider, SYS_CLK_DIV_PWR_SAVE)
    SYS_CLK_SystemFrequencySet(                                             \
                            SYS_CLK_SOURCE_PRIMARY_SYSPLL,                  \
                            200000000,                                      \
                            true );
    
    
    //SYS_CLK_SystemClockStatus
    
    // 3.3V Disable - if powered externally, board will stay on and go to low
    // power state, else off completely
    pPowerWriteVariables->EN_3_3V_Val = false;
    // 5V Disable
    pPowerWriteVariables->EN_5_10V_Val = false;
    // 5V ADC Disable
    pPowerWriteVariables->EN_5V_ADC_Val = false;
    // 12V Disable (set low to turn on, set as input (or high if configured as
    // open collector) to turn off)
    pPowerWriteVariables->EN_12V_Val = true;
    // Vref Disable
    pPowerWriteVariables->EN_Vref_Val = false;
    Power_Write();

    
    // Set back to default state
    pPowerData->powerState = MICRO_ON;
    pPowerData->requestedPowerState = NO_CHANGE;
    
    // Delay 1000ms for power to discharge
    vTaskDelay( 1000 / portTICK_PERIOD_MS );
}

/*! This function updates the power state */
static void Power_UpdateState( void )
{
    tPowerData *pPowerData =                                                \
        (void *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tPowerWriteVars *pPowerWriteVariables =                            \
        (void *)BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );
    
    // Set power state immediately if POWER_DOWN is requested
    if( pPowerData->requestedPowerState == DO_POWER_DOWN ){
        pPowerData->powerState = POWER_DOWN;
    }
    
    switch( pPowerData->powerState ){
        case POWER_DOWN:
            /* Not initialized or powered down */
            
            // Check to see if we've finished signaling the user of insufficient
            //power if necessary
            if( pPowerData->powerDnAllowed == true ){
                Power_Down();
            }
            break;
            
        case MICRO_ON:
            /* 3.3V rail enabled. Ready to check initial status 
             * NOTE: This is the default state if code is running!
             * There is no Vref at this time, so any read to ADC is invalid!
             */
            if( pPowerData->requestedPowerState == DO_POWER_UP ){
                
                if(                                                         \
                            !pPowerData->BQ24297Data.status.vsysStat ||     \
                            pPowerData->BQ24297Data.status.pgStat ){
                    Power_Up();
                }else
                {
                    // Otherwise insufficient power.  Notify user and power down
                    pPowerData->powerDnAllowed = false;
                    // This will turn true after the LED sequence completes
                    pPowerData->powerState = POWER_DOWN;
                }
            }
            break;
            
        case POWERED_UP:
        /* Board fully powered. Monitor for any changes/faults
         * ADC readings are now valid!
         */ 
            Power_UpdateChgPct();
            if(                                                             \
                  pPowerData->requestedPowerState == DO_POWER_UP_EXT_DOWN ||\
                  ( pPowerData->chargePct<POWERAPI_BATTERY_THRESHOLD_LOW && \
                  !pPowerData->BQ24297Data.status.pgStat) ){
                // If battery is low on charge and we are not plugged in,
                // disable external supplies
                pPowerWriteVariables->EN_5_10V_Val = false;
                Power_Write();
                pPowerData->powerState = POWERED_UP_EXT_DOWN;
            }
            break;
            
        case POWERED_UP_EXT_DOWN:
        /* Board partially powered. Monitor for any changes */ 
            Power_UpdateChgPct();
            if(                                                             \
                  pPowerData->chargePct >                                   \
                            ( POWERAPI_BATTERY_THRESHOLD_LOW +              \
                            POWERAPI_BATTERY_THRESHOLD_MINIMUM_RECHARGE) || \
                  ( pPowerData->BQ24297Data.status.inLim > 1 ) ){
                
                if( pPowerData->requestedPowerState == DO_POWER_UP ){
                    // If battery is charged or we are plugged in, enable
                    // external supplies
                    pPowerWriteVariables->EN_5_10V_Val = true;
                    Power_Write();
                    pPowerData->powerState = POWERED_UP;
                }
            
            // Else, remain here because the user didn't want to be
            // fully powered
            }else if(                                                       \
        pPowerData->chargePct < POWERAPI_BATTERY_THRESHOLD_EXHAUSTED ){
                // Insufficient power.  Notify user and power down.
                // This will turn true after the LED sequence completes
                pPowerData->powerDnAllowed = false;
                pPowerData->powerState = POWER_DOWN;
            }

            break;
    }
 
}

/*! This function updates the power percentage */
void Power_UpdateChgPct( void )
{
    tPowerData *pPowerData =                                          \
        (void *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    
    size_t index = ADC_FindChannelIndex(                                    \
                  &g_BoardConfig.AInChannels,                               \
                  ADC_CHANNEL_VBATT );

    const AInSample *pAnalogSample = BoardData_Get(                         \
                  BOARDDATA_AIN_LATEST,                                     \
                  index );
    if( NULL != pAnalogSample ){
        pPowerData->battVoltage = ADC_ConvertToVoltage( pAnalogSample );
    }

    // Function below is defined from 3.17-3.868.  Must coerce input value to within these bounds.
    if( pPowerData->battVoltage<3.17 ){
        pPowerData->chargePct = 0;
    }else if( pPowerData->battVoltage>3.868 ){
        pPowerData->chargePct=100;
    }else{
        pPowerData->chargePct = 142.92 * pPowerData->battVoltage - 452.93;
    }
}

/*! This function is intended to be called continuously in order to perform the
 power tasks */
void Power_Tasks( void )
{
    const tPowerConfig *pPowerConfig =                                      \
        BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    tPowerData *pPowerData =                                          \
        (void *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tPowerWriteVars *pPowerWriteVariables =                            \
        (tPowerWriteVars *)BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );

    // If we haven't initialized the battery management settings, do so now
    if( pPowerData->BQ24297Data.initComplete == false ){
        BQ24297_InitSettings(                                               \
                  pPowerConfig->BQ24297Config,                      \
                  pPowerWriteVariables->BQ24297WriteVars,                         \
                  &( pPowerData->BQ24297Data ) );
    }

    // Update power settings based on BQ24297 interrupt change
    if( pPowerData->BQ24297Data.intFlag ){
        /* The BQ24297 asserted an interrupt so we might need to update our 
         * power settings
         * INT on the BQ24297 can be asserted:
         * -Good input source detected
         * -Input removed or VBUS above VACOV threshold
         * -After successful input source qualification
         * -Any fault during boost operation, including VBUS over-voltage or
         *  over-current
         * -Once a charging cycle is complete/charging termination
         * -On temperature fault
         * -Safety timer timeout
         */
        vTaskDelay(100 / portTICK_PERIOD_MS);
        // Update battery management status - plugged in (USB, charger, etc),
        // charging/discharging, etc.
        BQ24297_UpdateStatus(                                               \
                  pPowerConfig->BQ24297Config,                              \
                  pPowerWriteVariables->BQ24297WriteVars,                   \
                  &( pPowerData->BQ24297Data ) );
        Power_Update_Settings();
        pPowerData->BQ24297Data.intFlag = false; // Clear flag
    }
    
    // Call update state
    // TODO - perhaps put this in its own task to call only once per minute?
    // As is, it appears to cause LED blinking to be errant
    Power_UpdateState();
}

/*! This function is used for updating the power settings */
void Power_Update_Settings(void)
{
    const tPowerConfig *pPowerConfig =                                      \
        BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    const tPowerData *pPowerData =                                          \
        BoardData_Get( BOARDATA_POWER_DATA, 0 );
    const tPowerWriteVars *pPowerWriteVariables =                            \
        BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );
    // Change charging/other power settings based on current status
       
    // Check new power source and set parameters accordingly
    BQ24297_AutoSetILim(                                                    \
                  pPowerConfig->BQ24297Config,                              \
                  (void *)&pPowerWriteVariables->BQ24297WriteVars,                  \
                  (void *)&pPowerData->BQ24297Data );
    
    // Enable/disable charging
    BQ24297_ChargeEnable(                                                   \
                  pPowerConfig->BQ24297Config,                               \
                  (void *)&pPowerWriteVariables->BQ24297WriteVars,                  \
                  (void *)&pPowerData->BQ24297Data,                                 \
                  pPowerData->BQ24297Data.status.batPresent );
}

/*! This function is used for updating the sleep state 
 * @param[in] sleep Sleep state to be updated, depending on if USB is connected
 * or not
 */
void Power_USB_Sleep_Update( bool sleep )
{
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    
    pPowerData->USBSleep = sleep;
    
}

