/* 
 * File:   MCP73871.h
 * Author: Chris Lange
 *
 * Created on March 12, 2017, 6:45 PM
 */

#ifndef MCP73871_H
#define MCP73871_H

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
    } MCP13871_STATUS;
    
 typedef struct sMCP73871Config{
     
	PORTS_CHANNEL SEL_Ch;
	PORTS_BIT_POS SEL_Bit;
	PORTS_CHANNEL PROG2_Ch; 
	PORTS_BIT_POS PROG2_Bit; 
	PORTS_CHANNEL TE_Ch; 
	PORTS_BIT_POS TE_Bit; 
	PORTS_CHANNEL STAT1_Ch; 
	PORTS_BIT_POS STAT1_Bit; 
	PORTS_CHANNEL STAT2_Ch; 
	PORTS_BIT_POS STAT2_Bit; 
	PORTS_CHANNEL PG_Ch; 
	PORTS_BIT_POS PG_Bit;
    PORTS_CHANNEL CE_Ch; 
	PORTS_BIT_POS CE_Bit;
	
 } sMCP73871Config;

  typedef struct sMCP73871Data{

	unsigned char STAT1_Val;
	unsigned char STAT2_Val;
	unsigned char PG_Val;
    bool chargeAllowed;

	
    MCP13871_STATUS status;
 } sMCP73871Data;
 
   typedef struct sMCP73871WriteVars{

	unsigned char SEL_Val;		// Input type selection (Low for USB port, High for ac-dc adapter)
	unsigned char PROG2_Val;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
	unsigned char TE_Val;		// Timer Enable; Enables Safety Timer when active Low
    unsigned char CE_Val;       // Charge enable; active high
	
 } sMCP73871WriteVars;
 
    /**
     * Sets the default variable values and initializes hardware
     */
    void MCP73871_Init(sMCP73871Config config, sMCP73871WriteVars write);
 
    /**
    * Reads all 8 channels from the MCP73871.
    * TODO:
    * @param id
    * @param CONVST_En
    * @param Data[] 8 deep data array to hold each 18bit result  
    * @return
    */
    void MCP73871_Read(sMCP73871Config config, sMCP73871Data *data);
    
    /**
    * Writes all 8 channels from the MCP73871.
    * TODO:
    * @param id
    * @param CONVST_En
    * @param Data[] 8 deep data array to hold each 18bit result  
    * @return
    */
    void MCP73871_Write(sMCP73871Config config, sMCP73871WriteVars write);

    /**
    * Converts a status read from the MCP73871 to an integer status definition.
    * TODO:
    * @param global_config
    * @return
    */
    void MCP73871_ComputeStatus(sMCP73871Data *data);
    
    void MCP73871_ChargeEnable(sMCP73871Config config, sMCP73871Data *data, sMCP73871WriteVars *write, bool chargeEnable, bool pONBattPresent);

#ifdef	__cplusplus
}
#endif
#endif /* MCP73871_H */