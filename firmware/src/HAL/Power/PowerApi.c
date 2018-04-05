#include "HAL/Power/PowerApi.h"

#include "HAL/MCP73871/MCP73871.h"
#include "system_definitions.h"
#include "HAL/Wifi/WifiApi.h"
#include "state/board/BoardConfig.h"
#include "state/data/BoardData.h"
#include "HAL/ADC.h"

/*
 *  CHARGE CYCLE STATE      STAT1   STAT2   PG
 *   No Input Power Present  Hi-Z    Hi-Z    Hi-Z
 *   Shutdown (VDD = VBAT)   Hi-Z    Hi-Z    Hi-Z
 * 
 *   No battery or charge disabled:
 *   Shutdown (VDD = IN)     Hi-Z    Hi-Z    L
 *   Shutdown (CE = L)       Hi-Z    Hi-Z    L
 *   No Battery Present      Hi-Z    Hi-Z    L
 * 
 *   Charging:
 *   Preconditioning         L       Hi-Z    L
 *   Constant Current        L       Hi-Z    L
 *   Constant Voltage        L       Hi-Z    L
 * 
 *   Charge finished:
 *   Charge Cmplt - Stby     Hi-Z    L       L
 * 
 *   Fault:
 *   Temperature Fault       L       L       L
 *   Timer Fault             L       L       L
 * 
 *   Low Battery:
 *   Low Battery Output      L       Hi-Z    Hi-Z
 * 
 * The UVLO circuit places the device in Shutdown mode
 * if the input supply falls to within approximately 100 mV
 * of the battery voltage.
 * 
 * UVLO Start Threshold =   4.35V
 * UVLO Stop Threshold =    4.13V
 * Low Batt Threshold =     3.1V
 * 
*/

#define BATT_EXH_TH 5.0
#define BATT_LOW_TH 10.0 // 10% or ~3.2V
#define BATT_LOW_HYST 10.0 // Battery must be charged at least this value higher than BATT_LOW_TH

void Power_Init(sPowerConfig config, sPowerData *data, sPowerWriteVars vars)
{
    // NOTE: This is called before the RTOS is running.  Don't call any RTOS functions here!
    MCP73871_Init(config.MCP73871Config, vars.MCP73871WriteVars);
    
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_3_3V_Ch, config.EN_3_3V_Bit, vars.EN_3_3V_Val);
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_5_10V_Ch, config.EN_5_10V_Bit, vars.EN_5_10V_Val);
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_5V_ADC_Ch, config.EN_5V_ADC_Bit, vars.EN_5V_ADC_Val);
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_12V_Ch, config.EN_12V_Bit, vars.EN_12V_Val);
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_Vref_Ch, config.EN_Vref_Bit, vars.EN_Vref_Val);
}

void Power_Write(sPowerConfig config, sPowerWriteVars *vars)
{
    bool tempSELVal = false;
    
    // Current power state values

    bool EN_3_3V_Val_Current, EN_5_10V_Val_Current, EN_5V_ADC_Val_Current, EN_12V_Val_Current, EN_Vref_Val_Current;
    
    EN_3_3V_Val_Current = PLIB_PORTS_PinGetLatched(PORTS_ID_0, config.EN_3_3V_Ch, config.EN_3_3V_Bit);
    EN_5_10V_Val_Current = PLIB_PORTS_PinGetLatched(PORTS_ID_0, config.EN_5_10V_Ch, config.EN_5_10V_Bit);
    EN_5V_ADC_Val_Current = PLIB_PORTS_PinGetLatched(PORTS_ID_0, config.EN_5V_ADC_Ch, config.EN_5V_ADC_Bit);
    EN_12V_Val_Current = PLIB_PORTS_PinGetLatched(PORTS_ID_0, config.EN_12V_Ch, config.EN_12V_Bit);
    EN_Vref_Val_Current = PLIB_PORTS_PinGetLatched(PORTS_ID_0, config.EN_Vref_Ch, config.EN_Vref_Bit);
             
    // Check to see if we are changing the state of this power pin
    if(EN_3_3V_Val_Current != vars->EN_3_3V_Val)
    {
        PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_3_3V_Ch, config.EN_3_3V_Bit, vars->EN_3_3V_Val);
        // Delay 10ms for power to stabilize (should already be stable)
        vTaskDelay(10 / portTICK_PERIOD_MS);
    }
    
    // Check to see if we are changing the state of these power pins
    if(EN_5_10V_Val_Current != vars->EN_5_10V_Val || EN_5V_ADC_Val_Current != vars->EN_5V_ADC_Val || EN_12V_Val_Current != vars->EN_12V_Val)
    {
    
        // Set battery management to external source during power-up to avoid triggering overload
        tempSELVal=vars->MCP73871WriteVars.SEL_Val; // Store current value for later
        vars->MCP73871WriteVars.SEL_Val = true;   
        MCP73871_Write(config.MCP73871Config, vars->MCP73871WriteVars);

        PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_5_10V_Ch, config.EN_5_10V_Bit, vars->EN_5_10V_Val);

        PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_5V_ADC_Ch, config.EN_5V_ADC_Bit, vars->EN_5V_ADC_Val);

        PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_12V_Ch, config.EN_12V_Bit, vars->EN_12V_Val);
        // Delay 100ms for power to stabilize
        vTaskDelay(100 / portTICK_PERIOD_MS);

        vars->MCP73871WriteVars.SEL_Val = tempSELVal;   
        MCP73871_Write(config.MCP73871Config, vars->MCP73871WriteVars);
    }
    
    // Check to see if we are changing the state of this power pin
    if(EN_Vref_Val_Current != vars->EN_Vref_Val)
    {
        PLIB_PORTS_PinWrite(PORTS_ID_0, config.EN_Vref_Ch, config.EN_Vref_Bit, vars->EN_Vref_Val);
        // Delay 100ms for power to stabilize
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }

}

