#include "BQ24297.h"

void BQ24297_Init(sBQ24297Config config, sBQ24297WriteVars write)
{
    // Battery management initialization
    BQ24297_Write(config, write);
}

void BQ24297_Write(sBQ24297Config config, sBQ24297WriteVars write)
{
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.CE_Ch, config.CE_Bit, write.CE_Val);
    PLIB_PORTS_PinWrite(PORTS_ID_0, config.OTG_Ch, config.OTG_Bit, write.OTG_Val);
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


void BQ24297_Read(sBQ24297Config config, sBQ24297Data *data)
{

}
