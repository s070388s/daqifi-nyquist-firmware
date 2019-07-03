/* 
 * File:   BQ24297.h
 * Author: Chris Lange
 *
 * Created on March 12, 2017, 6:45 PM
 */

#ifndef BQ24297_H
#define BQ24297_H

#include "system_config.h"
#include "system_definitions.h"

#ifdef	__cplusplus
extern "C" {
#endif
    

typedef enum
    {   
        //  No input power present or battery only
        NO_INPUT = 0,
        //  No battery or charge disabled
        NO_BATT,
        //  Charging
        CHARGING,
        //  Charge complete
        CHARGE_COMPLETE,
        // Fault
        FAULT,
        // Low battery
        LOW_BATT,
    } BQ24297_STATUS;
    
 typedef struct sBQ24297Config{
	PORTS_CHANNEL SDA_Ch;
	PORTS_BIT_POS SDA_Bit;
	PORTS_CHANNEL SCL_Ch; 
	PORTS_BIT_POS SCL_Bit;
	PORTS_CHANNEL OTG_Ch; 
	PORTS_BIT_POS OTG_Bit; 
	PORTS_CHANNEL CE_Ch; 
	PORTS_BIT_POS CE_Bit; 
	PORTS_CHANNEL INT_Ch; 
	PORTS_BIT_POS INT_Bit; 
	PORTS_CHANNEL STAT_Ch; 
	PORTS_BIT_POS STAT_Bit;
    SYS_MODULE_INDEX I2C_Index;
    unsigned char I2C_Address;
 } sBQ24297Config;

  typedef struct sBQ24297Data{
	unsigned char INT_Val;
	unsigned char STAT_Val;
    bool chargeAllowed;
    BQ24297_STATUS status;
    DRV_HANDLE I2C_Handle;
 } sBQ24297Data;
 
   typedef struct sBQ24297WriteVars{

	unsigned char OTG_Val;	// Input type selection (Low for USB port, High for ac-dc adapter)
	unsigned char CE_Val;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
 } sBQ24297WriteVars;
 
    /**
     * Sets the default variable values and initializes hardware
     */
    void BQ24297_Init(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data *data);
 
    /**
    * Reads data from BQ24297.
    * TODO:
    * @param config
    * @param data 
    * @return
    */
    uint8_t BQ24297_Read_I2C(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data data, uint8_t reg);
    
    /**
    * Writes data to the the BQ24297.
    * TODO:
    * @param config
    * @param write
    * @return
    */
    void BQ24297_Write_I2C(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data data, uint8_t reg, uint8_t txData);
    
    void BQ24297_ChargeEnable(sBQ24297Config config, sBQ24297Data *data, sBQ24297WriteVars *write, bool chargeEnable, bool pONBattPresent);

#ifdef	__cplusplus
}
#endif
#endif /* BQ24297_H */