/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

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

#include "app.h"

#include "system/system.h"
#include "bootloader/src/bootloader.h"
#include "bootloader/src/nvm.h"
#include "peripheral/peripheral.h"
#include <sys/kmem.h> 
#include "system_definitions.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

#define UNUSED(x) (void)(x)

#define BOOT_RESET_DELAY 5      // Delay for user to press button to enter bootloader (timer is ~0.9sec per integer)
#define BOOT_POWER_DELAY 5      // Delay for user to press button to power off board      

#define STATUS_LED_MODULE PORTS_ID_0
#define STATUS_LED_PORT PORT_CHANNEL_C
#define STATUS_LED_PIN PORTS_BIT_POS_3

#define STATUS2_LED_MODULE PORTS_ID_0
#define STATUS2_LED_PORT PORT_CHANNEL_B
#define STATUS2_LED_PIN PORTS_BIT_POS_14

#define BUTTON_MODULE PORTS_ID_0
#define BUTTON_PORT PORT_CHANNEL_J
#define BUTTON_PIN PORTS_BIT_POS_14

#define PWR_3_3V_EN_MODULE PORTS_ID_0
#define PWR_3_3V_EN_PORT PORT_CHANNEL_H
#define PWR_3_3V_EN_PIN PORTS_BIT_POS_12

#define BOOTLOADER_FORCE_MODULE PORTS_ID_0
#define BOOTLOADER_FORCE_PORT PORT_CHANNEL_B
#define BOOTLOADER_FORCE_PIN PORTS_BIT_POS_1

#define POWER_GOOD_MODULE PORTS_ID_0
#define POWER_GOOD_PORT PORT_CHANNEL_K
#define POWER_GOOD_PIN PORTS_BIT_POS_5

#define FORCE_BOOTLOADER_FLAG_ADDR 0x8007FFE0 // Address must match what is defined in the project preprocessor definition (0x8007FFE0 is the last 16 bytes of data mem)
#define FORCE_BOOOT_VALUE 0x04CEB007    // magic force bootloader value

#define TIMER_PERIOD (uint32_t)500   //mS
#define SYS_TIMER
#define BOOTLOADER_PRIME_WINDOW     (uint32_t)5000   //mSeconds
#define BOOTLOADER_FORCE_DURATION   (uint32_t)5000   //mSeconds
#define BOOTLOADER_POWER_DURATION   (uint32_t)5000/TIMER_PERIOD   //mSeconds

APP_DATA appData;
static SYS_TMR_HANDLE m_TimerCallback;

bool forceBootloader = false;
bool bootloaderConnected = false;
bool bootloaderDownloading = false;

extern BOOTLOADER_DATA bootloaderData __attribute__((coherent, aligned(16)));
volatile uint32_t force_bootloader_flag __attribute__((persistent, coherent, address(FORCE_BOOTLOADER_FLAG_ADDR)));
volatile uint32_t g_timerCount = 0;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************
/******************************************************************************
  Function:
    static void APP_Bootloader_ForceEvent (void)
    
   Remarks:
    Sets a trigger to be passed to force bootloader callback.
    Run bootloader if switch_1 is pressed OR
    if memory location == '0xFFFFFFFF' otherwise jump to user 
    application.
*/ 
int APP_Bootloader_ForceEvent(void)
{
    if (force_bootloader_flag == FORCE_BOOOT_VALUE) forceBootloader = true;
    // Reset flag as we accomplished our task of entering the bootloader
    force_bootloader_flag = 0;

    /* Check the trigger memory location and return true/false. */
    if (*(uint32_t *)APP_RESET_ADDRESS == 0xFFFFFFFF) forceBootloader = true;
    
    return (forceBootloader);
}

/**
 * Called to set processor status prior to executing main application
 */