void Power_Up(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars)
{

    //uint32_t achievedFrequencyHz=0;
    
    // Enable processor to run at full speed
    SYS_INT_Disable();
    
    PLIB_DEVCON_SystemUnlock(0);
    SLEWCONbits.SYSDIV = 0;
    PLIB_DEVCON_SystemLock(0);

    // We still have to call this after setting SYSDIV above for some reason
    SYS_CLK_SystemFrequencySet (SYS_CLK_SOURCE_PRIMARY_SYSPLL, 200000000, true);
    
    // Below code is commented out because it causes the processor to crash for some reason.  Perhaps future updates will fix this.
    // For now, above code works to divide the overall system and PB clocks using SYSDIV.
    
//    achievedFrequencyHz = SYS_CLK_SystemFrequencySet (SYS_CLK_SOURCE_PRIMARY_SYSPLL, 200000000, true);
//
//	if ( achievedFrequencyHz != 200000000 )
//	{
//		//Clock setting failed
//        while(1);
//	}
//    
//    //Example for MZ, multiple peripheral buses
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_1, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1); 
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_2, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_3, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_4, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_5, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_6, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_7, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 200000000, true);
//    if( achievedFrequencyHz != 200000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }
//    achievedFrequencyHz = SYS_CLK_PeripheralFrequencySet ( CLK_BUS_PERIPHERAL_8, CLK_SOURCE_PERIPHERAL_SYSTEMCLK, 100000000, true);
//    if( achievedFrequencyHz != 100000000 )
//    {
//		//Clock setting failed
//        while(1);
//    }

 
    
    SYS_DEVCON_PerformanceConfig(SYS_CLK_SystemFrequencyGet());
    
    SYS_INT_Enable();
    
      // 3.3V Enable
    vars->EN_3_3V_Val = true;
    // 5V Enable
    vars->EN_5_10V_Val = true;
    // 5V ADC Enable
    vars->EN_5V_ADC_Val = true;
    // 12V Enable (set low to turn on, set as input (or high if configured as open collector) to turn off)
    vars->EN_12V_Val = false;
    // Vref Enable
    vars->EN_Vref_Val = true;
    Power_Write(config, vars);   
    
    data->powerState = POWERED_UP;
    
    // Wait for streaming ADC trigger to collect at least one sample TODO: Bolster our ability to determine when a read is valid
    vTaskDelay(1500 / portTICK_PERIOD_MS);
    
    Power_UpdateChgPct(data);
 
    if(data->battVoltage > 2.5)
    {
        g_BoardData.PowerData.pONBattPresent = true;
    }else
    {
        g_BoardData.PowerData.pONBattPresent = false;
    }


}

