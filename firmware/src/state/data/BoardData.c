#include "BoardData.h"

#include "Util/FreeRTOSLockProvider.h"

BoardData __attribute__((coherent)) g_BoardData;

void InitializeBoardData(BoardData* boardData)
{    
    memset(&boardData->DIOLatest, 0, sizeof(DIOSample));
    DIOSampleList_Initialize(&boardData->DIOSamples, 32, true, &g_RTOSLockProvider);
    
    memset(&boardData->AInState, 0, sizeof(AInModDataArray));
    
    memset(&boardData->AInLatest, 0, sizeof(AInSampleArray));
    boardData->AInLatest.Size = MAX_AIN_DATA_MOD;
    AInSampleList_Initialize(&boardData->AInSamples, 60, true, &g_RTOSLockProvider);
    
    boardData->PowerData.powerState = MICRO_ON;
    boardData->PowerData.battLow = false;
    boardData->PowerData.pONBattPresent = false;
    boardData->PowerData.battVoltage = 0.0;
    boardData->PowerData.chargePct = 0;
    boardData->PowerData.USBConnected = false;
    boardData->PowerData.requestedPowerState = NO_CHANGE;       // Initialize to NO_CHANGE nominally for debugging, can use DO_POWER_UP to power immediately
    boardData->PowerData.powerDnAllowed = false;
    boardData->PowerData.externalPowerSource = NO_EXT_POWER;
    
    boardData->PowerData.MCP73871Data.chargeAllowed = true;
    boardData->PowerData.MCP73871Data.status = NO_INPUT;
    
    boardData->UIReadVars.LED1 = false;
    boardData->UIReadVars.LED2 = false;
    boardData->UIReadVars.button = false;
    
    boardData->wifiSettings.type = DaqifiSettings_Wifi;
    
}