int APP_StartApp(void)
{
    /* Disable Global Interrupts */
    PLIB_INT_Disable(INT_ID_0);
    
    /* Disable Individual Interrupts */
    IEC0=0;
    IEC1=0;
    IEC2=0;
    IEC3=0;
    IEC4=0;
    IEC5=0;
    IEC6=0;
    
    IFS0=0;
    IFS1=0;
    IFS2=0;
    IFS3=0;
    IFS4=0;
    IFS5=0;
    IFS6=0;
    
    IPC0=0;
    IPC1=0;
    IPC2=0;
    IPC3=0;
    IPC4=0;
    IPC5=0;
    IPC6=0;
    
    /* Disable Timers */
    T1CONbits.ON=0;
    T2CONbits.ON=0;
    T3CONbits.ON=0;
    T4CONbits.ON=0;
    T5CONbits.ON=0;
    T6CONbits.ON=0;
    T7CONbits.ON=0;
    T8CONbits.ON=0;
    T9CONbits.ON=0;
    
    PLIB_DMA_Disable(DMA_ID_0);
    
    SYS_DEVCON_CacheFlush(); // Flush L1 data cache
    
    DATASTREAM_Close();
    
    USB_DEVICE_Deinitialize(sysObj.usbDevObject0);
    //while(!USB_DEVICE_Status(sysObj.usbDevObject0)!=0);
    SYS_TMR_Deinitialize(sysObj.sysTmr);
    //while(!SYS_TMR_Status (sysObj.sysTmr)==0);
    DRV_TMR_Deinitialize(sysObj.drvTmr0);
    //while(!DRV_TMR_Status (sysObj.drvTmr0)==0);
    
    SYS_INT_VectorPrioritySet(INT_VECTOR_T2, INT_PRIORITY_LEVEL1);
    SYS_INT_VectorSubprioritySet(INT_VECTOR_T2, INT_SUBPRIORITY_LEVEL0);
    SYS_INT_VectorPrioritySet(INT_VECTOR_USB1, INT_PRIORITY_LEVEL1);

    /* Set Sub-priority of USB interrupt source */
    SYS_INT_VectorSubprioritySet(INT_VECTOR_USB1, INT_SUBPRIORITY_LEVEL0);

    /* Set the priority of the USB DMA Interrupt */
    SYS_INT_VectorPrioritySet(INT_VECTOR_USB1_DMA, INT_PRIORITY_LEVEL1);

    /* Set Sub-priority of the USB DMA Interrupt */
    SYS_INT_VectorSubprioritySet(INT_VECTOR_USB1_DMA, INT_SUBPRIORITY_LEVEL0);
    
    Nop();
    Nop();
    Nop();
    Nop();
    
    return(1);
}


// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/

// CP0 runs at SYS_CLK_FREQ/2.  So, to change that to ms, divide by 1000
#define ms_SCALE (SYS_CLK_FREQ/2/1000)

void DelayMs(uint32_t msDelay)
{
    uint32_t startCntms = _CP0_GET_COUNT();
    uint32_t waitCntms = msDelay * ms_SCALE;
    while( _CP0_GET_COUNT() - startCntms < waitCntms );
}

/**
 * Timer callback. Toggles the status led
 * @param context Unused
 */
