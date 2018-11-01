#include "BoardData.h"

#include "Util/NullLockProvider.h"
#include "../../HAL/ADC.h"
BoardData __attribute__((coherent)) g_BoardData;

void InitializeBoardData(BoardData* boardData)
{    
    memset(&boardData->DIOLatest, 0, sizeof(DIOSample));
    DIOSampleList_Initialize(&boardData->DIOSamples, MAX_DIO_SAMPLE_COUNT, false, &g_NullLockProvider);
    
    memset(&boardData->AInState, 0, sizeof(AInModDataArray));
    
    memset(&boardData->AInLatest, 0, sizeof(AInSampleArray));
    boardData->AInLatest.Size = MAX_AIN_DATA_MOD;
    AInSampleList_Initialize(&boardData->AInSamples, MAX_AIN_SAMPLE_COUNT, false, &g_NullLockProvider);
    
    // Set default battery values for debugging - allows power on without ADC active
    // TODO: This should be omitted for production
    // size_t index = ADC_FindChannelIndex(&g_BoardConfig.AInChannels, ADC_CHANNEL_VBATT);
    // boardData->AInLatest.Data[index].Value = 4095;
    
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
