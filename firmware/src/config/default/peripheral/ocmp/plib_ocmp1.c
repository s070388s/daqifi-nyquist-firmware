/*******************************************************************************
  Output Compare OCMP1 Peripheral Library (PLIB)

  Company:
    Microchip Technology Inc.

  File Name:
    plib_ocmp1.c

  Summary:
    OCMP1 Source File

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
#include "plib_ocmp1.h"
#include "interrupts.h"

// *****************************************************************************

// *****************************************************************************
// Section: OCMP1 Implementation
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************


volatile static OCMP_OBJECT ocmp1Obj;

void OCMP1_Initialize (void)
{
    /*Setup OC1CON        */
    /*OCM         = 6        */
    /*OCTSEL       = 1        */
    /*OC32         = 0        */
    /*SIDL         = false    */

    OC1CON = 0xe;

    OC1R = 0;
    OC1RS = 0;

    IEC0SET = _IEC0_OC1IE_MASK;
}

void OCMP1_Enable (void)
{
    OC1CONSET = _OC1CON_ON_MASK;
}

void OCMP1_Disable (void)
{
    OC1CONCLR = _OC1CON_ON_MASK;
}



uint16_t OCMP1_CompareValueGet (void)
{
    return (uint16_t)OC1R;
}

void OCMP1_CompareSecondaryValueSet (uint16_t value)
{
    OC1RS = value;
}

uint16_t OCMP1_CompareSecondaryValueGet (void)
{
    return (uint16_t)OC1RS;
}

void OCMP1_CallbackRegister(OCMP_CALLBACK callback, uintptr_t context)
{
    ocmp1Obj.callback = callback;

    ocmp1Obj.context = context;
}

void __attribute__((used)) OUTPUT_COMPARE_1_InterruptHandler (void)
{
    /* Additional local variable to prevent MISRA C violations (Rule 13.x) */
    uintptr_t context = ocmp1Obj.context;      
    IFS0CLR = _IFS0_OC1IF_MASK;    //Clear IRQ flag

    if( (ocmp1Obj.callback != NULL))
    {
        ocmp1Obj.callback(context);
    }
}