void APP_TimerCallback(uintptr_t context, uint32_t currTick)
{
    UNUSED(context);
    UNUSED(currTick);
    
    g_timerCount++;       // Increment global timer count
    
    PLIB_PORTS_PinToggle(STATUS_LED_MODULE, STATUS_LED_PORT, STATUS_LED_PIN);
    
    Nop();
    Nop();
    Nop();
    Nop();
    
    if (bootloaderDownloading)    // If we are downloading the bootloader, flash LED2
    {
        PLIB_PORTS_PinWrite(STATUS2_LED_MODULE, STATUS2_LED_PORT, STATUS2_LED_PIN, PLIB_PORTS_PinGet(STATUS_LED_MODULE, STATUS_LED_PORT, STATUS_LED_PIN));
    }else if(bootloaderConnected) // If we are connected to the bootloader app, light LED2
    {
        PLIB_PORTS_PinSet(STATUS2_LED_MODULE, STATUS2_LED_PORT, STATUS2_LED_PIN);
    } 
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
          
    RESET_REASON reasonType;
    
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    // Register the bootloader callbacks
    BOOTLOADER_ForceBootloadRegister(APP_Bootloader_ForceEvent);
    BOOTLOADER_StartAppRegister(APP_StartApp);
    
    // Bootloader force pin
    PLIB_PORTS_PinDirectionInputSet(BOOTLOADER_FORCE_MODULE, BOOTLOADER_FORCE_PORT, BOOTLOADER_FORCE_PIN);
    
    // User button
    PLIB_PORTS_PinDirectionInputSet(BUTTON_MODULE, BUTTON_PORT, BUTTON_PIN);
    
    // Power good status
    PLIB_PORTS_PinDirectionInputSet(POWER_GOOD_MODULE, POWER_GOOD_PORT, POWER_GOOD_PIN);
    
    // Status LED1
    PLIB_PORTS_PinDirectionOutputSet(STATUS_LED_MODULE, STATUS_LED_PORT, STATUS_LED_PIN);
    PLIB_PORTS_PinClear(STATUS_LED_MODULE, STATUS_LED_PORT, STATUS_LED_PIN);
    
    // 3.3V Enable Pin
    PLIB_PORTS_PinDirectionOutputSet(PWR_3_3V_EN_MODULE, PWR_3_3V_EN_PORT, PWR_3_3V_EN_PIN);
    PLIB_PORTS_PinSet(PWR_3_3V_EN_MODULE, PWR_3_3V_EN_PORT, PWR_3_3V_EN_PIN);
    
    // Status LED2
    PLIB_PORTS_PinDirectionOutputSet(STATUS2_LED_MODULE, STATUS2_LED_PORT, STATUS2_LED_PIN);
    PLIB_PORTS_PinClear(STATUS2_LED_MODULE, STATUS2_LED_PORT, STATUS2_LED_PIN);
    
    m_TimerCallback = SYS_TMR_HANDLE_INVALID;
       
    /* Delay to allow the power to stabilize */
    DelayMs(250);
        
    reasonType = SYS_RESET_ReasonGet();
    if(reasonType & RESET_REASON_MCLR)
    {
        // If the processor has been reset from the MCLR pin, turn on LED to indicate a reset has occurred 
        // and check to see if we should enter bootloader
        PLIB_PORTS_PinSet(STATUS_LED_MODULE, STATUS_LED_PORT, STATUS_LED_PIN);
        PLIB_PORTS_PinSet(STATUS2_LED_MODULE, STATUS2_LED_PORT, STATUS2_LED_PIN);

        DelayMs(BOOTLOADER_PRIME_WINDOW);
        
        // If the user is still holding the button, stay in while and count loop cycles
        if(PLIB_PORTS_PinGet(BUTTON_MODULE, BUTTON_PORT, BUTTON_PIN))
        {
            DelayMs(BOOTLOADER_FORCE_DURATION);
            // Once we've timed out the BOOTLOADER_FORCE_DURATION and the user is still holding the button and we are powered via external power (low = powered)
            if(PLIB_PORTS_PinGet(BUTTON_MODULE, BUTTON_PORT, BUTTON_PIN) && !PLIB_PORTS_PinGet(POWER_GOOD_MODULE, POWER_GOOD_PORT, POWER_GOOD_PIN)) forceBootloader = true; 
        }
        
        // Clear the reset reason status flag
        SYS_RESET_ReasonClear(RESET_REASON_MCLR);
    }
    
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    static uint32_t timerPowerTriggered = false;
    
    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            bool appInitialized = true;
            m_TimerCallback = SYS_TMR_CallbackPeriodic((uint32_t)500, 0, APP_TimerCallback);
        
            if (appInitialized)
            {
                appData.state = APP_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            if(bootloaderData.currentState==BOOTLOADER_PROCESS_COMMAND || bootloaderData.currentState==BOOTLOADER_SEND_RESPONSE)
            {
                bootloaderConnected = true;
            }

            // This test was hopefully going to signal via LED when the bootloader was downloading.  However, this doesn't appear to be possible at this Harmony release.
            if(bootloaderData.DataTransferred)
            {
                bootloaderDownloading = true;
            }
            
            if(forceBootloader && PLIB_PORTS_PinGet(BUTTON_MODULE, BUTTON_PORT, BUTTON_PIN)) // If we are in the bootloader and the user is holding the button
            {
                static uint32_t timerPowerStartCount = 0;

                if (!timerPowerTriggered) timerPowerStartCount = g_timerCount;   // Set the start count of the timer if not already started
                timerPowerTriggered = true;

                if((g_timerCount-timerPowerStartCount)>BOOTLOADER_POWER_DURATION)
                {
                    PLIB_PORTS_PinClear(PWR_3_3V_EN_MODULE, PWR_3_3V_EN_PORT, PWR_3_3V_EN_PIN); // Disable the 3.3V power rail
                    PLIB_PORTS_PinClear(STATUS_LED_MODULE, STATUS_LED_PORT, STATUS_LED_PIN);    // Turn off LED1
                    PLIB_PORTS_PinClear(STATUS2_LED_MODULE, STATUS2_LED_PORT, STATUS2_LED_PIN); // Turn off LED2

                    // Delay for about 1s to allow the 3.3V rail to power off (unless plugged in then we will timeout and hit the reset below)
                    _CP0_SET_COUNT(0);
                    while (_CP0_GET_COUNT() < SYS_CLK_FREQ / 2);

                    SYS_RESET_SoftwareReset();  // If the board is plugged in, just reset
                }
            }else
            {
                timerPowerTriggered = false;  // User let go of the button, so reset the trigger
            }
            break;
        }

        /* TODO: implement your application state machine.*/
        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

 

/*******************************************************************************
 End of File
 */
