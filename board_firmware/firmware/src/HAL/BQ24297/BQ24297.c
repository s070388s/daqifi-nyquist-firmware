/*! @file BQ24297.c
 * @brief Implementation of the BQ24297 driver functions
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
#include "state/board/BoardConfig.h"
#include "state/data/BoardData.h"
#include "state/runtime/BoardRuntimeConfig.h"

#include "BQ24297.h"

static void BQ24297_Write_I2C( uint8_t reg, uint8_t txData );
static uint8_t BQ24297_Read_I2C( uint8_t reg );
//static void BQ24297_ForceDPDM( void );

void BQ24297_InitHardware( void )
{
    const tPowerConfig *pPowerConfig =                                      \
        BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    const tPowerWriteVars *pPowerWriteVariables =                           \
        BoardRunTimeConfig_Get( BOARDRUNTIMECONFIG_POWER_WRITE_VARIABLES );
    
    // Battery management initialization (hardware interface)
    
    // Open the I2C Driver for Master
    pPowerData->BQ24297Data.I2C_Handle = DRV_I2C_Open(                     \
        pPowerConfig->BQ24297Config.I2C_Index, DRV_IO_INTENT_READWRITE );
    
    // Set I/O such that we can power up when needed
    PLIB_PORTS_PinWrite(                                                    \
        PORTS_ID_0,                                                         \
        pPowerConfig->BQ24297Config.OTG_Ch,                                 \
        pPowerConfig->BQ24297Config.OTG_Bit,                                \
        pPowerWriteVariables->BQ24297WriteVars.OTG_Val );
}

void BQ24297_InitSettings( void )
{
    uint8_t reg = 0;    // Temporary value to hold current register value
    
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    
    // Read the current status data
    BQ24297_UpdateStatus();
    
    while( pData->status.iinDet_Read ){
        BQ24297_UpdateStatus();
    }
    
    // At this point, the chip has evaluated the power source, 
    // so we should get the current limit
    // and save it when writing to register 0
    reg = BQ24297_Read_I2C( 0x00 );
    
    // Set input voltage limit to 3.88V: VINDPM = 0
    // REG00: 0b00000XXX
    BQ24297_Write_I2C( 0x00, reg & 0b00000111 );
     
    // Reset watchdog, disable charging,
    // set system voltage limit to 3.0V: SYS_MIN = 0b000
    // We will enable battery charging later - after we determine
    // if the battery is connected
    // REG01: 0b01000001
    BQ24297_Write_I2C( 0x01, 0b01000001 );
    
    // Set fast charge to 2000mA - this should never need to be updated
    BQ24297_Write_I2C( 0x02, 0b01100000 );
    
    // Set charge voltage to 4.096V
    BQ24297_Write_I2C( 0x04, 0b10010110 );
    
    // Disable watchdog WATCHDOG = 0, set charge timer to 20hr
    // REG05: 0b10001110
    BQ24297_Write_I2C( 0x05, 0b10001110 );
    
    // Read the current status data
    BQ24297_UpdateStatus();
    
    // Evaluate current power source and set current limits
    BQ24297_AutoSetILim();
    
    // Infer battery's existence from status
    // If ntc has a cold fault and vsys is true, battery is likely not present
    pData->status.batPresent =                                              \
        !( ( pData->status.ntcFault == NTC_FAULT_COLD ) &&                   \
        ( pData->status.vsysStat == true ) );
    
    // If battery is present, enable charging
    BQ24297_ChargeEnable();
    
    pData->initComplete = true;     
}

void BQ24297_UpdateStatus( void )
{
    uint8_t regData = 0;
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    
    regData = BQ24297_Read_I2C( 0x00 );
    pData->status.hiZ = (bool)( regData & 0b10000000 );
    pData->status.inLim = (uint8_t)( regData & 0b00000111 );
    
    regData = BQ24297_Read_I2C( 0x01 );
    pData->status.otg = (bool)( regData & 0b00100000 );
    pData->status.chg = (bool)( regData & 0b00010000 );
    
    regData = BQ24297_Read_I2C( 0x02 );
    pData->status.ichg = (uint8_t)( regData & 0b11111100 ) >> 2;
    
    // Make sure we are not still trying to determine the input source
    regData = BQ24297_Read_I2C( 0x07 );
    pData->status.iinDet_Read = (bool) (regData & 0b10000000);
    
    regData = BQ24297_Read_I2C( 0x08 );
    pData->status.vBusStat = (uint8_t)( regData & 0b11000000 ) >> 6;
    pData->status.chgStat = (uint8_t)( regData & 0b00110000 ) >> 4;
    pData->status.dpmStat = (bool)( regData & 0b00001000 );
    pData->status.pgStat = (bool)( regData & 0b00000100 );
    pData->status.thermStat = (bool)( regData & 0b00000010 );
    pData->status.vsysStat = (bool)( regData & 0b00000001 );
    
    // First read to REG09 resets faults
    regData = BQ24297_Read_I2C( 0x09 );
    
    // Second read to REG09 will send current status
    regData = BQ24297_Read_I2C( 0x09 );
    pData->status.watchdog_fault = (bool)( regData & 0b10000000 );
    pData->status.otg_fault = (bool)( regData & 0b01000000 );
    pData->status.chgFault = (uint8_t)( regData & 0b00110000 ) >> 4;
    pData->status.bat_fault = (bool)( regData & 0b00001000 );
    pData->status.ntcFault = (uint8_t)( regData & 0b00000011 );
}

void BQ24297_ChargeEnable( void )
{
    uint8_t reg = 0;    // Temporary value to hold current register value
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    bool chargeEnable = pData->status.batPresent;
    
    reg = BQ24297_Read_I2C( 0x01 );
    if( pData->chargeAllowed && chargeEnable ){
        // Enable charging, and write register
        BQ24297_Write_I2C( 0x01, reg | 0b00010000 );
    }
    else
    {
        // Disable charging, and write register
        BQ24297_Write_I2C( 0x01, reg & 0b11101111 );
    }
}

void BQ24297_AutoSetILim( void )
{
    uint8_t reg0;    // Temporary value to hold current register value
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    
    reg0 = BQ24297_Read_I2C( 0x00 );
 
    //  Set system input current
    switch( pData->status.vBusStat)
    {
        case 0b00:
            // Unknown - assume it is a charger. 
            // Set IINLIM to 2000mA - maximum allowed on charger
            BQ24297_Write_I2C( 0x00, 0b00000110 | ( reg0 & 0b11111000 ) );
            break;
        case 0b01:
            // Set to 500mA - maximum allowed on USB 2.0
            // TODO: Only using 2A as 500mA causes whining!
            BQ24297_Write_I2C( 0x00, 0b00000110 | ( reg0 & 0b11111000 ) );
            break;
        case 0b10:
            // Unknown - assume it is a charger.
            // Set IINLIM to 2000mA - maximum allowed on charger
            BQ24297_Write_I2C( 0x00, 0b00000110 | ( reg0 & 0b11111000 ) );
            break;
        default:
            break;
    }
}

static void BQ24297_Write_I2C( uint8_t reg, uint8_t txData )
{
    static uintptr_t I2CWriteBufferHandle;
    uint8_t I2CData[2];
    tPowerConfig *pPowerConfig =                                      \
        (tPowerConfig *)BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tBQ24297Config *pConfig = &pPowerConfig->BQ24297Config;
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    
    // Build data packet
    I2CData[0] = reg;
    I2CData[1] = txData;
       
    if( pData->I2C_Handle != DRV_HANDLE_INVALID ){
        if ( ( I2CWriteBufferHandle == DRV_I2C_BUFFER_HANDLE_INVALID ) ||   \
            ( DRV_I2C_TransferStatusGet(                                    \
                            pData->I2C_Handle,                              \
                            I2CWriteBufferHandle ) ==                       \
            DRV_I2C_BUFFER_EVENT_COMPLETE ) ||                              \
            ( DRV_I2C_TransferStatusGet( pData->I2C_Handle,                 \
                            I2CWriteBufferHandle ) ==                       \
            DRV_I2C_BUFFER_EVENT_ERROR ) ){
                // Write to selected register
                I2CWriteBufferHandle = DRV_I2C_Transmit(                    \
                            pData->I2C_Handle,                              \
                            pConfig->I2C_Address,                           \
                            I2CData, 2, NULL);

            while( !( DRV_I2C_TransferStatusGet(                            \
                            pData->I2C_Handle, I2CWriteBufferHandle ) ==    \
                DRV_I2C_BUFFER_EVENT_COMPLETE ) ){
                    // Wait for transaction to be completed - return control
                    // to RTOS
                    vTaskDelay( 1 / portTICK_PERIOD_MS );
            }
        }
    }    
}

static uint8_t BQ24297_Read_I2C( uint8_t reg )
{
    static DRV_I2C_BUFFER_HANDLE I2CWriteBufferHandle;
    DRV_I2C_BUFFER_EVENT result;
    
    uint8_t I2CData[1];
    uint8_t rxData = 0;
    
    tPowerConfig *pPowerConfig =                                      \
        (tPowerConfig *)BoardConfig_Get( BOARDCONFIG_POWER_CONFIG, 0 );
    tPowerData *pPowerData =                                          \
        (tPowerData *)BoardData_Get( BOARDATA_POWER_DATA, 0 );
    tBQ24297Config *pConfig = &pPowerConfig->BQ24297Config;
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    
    // Build data packet
    I2CData[0] = reg;
    
    if( pData->I2C_Handle != DRV_HANDLE_INVALID ){
        if( ( I2CWriteBufferHandle == DRV_I2C_BUFFER_HANDLE_INVALID ) ||    \
            ( DRV_I2C_TransferStatusGet(                                    \
                            pData->I2C_Handle, I2CWriteBufferHandle ) ==    \
            DRV_I2C_BUFFER_EVENT_COMPLETE ) ||                              \
            ( DRV_I2C_TransferStatusGet(                                    \
                            pData->I2C_Handle,                              \
                            I2CWriteBufferHandle ) ==                       \
            DRV_I2C_BUFFER_EVENT_ERROR ) ){
            // For some reason, this is required if running from the 
            // bootloader - otherwise I2C hangs
                vTaskDelay( 10 / portTICK_PERIOD_MS ); 
                I2CWriteBufferHandle = DRV_I2C_TransmitThenReceive(         \
                            pData->I2C_Handle,                              \
                            pConfig->I2C_Address,                           \
                            I2CData,                                        \
                            1,                                              \
                            &rxData,                                        \
                            1,                                              \
                            NULL );
        }
        result = DRV_I2C_TransferStatusGet(                                 \
                            pData->I2C_Handle,                              \
                            I2CWriteBufferHandle );
        while( !( result == DRV_I2C_BUFFER_EVENT_COMPLETE ) ){
            result = DRV_I2C_TransferStatusGet(                             \
                            pData->I2C_Handle,                              \
                            I2CWriteBufferHandle );
            // Wait for transaction to be completed - 
            // return control to RTOS
            vTaskDelay( 1 / portTICK_PERIOD_MS );
        }
    }
    return(rxData);
}

/*
static void BQ24297_ForceDPDM( void )
{
    uint8_t reg = 0;    // Temporary value to hold current register value
    tPowerData *pPowerData =                                                \
        BoardData_Get( BOARDATA_POWER_DATA, 0 );
    
    tBQ24297Data *pData = &pPowerData->BQ24297Data;
    // ----Untested implementation!----
    // Be sure that the USB lines are disconnected ie. USBCSR0bits.SOFTCONN = 0

    reg = BQ24297_Read_I2C( 0x07 );

    // Force DPDM detection
    // REG07: 0b1XXXXXXX
    BQ24297_Write_I2C( 0x07, reg | 0b10000000 );

    BQ24297_UpdateStatus();
    while( pData->status.iinDet_Read ){
        BQ24297_UpdateStatus();
    }
}
*/ 
 