void Power_Down(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars)
{
    // Turn off WiFi interface to save power
    WifiConnectionDown();
        
    // Divide system frequency by value below to save power
    PLIB_DEVCON_SystemUnlock(0);
    SLEWCONbits.SYSDIV = SYS_CLK_DIV_PWR_SAVE;
    PLIB_DEVCON_SystemLock(0);
    
    // We still have to call SYS_CLK_SystemFrequencySet after setting SYSDIV above for some reason
    // and the frequency must be 200MHz to avoid crashing (even though we are actually
    // dividing the full speed (200MHz by a divider, SYS_CLK_DIV_PWR_SAVE)
    SYS_CLK_SystemFrequencySet (SYS_CLK_SOURCE_PRIMARY_SYSPLL, 200000000, true);
    
    
    //SYS_CLK_SystemClockStatus
    
    // 3.3V Disable - if powered externally, board will stay on and go to low power state, else off completely
    vars->EN_3_3V_Val = false;
    // 5V Disable
    vars->EN_5_10V_Val = false;
    // 5V ADC Disable
    vars->EN_5V_ADC_Val = false;
    // 12V Disable (set low to turn on, set as input (or high if configured as open collector) to turn off)
    vars->EN_12V_Val = true;
    // Vref Disable
    vars->EN_Vref_Val = false;
    Power_Write(config, vars);

    
    data->powerState = MICRO_ON;    // Set back to default state
    data->requestedPowerState = NO_CHANGE;
    
    // Delay 1000ms for power to discharge
    vTaskDelay(1000 / portTICK_PERIOD_MS);
}


void Power_UpdateState(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars)
{
    // Set power state immediately if POWER_DOWN is requested
    if(data->requestedPowerState == DO_POWER_DOWN) data->powerState = POWER_DOWN;
    
    switch(data->powerState){
        case POWER_DOWN:
            /* Not initialized or powered down */
            //Insufficient_Power_Indication(config);
            
            // Check to see if we've finished signaling the user of insufficient power if necessary
            if(data->powerDnAllowed == true) Power_Down(config, data, vars);
            break;
            
        case MICRO_ON:
        /* 3.3V rail enabled. Ready to check initial status 
         * NOTE: This is the default state if code is running!
         * There is no Vref at this time, so any read to ADC is invalid!
         */
            if(data->requestedPowerState == DO_POWER_UP)
            {
                if(data->externalPowerSource==CHARGER_2A_EXT_POWER || CHARGER_1A_EXT_POWER || data->externalPowerSource==USB_500MA_EXT_POWER || !data->battLow)
                {

                    // If plugged into external power source or battery has charge enable full power
                    Power_Up(config, data, vars);
                }else
                {
                    // Otherwise insufficient power.  Notify user and power down
                    data->powerDnAllowed = false; // This will turn true after the LED sequence completes
                    data->powerState = POWER_DOWN;
                }
            }
            break;
            
        case POWERED_UP:
        /* Board fully powered. Monitor for any changes/faults
         * ADC readings are now valid!
         */ 
            Power_UpdateChgPct(data);
            if(data->requestedPowerState == DO_POWER_UP_EXT_DOWN || (data->chargePct<BATT_LOW_TH && !(data->externalPowerSource==USB_500MA_EXT_POWER || data->externalPowerSource==CHARGER_2A_EXT_POWER)))
            {
                // If battery is low on charge and we are not plugged in, disable external supplies
                vars->EN_5_10V_Val = false;
                Power_Write(config, vars);
                data->powerState = POWERED_UP_EXT_DOWN;
            }
            break;
            
        case POWERED_UP_EXT_DOWN:
        /* Board partially powered. Monitor for any changes */ 
            Power_UpdateChgPct(data);
            if(data->chargePct>BATT_LOW_TH + BATT_LOW_HYST || (data->externalPowerSource==USB_500MA_EXT_POWER || data->externalPowerSource==CHARGER_2A_EXT_POWER))
            {
                if(data->requestedPowerState == DO_POWER_UP)
                {
                    // If battery is charged or we are plugged in, enable external supplies
                    vars->EN_5_10V_Val = true;
                    Power_Write(config, vars);
                    data->powerState = POWERED_UP;
                }
                    // Else, remain here because the user didn't want to be fully powered
            }else if(data->chargePct<BATT_EXH_TH)
            {
                // Insufficient power.  Notify user and power down.
                data->powerDnAllowed = false;   // This will turn true after the LED sequence completes
                data->powerState = POWER_DOWN;
            }

            break;
    }
 
}

