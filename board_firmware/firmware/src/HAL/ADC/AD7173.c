#include "AD7173.h"
#include "Util/Delay.h"

#define UNUSED(x) (void)(x)

static void AD7173_Apply_SPI_Config(const AD7173ModuleConfig* config)
{
    //Disable SPI
    PLIB_SPI_Disable(config->SPI.spiID);
    // Optional: Clear SPI interrupts and status flag.
    //clear SPI buffer
    PLIB_SPI_BufferClear (config->SPI.spiID);
    // Configure General SPI Options
    PLIB_SPI_StopInIdleDisable(config->SPI.spiID);
    PLIB_SPI_PinEnable(config->SPI.spiID, SPI_PIN_DATA_OUT|SPI_PIN_DATA_IN);
    PLIB_SPI_CommunicationWidthSelect(config->SPI.spiID, config->SPI.busWidth);
    PLIB_SPI_InputSamplePhaseSelect(config->SPI.spiID,config->SPI.inSamplePhase);
    PLIB_SPI_ClockPolaritySelect(config->SPI.spiID, config->SPI.clockPolarity);
    PLIB_SPI_OutputDataPhaseSelect(config->SPI.spiID, config->SPI.outDataPhase);
    
    PLIB_SPI_BaudRateClockSelect (config->SPI.spiID, config->SPI.clock);
    PLIB_SPI_BaudRateSet(config->SPI.spiID, SYS_CLK_PeripheralFrequencyGet(config->SPI.busClk_id),config->SPI.baud);
    PLIB_SPI_MasterEnable(config->SPI.spiID);
    PLIB_SPI_FramedCommunicationDisable(config->SPI.spiID);
    // Optional: Enable interrupts.
    // Enable the module
    PLIB_SPI_Enable(config->SPI.spiID);
    while(PLIB_SPI_IsBusy(config->SPI.spiID));
}

static void AD7173_Reset(const AD7173ModuleConfig* config)
{
    // Select the chip
	PLIB_PORTS_PinWrite(config->DataModule, config->CS_Ch, config->CS_Bit, false);
    
    uint8_t x;
    for(x=0;x<8;x++)
    {
        while(PLIB_SPI_IsBusy(config->SPI.spiID));
		PLIB_SPI_BufferWrite(config->SPI.spiID,0xFF);
        
        while(PLIB_SPI_IsBusy(config->SPI.spiID));
        PLIB_SPI_BufferRead(config->SPI.spiID);
	}
    
    // Deselect the chip
    PLIB_PORTS_PinWrite(config->DataModule, config->CS_Ch , config->CS_Bit, true);
}

static void AD7173_WaitForPinValue(PORTS_MODULE_ID index, PORTS_CHANNEL channel, PORTS_BIT_POS bitPos, bool value)
{
    while(PLIB_PORTS_PinGet(index, channel, bitPos) != value)
    {
        Delay(5);
    }
}

bool AD7173_InitHardware(const AD7173ModuleConfig* moduleConfig, const AInArray* channelConfig)
{
   
	uint8_t COMMS;	//COMMS register
	uint16_t IFMODE=0b0000100001000000;		//0x0840 IFMODE register 0x2: iostrength high, data stat on
    uint16_t SETUP0=0b0000111100000000;		// SETUP0 register: Unipolar output, buffers on, external Vref
    uint16_t deviceID=0;

    // Set port directions
    PLIB_PORTS_PinDirectionOutputSet(moduleConfig->DataModule, moduleConfig->CS_Ch , moduleConfig->CS_Bit);
    PLIB_PORTS_PinDirectionInputSet(moduleConfig->DataModule, moduleConfig->ERR_Ch , moduleConfig->ERR_Bit);
   
	// Initialize all associated ports to known value
    PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch , moduleConfig->CS_Bit, true);
	
    AD7173_Apply_SPI_Config(moduleConfig);
	
	// Send reset to AD7173
	AD7173_Reset(moduleConfig);
	
	//  Delay at least 500us before accessing registers
    Delay(20);
	
    // Select the chip
    PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch , moduleConfig->CS_Bit, false);
    
	// ADCMODE register is written to in AD7173_StartConv() as a write causes a new conversion
	
	COMMS=0b00000010;	// Write to IFMODE register
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,COMMS);
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)(IFMODE>>8));
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)IFMODE);
    
    COMMS=0b00100000;	// Write to SETUP0 register
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,COMMS);
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)(SETUP0>>8));
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)SETUP0);
	
	COMMS=0b01000111;	// Read device ID which should be 0x30DX.
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,COMMS);
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x00);
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
	deviceID=PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x00);
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
	deviceID=(deviceID<<8)|PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);

    deviceID=deviceID>>4;
    SYS_ASSERT(deviceID==0x3CD, "Bad device id!");   

    PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch , moduleConfig->CS_Bit, true);
       
    return (deviceID==0x3CD);
}

