
#include "RunTimeStats.h"
/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */
RunTimeData runTimeStats;
/*  A brief description of a section can be given directly below the section
    banner.
 */

void RunTimeStats_Initialize(void)
{
    runTimeStats.NumBytesWrittenUsbCdc         = 0;
    runTimeStats.NumBytesStreamToUsbBuf = 0;
    runTimeStats.NumBytesScpiToUsbBuf   = 0;
}


/* *****************************************************************************
 End of File
 */
