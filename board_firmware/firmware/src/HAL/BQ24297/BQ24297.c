#include "BQ24297.h"

void BQ24297_InitHardware(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data *data)
{
    // Battery management initialization (hardware interface)
    
    // Open the I2C Driver for Master
    data->I2C_Handle = DRV_I2C_Open( config.I2C_Index, DRV_IO_INTENT_READWRITE );
    
    // Set I/O such that we can power up when needed
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.OTG_Ch, config.OTG_Bit, write.OTG_Val);
}

void BQ24297_InitSettings(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data *data)
{
    uint8_t reg = 0;    // Temporary value to hold current register value
    
    // Read the current status data
    BQ24297_UpdateStatus(config, write, data);
    while(data->status.iinDet_Read) BQ24297_UpdateStatus(config, write, data);
    
    // At this point, the chip has evaluated the power source, so we should get the current limit
    // and save it when writing to register 0
    reg = BQ24297_Read_I2C(config, write, *data, 0x00);
    
    // Set input voltage limit to 3.88V: VINDPM = 0
    // REG00: 0b00000XXX
    BQ24297_Write_I2C(config, write, *data, 0x00, reg & 0b00000111);
     
    // Reset watchdog, disable charging, set system voltage limit to 3.0V: SYS_MIN = 0b000
    // We will enable battery charging later - after we determine if the battery is connected
    // REG01: 0b01000001
    BQ24297_Write_I2C(config, write, *data, 0x01, 0b01000001);
    
    // Set fast charge to 2000mA
    BQ24297_Write_I2C(config, write, *data, 0x02, 0b01100000);
    
    // Set charge voltage to 4.2V
    BQ24297_Write_I2C(config, write, *data, 0x04, 0b10110010);
    
    // Disable watchdog WATCHDOG = 0, set charge timer to 20hr
    // REG05: 0b10001110
    BQ24297_Write_I2C(config, write, *data, 0x05, 0b10001110);
    
    // Read the current status data
    BQ24297_UpdateStatus(config, write, data);
    
    // Infer battery's existence from status
    // If ntc has a cold fault and vsys is true, battery is likely not present
    data->status.batPresent = !((data->status.ntcFault == NTC_FAULT_COLD) && (data->status.vsysStat == true));
    
    // If battery is present, enable charging
    BQ24297_ChargeEnable(config, &write, data, data->status.batPresent);
    
    data->initComplete = true;     
}

void BQ24297_Write_I2C(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data data, uint8_t reg, uint8_t txData)
{
    static uintptr_t I2CWriteBufferHandle;
    uint8_t I2CData[2];
    
    // Build data packet
    I2CData[0] = reg;
    I2CData[1] = txData;
       
    if(data.I2C_Handle != DRV_HANDLE_INVALID)
    {
        if ( (I2CWriteBufferHandle == DRV_I2C_BUFFER_HANDLE_INVALID) || 
                    (DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle) == DRV_I2C_BUFFER_EVENT_COMPLETE) ||
                        (DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle) == DRV_I2C_BUFFER_EVENT_ERROR) )
        {
            // Write to selected register
            I2CWriteBufferHandle = DRV_I2C_Transmit (data.I2C_Handle, config.I2C_Address, &I2CData[0], 2, NULL);

            while(!(DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle)==DRV_I2C_BUFFER_EVENT_COMPLETE))
            {
                // Wait for transaction to be completed - return control to RTOS
                vTaskDelay(1 / portTICK_PERIOD_MS);
            }
        }
    }
    
}

uint8_t BQ24297_Read_I2C(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data data, uint8_t reg)
{
    static DRV_I2C_BUFFER_HANDLE I2CWriteBufferHandle;
    DRV_I2C_BUFFER_EVENT result;
    
    uint8_t I2CData[1];
    uint8_t rxData = 0;
    
    // Build data packet
    I2CData[0] = reg;
    
    if(data.I2C_Handle != DRV_HANDLE_INVALID)
    {
        if ( (I2CWriteBufferHandle == DRV_I2C_BUFFER_HANDLE_INVALID) || 
                    (DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle) == DRV_I2C_BUFFER_EVENT_COMPLETE) ||
                        (DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle) == DRV_I2C_BUFFER_EVENT_ERROR) )
        {
            I2CWriteBufferHandle = DRV_I2C_TransmitThenReceive (data.I2C_Handle, config.I2C_Address, &I2CData[0], 1, &rxData, 1, NULL);
        }

        result = DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle);
        while(!(result==DRV_I2C_BUFFER_EVENT_COMPLETE))
        {
            result = DRV_I2C_TransferStatusGet(data.I2C_Handle, I2CWriteBufferHandle);
            // Wait for transaction to be completed - return control to RTOS
            vTaskDelay(1 / portTICK_PERIOD_MS);
        }
    }
    return(rxData);
}

void BQ24297_UpdateStatus(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data *data)
{
    uint8_t regData = 0;
    
    regData = BQ24297_Read_I2C(config, write, *data, 0x00);
    data->status.hiZ = (bool) (regData & 0b10000000);
    data->status.inLim = (uint8_t) (regData & 0b00000111);
    
    regData = BQ24297_Read_I2C(config, write, *data, 0x01);
    data->status.otg = (bool) (regData & 0b00100000);
    data->status.chg = (bool) (regData & 0b00010000);
    
    // Make sure we are not still trying to determine the input source
    regData = BQ24297_Read_I2C(config, write, *data, 0x07);
    data->status.iinDet_Read = (bool) (regData & 0b10000000);
    
    regData = BQ24297_Read_I2C(config, write, *data, 0x08);
    data->status.vBusStat = (uint8_t) (regData & 0b11000000) >> 6;
    data->status.chgStat = (uint8_t) (regData & 0b00110000) >> 4;
    data->status.dpmStat = (bool) (regData & 0b00001000);
    data->status.pgStat = (bool) (regData & 0b00000100);
    data->status.thermStat = (bool) (regData & 0b00000010);
    data->status.vsysStat = (bool) (regData & 0b00000001);
    
    // First read to REG09 resets faults
    regData = BQ24297_Read_I2C(config, write, *data, 0x09);
    
    // Second read to REG09 will send current status
    regData = BQ24297_Read_I2C(config, write, *data, 0x09);
    data->status.watchdog_fault = (bool) (regData & 0b10000000);
    data->status.otg_fault = (bool) (regData & 0b01000000);
    data->status.chgFault = (uint8_t) (regData & 0b00110000) >> 4;
    data->status.bat_fault = (bool) (regData & 0b00001000);
    data->status.ntcFault = (uint8_t) (regData & 0b00000011);
}

void BQ24297_ChargeEnable(sBQ24297Config config, sBQ24297WriteVars *write, sBQ24297Data *data, bool chargeEnable)
{
    uint8_t reg = 0;    // Temporary value to hold current register value
    reg = BQ24297_Read_I2C(config, *write, *data, 0x01);
    if(data->chargeAllowed && chargeEnable && data->status.batPresent)
    {
        // Enable charging, and write register
        BQ24297_Write_I2C(config, *write, *data, 0x01, reg | 0b00010000);
    }
    else
    {
        // Disable charging, and write register
        BQ24297_Write_I2C(config, *write, *data, 0x01, reg & 0b11101111);
    }
}