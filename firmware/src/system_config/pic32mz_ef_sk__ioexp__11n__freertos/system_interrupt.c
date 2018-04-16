/*******************************************************************************
 System Interrupts File

  File Name:
    system_interrupt.c

  Summary:
    Raw ISR definitions.

  Description:
    This file contains a definitions of the raw ISRs required to support the
    interrupt sub-system.

  Summary:
    This file contains source code for the interrupt vector functions in the
    system.

  Description:
    This file contains source code for the interrupt vector functions in the
    system.  It implements the system and part specific vector "stub" functions
    from which the individual "Tasks" functions are called for any modules
    executing interrupt-driven in the MPLAB Harmony system.

  Remarks:
    This file requires access to the systemObjects global data structure that
    contains the object handles to all MPLAB Harmony module objects executing
    interrupt-driven in the system.  These handles are passed into the individual
    module "Tasks" functions to identify the instance of the module to maintain.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2011-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "system/common/sys_common.h"
#include "app.h"
#include "system_definitions.h"

#include "HAL/ADC.h"

#define UNUSED(x) (void)(x)

// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector Functions
// *****************************************************************************
// *****************************************************************************
         void IntHandlerChangeNotification_PortB(void)
{
    ++g_BoardData.InISR;
    PLIB_INT_SourceFlagClear(INT_ID_0,INT_SOURCE_CHANGE_NOTICE_B);
    --g_BoardData.InISR;
}
         void IntHandlerChangeNotification_PortF(void)
{
    ++g_BoardData.InISR;
    PLIB_INT_SourceFlagClear(INT_ID_0,INT_SOURCE_CHANGE_NOTICE_F);
    --g_BoardData.InISR;
}


void IntHandlerSysDmaInstance0(void)
{  
    ++g_BoardData.InISR;
    SYS_DMA_Tasks(sysObj.sysDma, DMA_CHANNEL_0);
    --g_BoardData.InISR;
}

void IntHandlerSysDmaInstance1(void)
{
    ++g_BoardData.InISR;
    SYS_DMA_Tasks(sysObj.sysDma, DMA_CHANNEL_1);
    --g_BoardData.InISR;
}


void IntHandlerSysRtcc (void)
{
    ++g_BoardData.InISR;
    SYS_RTCC_Tasks(sysObj.sysRtcc);
    --g_BoardData.InISR;
}
void IntHandlerExternalInterruptInstance0(void)
{
    ++g_BoardData.InISR;
    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_EXTERNAL_4);
    WDRV_MRF24WN_ISR();
    --g_BoardData.InISR;
}
 

void IntHandlerDrvTmrInstance0(void)
{
    ++g_BoardData.InISR;
    DRV_TMR_Tasks(sysObj.drvTmr0);
    --g_BoardData.InISR;
}
void IntHandlerDrvTmrInstance1(void)
{
    ++g_BoardData.InISR;
    DRV_TMR_Tasks(sysObj.drvTmr1);
    --g_BoardData.InISR;
}
void IntHandlerDrvTmrInstance2(void)
{
    ++g_BoardData.InISR;
    DRV_TMR_Tasks(sysObj.drvTmr2);
    --g_BoardData.InISR;
}
 
void IntHandlerSPIRxInstance0(void)
{
    ++g_BoardData.InISR;
    DRV_SPI_Tasks(sysObj.spiObjectIdx0);
    --g_BoardData.InISR;
}
void IntHandlerSPITxInstance0(void)
{
    ++g_BoardData.InISR;
    DRV_SPI_Tasks(sysObj.spiObjectIdx0);
    --g_BoardData.InISR;
}
void IntHandlerSPIFaultInstance0(void)
{
    ++g_BoardData.InISR;
    DRV_SPI_Tasks(sysObj.spiObjectIdx0);
    --g_BoardData.InISR;
}
void IntHandlerSPIRxInstance1(void)
{
    ++g_BoardData.InISR;
    DRV_SPI_Tasks(sysObj.spiObjectIdx1);
    --g_BoardData.InISR;
}
void IntHandlerSPITxInstance1(void)
{
    ++g_BoardData.InISR;
    DRV_SPI_Tasks(sysObj.spiObjectIdx1);
    --g_BoardData.InISR;
}
void IntHandlerSPIFaultInstance1(void)
{
    ++g_BoardData.InISR;
    DRV_SPI_Tasks(sysObj.spiObjectIdx1);
    --g_BoardData.InISR;
}

void IntHandlerDrvNvm (void)

{
    ++g_BoardData.InISR;
    DRV_NVM_Tasks(sysObj.drvNvm);
    --g_BoardData.InISR;

}

void IntHandlerUSBInstance0(void)

{
    ++g_BoardData.InISR;
    DRV_USBHS_Tasks_ISR(sysObj.drvUSBObject);
    --g_BoardData.InISR;
}

void IntHandlerUSBInstance0_USBDMA ( void )
{
    ++g_BoardData.InISR;
    DRV_USBHS_Tasks_ISR_USBDMA(sysObj.drvUSBObject);
    --g_BoardData.InISR;
}

void IntHandlerDrvAdcEOS(void)
{
    ++g_BoardData.InISR;
    
    // Scanning of ADC channels is complete - so read data

    // Clear EOS interrupt flag in INT reg
    PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_ADC_END_OF_SCAN);
    
    uint32_t dummyADCCON2 = ADCCON2;    // Clear Scan Complete Interrupt Flag (the only way to do this is to read from ADCCON2)
    UNUSED(dummyADCCON2);
    
    g_BoardData.PowerData.MCP73871Data.chargeAllowed = true;
    MCP73871_ChargeEnable(g_BoardConfig.PowerConfig.MCP73871Config,
            &g_BoardData.PowerData.MCP73871Data,
            &g_BoardRuntimeConfig.PowerWriteVars.MCP73871WriteVars,
            true, g_BoardData.PowerData.pONBattPresent);
    
    // Tell the app to read the results
    const AInModule* module = ADC_FindModule(&g_BoardConfig.AInModules, AIn_MC12bADC);
    ADC_ConversionComplete(module);
    
    --g_BoardData.InISR;
}

void _ISR_DefaultInterrupt(void) 
{
    SYS_DEBUG_BreakPoint();
}
/*******************************************************************************
 End of File
*/