bool AD7173_WriteModuleState(const AD7173ModuleConfig* moduleConfig, AInModuleRuntimeConfig* runtimeConfig, bool isPowered)
{
    static bool isEnabled = false;
    
    if (!isPowered)
    {
        return false;
    }
    
    if (runtimeConfig->IsEnabled == isEnabled)
    {
        return false;
    }
    
    // TODO: We actually have no way of enabling or disabling the module
    // leave the module alone for now.
    // AD7173_Reset(moduleConfig);
    
    return true;
}

bool AD7173_WriteStateSingle(const AD7173ModuleConfig* moduleConfig,
        AInModuleRuntimeConfig* moduleRuntimeConfig,
        const AD7173ChannelConfig* channelConfig,
        AInRuntimeConfig* channelRuntimeConfig)
{
    uint8_t COMMS=0;	//COMMS register
    uint16_t CHSetting=0;
    uint16_t AINPOS=0;
    uint16_t AINNEG=0;
    
    UNUSED(moduleRuntimeConfig);
    
    if(channelRuntimeConfig->IsEnabled)
    {
        if(channelRuntimeConfig->IsDifferential)
        {
            if((channelConfig->ChannelIndex)%2==0)  // If channel is even:
            {
                AINPOS=channelConfig->ChannelIndex;
                AINNEG=(channelConfig->ChannelIndex)+1;
            }else
            {
                AINPOS=(channelConfig->ChannelIndex)-1;
                AINNEG=channelConfig->ChannelIndex;
            }
        }else
        {
            AINPOS=channelConfig->ChannelIndex;
            AINNEG=0b10110; // REF-
        }
    
        
        CHSetting=0b1000000000000000|(AINPOS<<5)|AINNEG;		// Enable, setup sel=0, set AINPOS, AINNEG
        
    
        // Select the chip
        PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch , moduleConfig->CS_Bit, false);

        COMMS=0x10|channelConfig->ChannelIndex;	// Write to CH register
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
        PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
        PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,COMMS);
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
        PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
        PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)(CHSetting>>8));
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
        PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
        PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)CHSetting);
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
        
        PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch , moduleConfig->CS_Bit, true);
    }
        
    return true;
}

bool AD7173_WriteStateAll(const AD7173ModuleConfig* moduleConfig,
        AInModuleRuntimeConfig* moduleRuntimeConfig,
        const AInArray* channelConfig,
        AInRuntimeArray* channelRuntimeConfig)
{
    int i=0;
    bool result = true;
    for (i=0; i<channelRuntimeConfig->Size; ++i)
    {
        result &= AD7173_WriteStateSingle(moduleConfig, moduleRuntimeConfig, &channelConfig->Data[i].Config.AD7173, &channelRuntimeConfig->Data[i]);
    }
    
    return result;
}



