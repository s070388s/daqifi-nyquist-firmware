/*! @file BQ24297.h
 * @brief Header of the BQ24297 driver
 * 
 * @author Javier Longares Abaiz
 * j.longares@abluethinginthecloud.com
 * 
 * A Blue Thing In The Cloud S.L.U.
 *   === When Technology becomes art ===
 * www.abluethinginthecloud.com
 *     
 */

#ifndef BQ24297_H
#define BQ24297_H

#include "system_config.h"
#include "system_definitions.h"

#ifdef	__cplusplus
extern "C" {
#endif
    

typedef struct
{
    // From control register 0x00
    bool hiZ;
    enum inLim_t{ILim_100, ILim_150, ILim_500, ILim_900, ILim_1000, ILim_1500, ILim_2000, ILim_3000} inLim;
    
    // From power-on configuration 0x01
    bool otg;
    bool chg;
    
    // From charger current control register 0x02
    uint8_t ichg;
    
    // From operation control register 0x07
    bool iinDet_Read;
    
    // From status register 0x08
    enum vBusStat_t{VBUS_UNKNOWN, VBUS_USB, VBUS_CHARGER, VBUS_OTG} vBusStat;
    enum chgStat_t{CHG_STAT_NOCHARGE, CHG_STAT_PRECHARGE, CHG_STAT_FASTCHARGE, CHG_STAT_CHARGED} chgStat;
    bool dpmStat;
    bool pgStat;
    bool thermStat;
    bool vsysStat;
    
    // From fault register 0x09
    bool watchdog_fault;
    bool otg_fault;
    enum chgFault_t{CHG_FAULT_NORMAL, CHG_FAULT_INPUTFAULT, CHG_FAULT_THERMAL, CHG_FAULT_TIMER} chgFault;
    bool bat_fault;
    enum ntcFault_t{NTC_FAULT_NORMAL, NTC_FAULT_HOT, NTC_FAULT_COLD, NTC_FAULT_HOTCOLD} ntcFault;
    
    // Inferred battery status from registers
    bool batPresent;
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
 } tBQ24297Config;

  typedef struct sBQ24297Data{
	unsigned char INT_Val;
	unsigned char STAT_Val;
    volatile bool intFlag;
    bool chargeAllowed;
    bool initComplete;
    BQ24297_STATUS status;
    DRV_HANDLE I2C_Handle;
 } tBQ24297Data;
 
   typedef struct sBQ24297WriteVars{

	unsigned char OTG_Val;	// Input type selection (Low for USB port, High for ac-dc adapter)
	unsigned char CE_Val;	// USB port input current limit selection when SEL = Low. (Low = 100 mA, High = 500 mA)
 } tBQ24297WriteVars;
 
    /**
     * Initializes hardware
     */
    void BQ24297_InitHardware( void );
 
    /**
     * Sets the default variable values via I2C
     */
    void BQ24297_InitSettings( void );
    
    void BQ24297_ChargeEnable( void );

    void BQ24297_UpdateStatus( void );
    
    void BQ24297_AutoSetILim( void );


    
#ifdef	__cplusplus
}
#endif
#endif /* BQ24297_H */