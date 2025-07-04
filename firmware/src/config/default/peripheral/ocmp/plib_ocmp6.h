/*******************************************************************************
  Output Compare (OCMP) Peripheral Library Interface Header File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_ocmp6.h

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

#ifndef PLIB_OCMP6_H
#define PLIB_OCMP6_H

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

/*************************** OCMP6 API ****************************************/
// *****************************************************************************
/* Function:
   void OCMP6_Initialize (void)

  Summary:
    Initialization function OCMP6 peripheral

  Description:
    This function initializes the OCMP6 peripheral with user input
	from the configurator.

  Parameters:
    void

  Returns:
    void
*/
void OCMP6_Initialize (void);

// *****************************************************************************
/* Function:
   void OCMP6_Enable (void)

  Summary:
    Enable function OCMP6 peripheral

  Description:
    This function enables the OCMP6 peripheral

  Parameters:
    void

  Returns:
    void
*/
void OCMP6_Enable (void);

// *****************************************************************************
/* Function:
   void OCMP6_Disable (void)

  Summary:
    Disable function OCMP6 peripheral

  Description:
    This function disables the OCMP6 peripheral.

  Parameters:
    void

  Returns:
    void
*/
void OCMP6_Disable (void);



uint16_t OCMP6_CompareValueGet (void);

uint16_t OCMP6_CompareSecondaryValueGet (void);
void OCMP6_CompareSecondaryValueSet (uint16_t value);


// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif

// DOM-IGNORE-END
#endif // PLIB_OCMP6_H
