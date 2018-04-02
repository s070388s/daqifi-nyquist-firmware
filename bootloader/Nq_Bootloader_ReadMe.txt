To enable bootloader:
Build Dqifi firmware with bootloader option in MHC: USB_DEVICE, Build an Application Linker Script
Change app_mz.ld in firmware project to look like this:
/*************************************************************************
 * For interrupt vector handling
 *************************************************************************/
PROVIDE(_vector_spacing = 0x00000001);
PROVIDE(_ebase_address = 0x9D000000);

/*************************************************************************
 * Memory Address Equates
 * _RESET_ADDR                    -- Reset Vector
 * _BEV_EXCPT_ADDR                -- Boot exception Vector
 * _DBG_EXCPT_ADDR                -- In-circuit Debugging Exception Vector
 * _SIMPLE_TLB_REFILL_EXCPT_ADDR  -- Simple TLB-Refill Exception Vector
 * _CACHE_ERR_EXCPT_ADDR          -- Cache-error Exception Vector
 * _GEN_EXCPT_ADDR                -- General Exception Vector
 *************************************************************************/

_RESET_ADDR                    = 0x9D016000;
_SIMPLE_TLB_REFILL_EXCPT_ADDR  = _ebase_address + 0;
_CACHE_ERR_EXCPT_ADDR          = _ebase_address + 0x100;
_GEN_EXCPT_ADDR                = _ebase_address + 0x180;

/*************************************************************************
 * Memory Regions
 *
 * Memory regions without attributes cannot be used for orphaned sections.
 * Only sections specifically assigned to these regions can be allocated
 * into these regions.
 *
 * The Debug exception vector is located at 0x9FC00480.
 * The config_<address> sections are used to locate the config words at
 * their absolute addresses.
 *************************************************************************/
MEMORY
{
    kseg1_boot_mem          : ORIGIN = 0x9D016000, LENGTH = 0x480
    kseg0_program_mem  (rx) : ORIGIN = 0x9D016000 + 0x480, LENGTH = 0x200000 - 0x480 - 0x16000 /* All C files will be located here */
    
    kseg0_boot_mem          : ORIGIN = 0x9D016000, LENGTH = 0x0   
  kseg0_data_mem       (w!x)  : ORIGIN = 0x80000000, LENGTH = 0x80000
  sfrs                        : ORIGIN = 0xBF800000, LENGTH = 0x100000
  kseg2_ebi_data_mem          : ORIGIN = 0xC0000000, LENGTH = 0x4000000
  kseg2_sqi_data_mem          : ORIGIN = 0xD0000000, LENGTH = 0x4000000
  kseg3_ebi_data_mem          : ORIGIN = 0xE0000000, LENGTH = 0x4000000
  kseg3_sqi_data_mem          : ORIGIN = 0xF0000000, LENGTH = 0x4000000
}

In the bootloader project's btl_mz.ld, the reset address line should read as follows:
#define BOOTLOADER_RESET_ADDRESS    (0x9D016000)

Be sure config fuses are the same between bootloader and firmware projects.

Set bootloader project as main project and build/program.

----------------------------------------------------------------------------------------------------
To force bootloader:
Hold user button for ~20seconds (until board resets)
Release button.  At this time, the LEDs should light solid.
To enter bootloader, hold button until white LED blinks.

or 

Sort Pin 5 of P6 to pin 3 of P6 and powering the board from USB.
