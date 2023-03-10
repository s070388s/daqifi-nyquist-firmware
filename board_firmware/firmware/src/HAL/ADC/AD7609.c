#include "AD7609.h"
#include "Util/Delay.h"

#define UNUSED(x) (void)(x)

static void AD7609_Apply_SPI_Config(const AD7609ModuleConfig* config)
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

static void AD7609_Reset(const AD7609ModuleConfig* config)
{
    // Reset AD7609 by pulling RST line high for > 100ns
    PLIB_PORTS_PinWrite(config->DataModule, config->CS_Ch , config->CS_Bit, true);
    PLIB_PORTS_PinWrite(config->DataModule, config->RST_Ch , config->RST_Bit, true);
    Delay(5);

    PLIB_PORTS_PinWrite(config->DataModule, config->RST_Ch , config->RST_Bit, false);
    PLIB_PORTS_PinWrite(config->DataModule, config->CS_Ch , config->CS_Bit, false);
    // Delay after reset for chip to initialize
    Delay(5);
}

// Function unused
//static void AD7609_WaitForPinValue(PORTS_MODULE_ID index, PORTS_CHANNEL channel, PORTS_BIT_POS bitPos, bool value)
//{
//    while((PLIB_PORTS_PinGet(index, channel, bitPos)& value) != value)
//    {
//        Delay(1);
//    }
//}

bool AD7609_InitHardware(const AD7609ModuleConfig* boardConfig, const AInArray* channelConfig)
{
    AD7609_Apply_SPI_Config(boardConfig);
    
    PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->CS_Ch , boardConfig->CS_Bit, true);
    PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->RST_Ch , boardConfig->RST_Bit, true);
    PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->Range_Ch, boardConfig->Range_Bit, boardConfig->Range10V);
    PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->OS0_Ch , boardConfig->OS0_Bit, boardConfig->OSMode & 0b01);
    PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->OS1_Ch , boardConfig->OS1_Bit, boardConfig->OSMode & 0b10);
    PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->CONVST_Ch, boardConfig->CONVST_Bit, false);
    
    // Board reset occurs later (AD7609_UpdateModuleState)
    UNUSED(channelConfig);
    
    return true;
}

bool AD7609_WriteModuleState(const AD7609ModuleConfig* boardConfig, AInModuleRuntimeConfig* runtimeConfig, bool isPowered)
{
    if (!isPowered)
    {
        return false;
    }
    
    // TODO: Do we expose the STBY pin?
    bool isEnabled = !(PLIB_PORTS_PinGet(boardConfig->DataModule, boardConfig->RST_Ch , boardConfig->RST_Bit));
    if (isEnabled != runtimeConfig->IsEnabled)
    {
        if (runtimeConfig->IsEnabled)
        {
            AD7609_Reset(boardConfig);
        }
        else
        {
            // Hold in reset
            PLIB_PORTS_PinWrite(boardConfig->DataModule, boardConfig->RST_Ch , boardConfig->RST_Bit, runtimeConfig->IsEnabled);
        }
    }
    
    return true;
}

bool AD7609_WriteStateSingle(const AD7609ModuleConfig* moduleConfig,
        AInModuleRuntimeConfig* moduleRuntimeConfig,
        const AD7609ChannelConfig* channelConfig,
        AInRuntimeConfig* channelRuntimeConfig)
{
    UNUSED(moduleConfig);
    UNUSED(moduleRuntimeConfig);
    UNUSED(channelConfig);
    UNUSED(channelRuntimeConfig);
    
    // Nothing yet!
    
    return true;
}

bool AD7609_WriteStateAll(const AD7609ModuleConfig* moduleConfig,
        AInModuleRuntimeConfig* moduleRuntimeConfig,
        const AInArray* channelConfig,
        AInRuntimeArray* channelRuntimeConfig)
{
    int i=0;
    bool result = true;
    for (i=0; i<channelRuntimeConfig->Size; ++i)
    {
        result &= AD7609_WriteStateSingle(moduleConfig, moduleRuntimeConfig, &channelConfig->Data[i].Config.AD7609, &channelRuntimeConfig->Data[i]);
    }
    
    return result;
}