void Power_UpdateChgPct(sPowerData *data)
{
    size_t index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_VBATT);
   
    data->battVoltage = ADC_ConvertToVoltage(&g_BoardData.AInLatest.Data[index]);

    // Function below is defined from 3.17-3.868.  Must coerce input value to within these bounds.
    if(data->battVoltage<3.17)
    {
        data->chargePct=0;
    }else if(data->battVoltage>3.868)
    {
        data->chargePct=100;
    }else{
        data->chargePct = 142.92*data->battVoltage - 452.93;
    }
}

void Power_Tasks(sPowerConfig PowerConfig, sPowerData *PowerData, sPowerWriteVars *powerWriteVars)
{
    // Update digital IO status from MCP73871
    MCP73871_Read(PowerConfig.MCP73871Config, &PowerData->MCP73871Data);
    MCP73871_ComputeStatus(&PowerData->MCP73871Data);
    
    // Update battLow status based on MCP73871 status
    PowerData->battLow=(PowerData->MCP73871Data.status==LOW_BATT);
    
    // Update power source
    Power_Update_Source(PowerConfig, PowerData, powerWriteVars);
    
    // Call update state
    Power_UpdateState(PowerConfig, PowerData, powerWriteVars);
}

void Power_Update_Source(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars)
{
    bool chargeEnable = false;
    
    if(data->MCP73871Data.PG_Val)
    {   // If PG is high, there is no power plugged into the board
        data->externalPowerSource = NO_EXT_POWER;

        chargeEnable = false;
        
        vars->MCP73871WriteVars.SEL_Val = false;    // Input type selection (Low for USB port, High for ac-dc adapter)
        vars->MCP73871WriteVars.PROG2_Val = false;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
        
        
    }
    else if(data->USBConnected)
    {   // If USB is connected, the computer has agreed to give us 500mA
        data->externalPowerSource = USB_500MA_EXT_POWER;
        
        chargeEnable = true;

        // TODO: Change SEL value to false when used in production with battery
        vars->MCP73871WriteVars.SEL_Val = false;    // Input type selection (Low for USB port, High for ac-dc adapter)
        vars->MCP73871WriteVars.PROG2_Val = true;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
        
    }
    else if(PLIB_PORTS_PinGet(PORTS_ID_0, config.USB_Dp_Ch, config.USB_Dp_Bit))
    {   // If the D+ line is high, a 2A charger is plugged in
        data->externalPowerSource = CHARGER_2A_EXT_POWER;

        chargeEnable = true;
        
        vars->MCP73871WriteVars.SEL_Val = true;    // Input type selection (Low for USB port, High for ac-dc adapter)
        vars->MCP73871WriteVars.PROG2_Val = false;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
        
    }
    else if(PLIB_PORTS_PinGet(PORTS_ID_0, config.USB_Dn_Ch, config.USB_Dn_Bit))
    {   // If the D+ line is high, a 1A charger is plugged in
        data->externalPowerSource = CHARGER_1A_EXT_POWER;

        chargeEnable = true;
        
        vars->MCP73871WriteVars.SEL_Val = true;    // Input type selection (Low for USB port, High for ac-dc adapter)
        vars->MCP73871WriteVars.PROG2_Val = false;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
        
    }
    else
    {   // Else we don't know what is powering the board, so default to 100mA
        data->externalPowerSource = UNKNOWN_EXT_POWER;

        chargeEnable = true;
        
        // TODO: Change SEL value to false when used in production with battery
        vars->MCP73871WriteVars.SEL_Val = true;    // Input type selection (Low for USB port, High for ac-dc adapter)
        vars->MCP73871WriteVars.PROG2_Val = false;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)        
    }    
    
    // If there is a battery fault or missing battery, don't allow charging and turn SEL to high to avoid brownout
    if(data->MCP73871Data.status==FAULT || !data->pONBattPresent)
    {
        chargeEnable = false;
        vars->MCP73871WriteVars.SEL_Val = true;
    }

    MCP73871_ChargeEnable(config.MCP73871Config, &data->MCP73871Data, &vars->MCP73871WriteVars, chargeEnable, data->pONBattPresent);
    MCP73871_Write(config.MCP73871Config, vars->MCP73871WriteVars);
}

void Power_USB_Con_Update(sPowerConfig config, sPowerData *data, bool connected)
{
    data->USBConnected = connected;
}