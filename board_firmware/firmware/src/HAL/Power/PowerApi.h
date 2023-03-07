/* 
 * File:   PowerApi.h
 * Author: Daniel
 *
 * Created on January 11, 2017, 7:06 PM
 */

#ifndef POWERAPI_H
#define	POWERAPI_H

#include "system_config.h"
#include "system_definitions.h"
#include "HAL/BQ24297/BQ24297.h"

#ifdef	__cplusplus
extern "C" {
#endif
    typedef enum
     {  
        /* Power board down */        
        DO_POWER_DOWN = 0,
        /* Power was just applied */
        FRESH_BOOT,
        /* 3.3V rail enabled after fresh boot. Ready to check initial status */
        MICRO_ON,
        /* Enable power rails besides 3.3V */
        DO_POWER_UP,
        /* Board fully powered. Monitor for any changes/faults */ 
        POWERED_UP,
        /* Power is low or other fault.  Power off external power rails. */
        DO_EXT_DOWN,
        /* Board partially powered. External power disabled. */         
        POWERED_UP_EXT_DOWN,
     } POWER_STATE;
   
   
    typedef enum
     {      
        /* No power detected. */ 
        NO_EXT_POWER,
        /* Unknown source */         
        UNKNOWN_EXT_POWER,
        /* 2 amp external charger */
        CHARGER_1A_EXT_POWER,
        /* 2 amp external charger */
        CHARGER_2A_EXT_POWER,
        /* 100mA USB power */
        USB_100MA_EXT_POWER,
        /* 500mA USB power */
        USB_500MA_EXT_POWER,
     } EXT_POWER_SOURCE;

    typedef struct sPowerConfig{

        PORTS_CHANNEL EN_Vref_Ch;
        PORTS_BIT_POS EN_Vref_Bit;
        PORTS_CHANNEL EN_3_3V_Ch; 
        PORTS_BIT_POS EN_3_3V_Bit; 
        PORTS_CHANNEL EN_5_10V_Ch; 
        PORTS_BIT_POS EN_5_10V_Bit; 
        PORTS_CHANNEL EN_5V_ADC_Ch; 
        PORTS_BIT_POS EN_5V_ADC_Bit; 
        PORTS_CHANNEL EN_12V_Ch; 
        PORTS_BIT_POS EN_12V_Bit; 
        PORTS_CHANNEL USB_Dp_Ch; 
        PORTS_BIT_POS USB_Dp_Bit; 
        PORTS_CHANNEL USB_Dn_Ch; 
        PORTS_BIT_POS USB_Dn_Bit;
       
       sBQ24297Config BQ24297Config;

    } sPowerConfig;

    typedef struct sPowerData{

       uint8_t chargePct;
       POWER_STATE powerState;
       EXT_POWER_SOURCE externalPowerSource;
       
       // Variables below are meant to be updated externally
       bool USBSleep;
       bool battLow;
       bool powerDnAllowed;
       double battVoltage;
       bool pONBattPresent;
       
       sBQ24297Data BQ24297Data;

    } sPowerData;
    
    typedef struct sPowerWriteVars{

       unsigned char EN_Vref_Val;
       unsigned char EN_3_3V_Val;
       unsigned char EN_5_10V_Val;
       unsigned char EN_5V_ADC_Val;
       unsigned char EN_12V_Val;
       sBQ24297WriteVars BQ24297WriteVars;

    } sPowerWriteVars;
    
    void Power_Init(sPowerConfig config, sPowerData *data, sPowerWriteVars vars);
    void Power_Update_Settings(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars);
    void Power_USB_Sleep_Update(sPowerConfig config, sPowerData *data, bool connected);
    void Power_Write(sPowerConfig config, sPowerWriteVars *vars);
    void Power_Up(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars);
    void Power_Down(sPowerConfig configs, sPowerData *data, sPowerWriteVars *vars);
    void Power_UpdateState(sPowerConfig config, sPowerData *data, sPowerWriteVars *vars);
    void Power_UpdateChgPct(sPowerData *data);
    void Power_Tasks(sPowerConfig PowerConfig, sPowerData *PowerData, sPowerWriteVars *powerVars);
    
#ifdef	__cplusplus
}
#endif

#endif	/* POWERAPI_H */