bool AD7609_ReadSamples(AInSampleArray* samples, const AD7609ModuleConfig* moduleConfig,
            AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInArray* channelConfigList,
            AInRuntimeArray* channelRuntimeConfigList,
            uint32_t triggerTimeStamp)
{
    if (!moduleRuntimeConfig->IsEnabled)
    {
        return false;
    }
    
    AD7609_Apply_SPI_Config(moduleConfig);
    
    // If the chip is not ready, bail out
    if (PLIB_PORTS_PinGet(moduleConfig->DataModule, moduleConfig->BSY_Ch, moduleConfig->BSY_Bit))
    {
        return false;
    }
	
    // Select the chip
	PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch, moduleConfig->CS_Bit, false);
    Delay(5); // Wait for the board to settle
    
    uint8_t x=0;
	uint8_t SPIData=0;;
	uint16_t Data16[9];
    
    for(x=0;x<9;x++)
    {
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
		PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x00);
        
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
		SPIData=PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);	// Read buffer
		Data16[x]=SPIData;	// Store into temporary data array
        
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
		PLIB_SPI_BufferWrite(moduleConfig->SPI.spiID,0x00);
        
        while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
		SPIData=PLIB_SPI_BufferRead(moduleConfig->SPI.spiID);	// Read buffer
		Data16[x]=(Data16[x]<<8)|SPIData;	// Store into temporary data array
	}

    // TODO: Double check calculations
 	while(PLIB_SPI_IsBusy(moduleConfig->SPI.spiID));
    
    // Deselect the chip
	PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CS_Ch, moduleConfig->CS_Bit, false);
    
    // Convert the raw data to samples
    for (x=0; x<channelConfigList->Size; ++x)
    {
        const AInRuntimeConfig* runtimeConfig = &(channelRuntimeConfigList->Data[x]);
        if (!runtimeConfig->IsEnabled)
        {
            continue;
        }
        
        // Rather than sending us each 18 bit sample individually (which would waste 6 bits per channel),
        // the AD7609 sends us 18 bytes that we need to dice up into 18-bit chucks
        const AInChannel* channelConfig = &(channelConfigList->Data[x]);
        uint8_t index = channelConfig->Config.AD7609.ChannelIndex;
        uint8_t bitOffset = 2 * channelConfig->Config.AD7609.ChannelIndex;
        uint16_t lowBits = Data16[index] >> bitOffset; // Take the remainder of the current index
        uint16_t highBits = Data16[index + 1] & (0xFFFF >> (14 - bitOffset)); // Take as many bits as needed to make 18
        
        volatile uint32_t tmpData = lowBits & (((uint32_t)highBits) << (16 - bitOffset));
        if( tmpData & 0b100000000000000000 )
        {
            tmpData = 0xFFFC0000 | tmpData; // Convert from negative 18 bit to negative 32 bit 2s compelement
        }
        
        AInSample* sample = &samples->Data[samples->Size];
        sample->Channel = channelConfig->ChannelId;
        sample->Timestamp = triggerTimeStamp;   // We are using the module trigger timestamp here to allow streaming to know which are part of the same set
        sample->Value = tmpData; // The XYZ_ConvertToVoltage functions are called downstream for conversion (FPU doesn't work in an ISR)
        samples->Size += 1;
	}
    
    return true;
}

bool AD7609_TriggerConversion(const AD7609ModuleConfig* moduleConfig)
{
    AD7609_Apply_SPI_Config(moduleConfig);
    
    // If the AD7609 is busy the trigger fails
    if (PLIB_PORTS_PinGet(moduleConfig->DataModule, moduleConfig->BSY_Ch, moduleConfig->BSY_Bit))
    {
        return false;
    }

    AD7609_Reset(moduleConfig);
    
    PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CONVST_Ch, moduleConfig->CONVST_Bit, false);	// Force the CONVST pin low
    Delay(5); // Wait for the board to settle
    PLIB_PORTS_PinWrite(moduleConfig->DataModule, moduleConfig->CONVST_Ch, moduleConfig->CONVST_Bit, true);	// Pull CONVST pin high to start conversion

    // Wait until the conversion actually starts
    Delay(1);
    
    // Enable interrupt on change since a conversion has been started
    // TODO: Use semaphore/ to disallow other SPI (temp sensor) transfer while we are waiting for a sample to complete
    PLIB_PORTS_ChannelChangeNoticeEnable(moduleConfig->DataModule, moduleConfig->BSY_Ch, moduleConfig->BSY_BitMask);
    
    return true;
}

double AD7609_ConvertToVoltage(const AD7609ChannelConfig* channelConfig,
            const AInRuntimeConfig* runtimeConfig,
            const AD7609ModuleConfig* moduleConfig,
            const AInModuleRuntimeConfig* moduleRuntimeConfig,
            const AInSample* sample)
{
    double vRef = moduleConfig->Range10V ? 10.0 : 5.0;
    double divVal = runtimeConfig->IsDifferential ? 512.0 : 262144.0;
    UNUSED(channelConfig);
    
    return vRef * (sample->Value / divVal);
}