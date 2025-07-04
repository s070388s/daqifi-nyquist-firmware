/*******************************************************************************
  Output Compare (OCMP) Peripheral Library Interface Header File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_ocmp1.h

  Summary:
    OCMP PLIB Header File

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

#ifndef PLIB_OCMP1_H
#define PLIB_OCMP1_H

#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>
#include "device.h"
#include "plib_ocmp_common.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility
    extern "C" {
#endif
// DOM-IGNORE-END


// *****************************************************************************
// Section: Interface
// *****************************************************************************
// *****************************************************************************

/*************************** OCMP1 API ****************************************/
// *****************************************************************************
/* Function:
   void OCMP1_Initialize (void)

  Summary:
    Initialization function OCMP1 peripheral

  Description:
    This function initializes the OCMP1 peripheral with user input
	from the configurator.

  Parameters:
    void

  Returns:
    void
*/
void OCMP1_Initialize (void);

// *****************************************************************************
/* Function:
   void OCMP1_Enable (void)

  Summary:
    Enable function OCMP1 peripheral

  Description:
    This function enables the OCMP1 peripheral

  Parameters:
    void

  Returns:
    void
*/
void OCMP1_Enable (void);

// *****************************************************************************
/* Function:
   void OCMP1_Disable (void)

  Summary:
    Disable function OCMP1 peripheral

  Description:
    This function disables the OCMP1 peripheral.

  Parameters:
    void

  Returns:
    void
*/
void OCMP1_Disable (void);



uint16_t OCMP1_CompareValueGet (void);

uint16_t OCMP1_CompareSecondaryValueGet (void);
void OCMP1_CompareSecondaryValueSet (uint16_t value);

// *****************************************************************************
/* Function:
  void OCMP1_CallbackRegister( OCMP_CALLBACK callback, uintptr_t context )

  Summary:
    Sets the callback function for a ocmp interrupt.

  Description:
    This function sets the callback function that will be called when the OCMP
    conditions are met.

  Precondition:
    None.

  Parameters:
    *callback   - a pointer to the function to be called when value is reached.
                  Use NULL to Un Register the compare callback

    context     - a pointer to user defined data to be used when the callback
                  function is called. NULL can be passed in if no data needed.

  Returns:
    void
*/
void OCMP1_CallbackRegister(OCMP_CALLBACK callback, uintptr_t context);

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif

// DOM-IGNORE-END
#endif // PLIB_OCMP1_H