bool AD7173_ReadSamples(AInSampleArray* samples, const AD7173ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfigList,
            AInRuntimeArray* channelRuntimeConfigList,
            uint32_t triggerTimeStamp)
{
    if (!moduleRuntimeConfig->IsEnabled)
    {
        return false;
    }
    
    uint8_t x=0;
	uint32_t ADCData=0;
    uint8_t ADCStat=0;
    uint8_t ADCCh=0;
    

    AD7173_Apply_SPI_Config(moduleConfig);

    PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch, moduleConfig->CS_Bit, false);	//Enable CS_DDS

	AD7173_WaitForPinValue(moduleConfig->DataModule, moduleConfig->SPI_SDI_Ch, moduleConfig->SPI_SDI_Bit, false);// If the AD7173 is busy, wait to read data
    
    while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    
    // Read 24 data bits and 8 status bits
    PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x44);   // Send read buffer command
    while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);

    for(x=0;x<3;x++)
    {
        PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x00);
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
        
        ADCData=(ADCData<<8)|((uint8_t)PLIB_SPI_BufferRead(moduleConfig->SPI.spiID));
    }
    
    PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x00);
    while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    
    ADCStat=PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
    
    ADCCh=ADCStat & 0x0F;
    
	PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch, moduleConfig->CS_Bit, true);	//Disable CS_DDS
    
    // Convert the raw data to samples
    for (x=0; x<channelConfigList->Size; ++x)
    {
        const AInRuntimeConfig* runtimeConfig = &(channelRuntimeConfigList->Data[x]);
        if (!runtimeConfig->IsEnabled)
        {
            continue;
        }

        const AInChannel* channelConfig = &(channelConfigList->Data[x]);
        uint8_t index = channelConfig->Config.AD7173.ChannelIndex;
        
        if(index==ADCCh)
        {
            AInSample* sample = &samples->Data[samples->Size];
            sample->Channel = channelConfig->ChannelId;
            sample->Timestamp = triggerTimeStamp;   // We are using the module trigger timestamp here to allow streaming to know which are part of the same set
            sample->Value = ADCData; // The XYZ_ConvertToVoltage functions are called downstream for conversion (FPU doesn't work in an ISR)
            samples->Size += 1;
        }
        
    }
    PLIB_PORTS_ChannelChangeNoticeEnable(moduleConfig->DataModule, moduleConfig->SPI_SDI_Ch, moduleConfig->SPI_SDI_BitMask);
    return true;
}

bool AD7173_TriggerConversion(const AD7173ModuleConfig* moduleConfig)
{
    //The ADC mode register controls the operating mode of the ADC and the master 
    //clock selection. A write to the ADC mode register resets
    //the filter and the RDY bits and starts a new conversion or calibration. 
        
	uint16_t ADCMODE=0b1010000000010000;	//0xA010 ADCMODE register 0x1: int ref on, sing_cyc on, single conversion mode
	PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch, moduleConfig->CS_Bit, false);	//Enable CS_DDS
	
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0b00000001);
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)(ADCMODE>>8));
	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
	PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,(uint8_t)ADCMODE);
    while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);
      
    // In order to detect the end of conversion, the CS line must be held low (active) until conversion is complete
    // At that time, CS line can be disabled.
    // PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch, moduleConfig->CS_Bit, true);	//Disable CS_DDS
    
    // Enable interrupt on change since a conversion has been started
    // TODO: Use semaphore/ to disallow other SPI (temp sensor) transfer while we are waiting for a sample to complete
    PLIB_PORTS_ChannelChangeNoticeEnable(moduleConfig->DataModule, moduleConfig->SPI_SDI_Ch, moduleConfig->SPI_SDI_BitMask);
    
    return false;
}

double AD7173_ConvertToVoltage(const AD7173ChannelConfig* channelConfig,
            const AInRuntimeConfig* runtimeConfig,
            const AD7173ModuleConfig* moduleConfig,
            const AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInSample* sample)
{
    double vRef = 5.0;
    double divVal = runtimeConfig->IsDifferential ? 4096.0 :16777216.0;
    UNUSED(channelConfig);
    UNUSED(moduleConfig);
    
    return vRef * (sample->Value / divVal);
}