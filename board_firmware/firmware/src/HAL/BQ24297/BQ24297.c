#include "BQ24297.h"

void BQ24297_Init(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data *data)
{
    // Battery management initialization
    
    // Open the I2C Driver for Master
    data->I2C_Handle = DRV_I2C_Open( config.I2C_Index, DRV_IO_INTENT_READWRITE );
    
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.CE_Ch, config.CE_Bit, write.CE_Val);
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.OTG_Ch, config.OTG_Bit, write.OTG_Val);
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
                // TODO: Wait for transaction to be completed - maybe return control to RTOS?
            }
        }
    }
    
}

uint8_t BQ24297_Read_I2C(sBQ24297Config config, sBQ24297WriteVars write, sBQ24297Data data, uint8_t reg)
{
    static DRV_I2C_BUFFER_HANDLE I2CWriteBufferHandle;
    volatile DRV_I2C_BUFFER_EVENT result;
    
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
            // TODO: Wait for transaction to be completed - return control to RTOS?
            vTaskDelay(1 / portTICK_PERIOD_MS);
        }
    }
    return(rxData);
}

void BQ24297_ChargeEnable(sBQ24297Config config, sBQ24297Data *data, sBQ24297WriteVars *write, bool chargeEnable, bool pONBattPresent)
{
    if(data->chargeAllowed && chargeEnable && data->status!=FAULT && pONBattPresent)
    {

    }
    else
    {

    }
}