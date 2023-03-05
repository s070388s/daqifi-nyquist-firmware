#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-usbdevice_pic32mz_ef_sk.mk)" "nbproject/Makefile-local-usbdevice_pic32mz_ef_sk.mk"
include nbproject/Makefile-local-usbdevice_pic32mz_ef_sk.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=usbdevice_pic32mz_ef_sk
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/main.c ../src/app.c ../../../../../framework/bootloader/src/bootloader.c ../../../../../framework/bootloader/src/nvm.c ../../../../../framework/bootloader/src/datastream/datastream.c ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../framework/system/clk/src/sys_clk.c ../../../../../framework/system/clk/src/sys_clk_pic32mz.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c ../../../../../framework/usb/src/dynamic/usb_device.c ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c ../../../../../framework/usb/src/dynamic/usb_device_hid.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/686445382/bootloader.o ${OBJECTDIR}/_ext/686445382/nvm.o ${OBJECTDIR}/_ext/615392287/datastream.o ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ${OBJECTDIR}/_ext/52938249/sys_clk.o ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ${OBJECTDIR}/_ext/179651966/drv_usbhs.o ${OBJECTDIR}/_ext/2136608937/usb_device.o ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o ${OBJECTDIR}/_ext/658126509/sys_devcon.o ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/278102762/sys_ports_static.o ${OBJECTDIR}/_ext/612711379/sys_reset.o ${OBJECTDIR}/_ext/1340256719/system_init.o ${OBJECTDIR}/_ext/1340256719/system_interrupt.o ${OBJECTDIR}/_ext/1340256719/system_exceptions.o ${OBJECTDIR}/_ext/1340256719/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/686445382/bootloader.o.d ${OBJECTDIR}/_ext/686445382/nvm.o.d ${OBJECTDIR}/_ext/615392287/datastream.o.d ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d ${OBJECTDIR}/_ext/52938249/sys_clk.o.d ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d ${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d ${OBJECTDIR}/_ext/2136608937/usb_device.o.d ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d ${OBJECTDIR}/_ext/658126509/sys_devcon.o.d ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d ${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d ${OBJECTDIR}/_ext/612711379/sys_reset.o.d ${OBJECTDIR}/_ext/1340256719/system_init.o.d ${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d ${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d ${OBJECTDIR}/_ext/1340256719/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/686445382/bootloader.o ${OBJECTDIR}/_ext/686445382/nvm.o ${OBJECTDIR}/_ext/615392287/datastream.o ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ${OBJECTDIR}/_ext/52938249/sys_clk.o ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ${OBJECTDIR}/_ext/179651966/drv_usbhs.o ${OBJECTDIR}/_ext/2136608937/usb_device.o ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o ${OBJECTDIR}/_ext/658126509/sys_devcon.o ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/278102762/sys_ports_static.o ${OBJECTDIR}/_ext/612711379/sys_reset.o ${OBJECTDIR}/_ext/1340256719/system_init.o ${OBJECTDIR}/_ext/1340256719/system_interrupt.o ${OBJECTDIR}/_ext/1340256719/system_exceptions.o ${OBJECTDIR}/_ext/1340256719/system_tasks.o

# Source Files
SOURCEFILES=../src/main.c ../src/app.c ../../../../../framework/bootloader/src/bootloader.c ../../../../../framework/bootloader/src/nvm.c ../../../../../framework/bootloader/src/datastream/datastream.c ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../framework/system/clk/src/sys_clk.c ../../../../../framework/system/clk/src/sys_clk_pic32mz.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c ../../../../../framework/usb/src/dynamic/usb_device.c ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c ../../../../../framework/usb/src/dynamic/usb_device_hid.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-usbdevice_pic32mz_ef_sk.mk ${DISTDIR}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM144
MP_LINKER_FILE_OPTION=,--script="..\src\system_config\usbdevice_pic32mz_ef_sk\btl_mz.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  .generated_files/flags/usbdevice_pic32mz_ef_sk/429717b4a1270c80a42c5f5914a46225012c4f3e .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  .generated_files/flags/usbdevice_pic32mz_ef_sk/ee40321fdff68202d2e699e426345d4d32db7e07 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/658126509/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/21d01df9dc620cc354abef84b398f4e602feff6d .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/2e6ae9ba81677337d48014baeed3039731a60cdf .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/bootloader.o: ../../../../../framework/bootloader/src/bootloader.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/31b515ac9e26ebbc807f060954abeb22b462ee88 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/bootloader.o.d" -o ${OBJECTDIR}/_ext/686445382/bootloader.o ../../../../../framework/bootloader/src/bootloader.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/nvm.o: ../../../../../framework/bootloader/src/nvm.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/37045b8754266183f0320ef38384f274a1a95ef8 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/nvm.o.d" -o ${OBJECTDIR}/_ext/686445382/nvm.o ../../../../../framework/bootloader/src/nvm.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream.o: ../../../../../framework/bootloader/src/datastream/datastream.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/b3c66b9825ef554792d008b9d8a281ad24b09963 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream.o ../../../../../framework/bootloader/src/datastream/datastream.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o: ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/451b247ac6465787c5221417b52f3b0b039ac2d1 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/941160041/drv_tmr.o: ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/4a00bfa6af64d54dcccd28f9e73a80027baa7ec .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/941160041" 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk.o: ../../../../../framework/system/clk/src/sys_clk.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/72a16f3c10d8602ba174e68de3dd3662a4aa5528 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk.o ../../../../../framework/system/clk/src/sys_clk.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o: ../../../../../framework/system/clk/src/sys_clk_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/73a7c6709949ef1ed1e09842523f07346dfa0a16 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o ../../../../../framework/system/clk/src/sys_clk_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/70e62a57de8685d4ec723759bcaa58ccaee8a90a .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/a018ce04af4c5e37931f7ab5a0d0cb78791a79eb .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/ab0666f05004e044dc691cbe4849dcd559e48f1c .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device.o: ../../../../../framework/usb/src/dynamic/usb_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/e8e29ae42693a841ab3efe2442d2b9b902279940 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device.o ../../../../../framework/usb/src/dynamic/usb_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/557cc7acd42328272c9499aa287f0f9f0f3739f3 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device_hid.o: ../../../../../framework/usb/src/dynamic/usb_device_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/5940f196e5f072342fb41374536c5c358080ffc .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o ../../../../../framework/usb/src/dynamic/usb_device_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/9d80fd96112e3e427e570716f35471dffadda461 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/4f66fa3ef53256ae9dbdb2d6d5e671dfb73417a9 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/278102762/sys_ports_static.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/660733b43509cc383a53fc0c61ffa70e6c225a7 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/278102762" 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/278102762/sys_ports_static.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/612711379/sys_reset.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/53795166ea88e6efdd6e4bb9068d4449e8807e3c .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/612711379" 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/612711379/sys_reset.o.d" -o ${OBJECTDIR}/_ext/612711379/sys_reset.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_init.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/7c8ec5e081f8b9c8d706aa14300371e329915a9e .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_init.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_init.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_interrupt.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/be67c1ad753150cd76364644b21e6b49dabb9851 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_interrupt.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_exceptions.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/8f4395b28245e26800e0547b966907152286152a .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_exceptions.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_tasks.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3f73005b2ac929867af5399f5e996c5b54d72b42 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_tasks.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/5fc281027f4354b0d835a8bf296a294f2466ab77 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/53554bb2ddaaf83821d2c7aed392c6d2d51a1a47 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/bootloader.o: ../../../../../framework/bootloader/src/bootloader.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/721f144832841c025f4afdef3075ba0d81c4b579 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/bootloader.o.d" -o ${OBJECTDIR}/_ext/686445382/bootloader.o ../../../../../framework/bootloader/src/bootloader.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/nvm.o: ../../../../../framework/bootloader/src/nvm.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3387adb34f8edf1df2e7962deab8e83bdee77373 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/nvm.o.d" -o ${OBJECTDIR}/_ext/686445382/nvm.o ../../../../../framework/bootloader/src/nvm.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream.o: ../../../../../framework/bootloader/src/datastream/datastream.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/dde79d053f71deed76c7328d25e2f7d6c84144d4 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream.o ../../../../../framework/bootloader/src/datastream/datastream.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o: ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/1cd94242a927c21281a5c466dce479130fec5ca2 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/941160041/drv_tmr.o: ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/dd9d427ef9f96c0197e1d7c070c4c14aa42f5c36 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/941160041" 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk.o: ../../../../../framework/system/clk/src/sys_clk.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/6076de95b17660ed41bcc8e9d3d39f876fdbff5b .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk.o ../../../../../framework/system/clk/src/sys_clk.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o: ../../../../../framework/system/clk/src/sys_clk_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/ec51386b4a31fe656125c7dd4e557e41f5e44ecb .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o ../../../../../framework/system/clk/src/sys_clk_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/49c893b0ed88d1f927aebe4790065541743fe6e0 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/e41fb8bf44a70f6070789c06f58df8cc3c3e9662 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/a925b247bb3d0d87176970a1bd93b1c38a5ff2c2 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device.o: ../../../../../framework/usb/src/dynamic/usb_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/2edc787787defdff1eaeb4bf38478874162c99bd .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device.o ../../../../../framework/usb/src/dynamic/usb_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/b1e6f23a6e2b4bf289bafe2119670c20f58c7dbe .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device_hid.o: ../../../../../framework/usb/src/dynamic/usb_device_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/759ab0fb8a38d05946433982c52e5675f937fed7 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o ../../../../../framework/usb/src/dynamic/usb_device_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/c2bf7b355f63ab4688c0d232b28cd619549bba08 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/ea071641040d705f2f910ea4bcf8a154d84053d3 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/278102762/sys_ports_static.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/c800e5451a2ceeae7d16c3b947571689d661fc30 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/278102762" 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/278102762/sys_ports_static.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/612711379/sys_reset.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/32c52c6ba7831162845ed7a0d0ad2de572648d26 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/612711379" 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/612711379/sys_reset.o.d" -o ${OBJECTDIR}/_ext/612711379/sys_reset.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_init.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/9994c2d1ee477bc4fdd5cd5dbea4c68cfc44faf .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_init.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_init.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_interrupt.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/e612585bd6efe85b6594923fbb48ecde78169428 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_interrupt.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_exceptions.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/cdad4b0311c7a596ed98073af371449b1c82a4e5 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_exceptions.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_tasks.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/e01f1dd9d1e6e55e7a87dd1aeab0b1bb70c1168e .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -I"../../../../../framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_tasks.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MZ2048EFM144_peripherals.a  ../src/system_config/usbdevice_pic32mz_ef_sk/btl_mz.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -O1 -o ${DISTDIR}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MZ2048EFM144_peripherals.a      -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MZ2048EFM144_peripherals.a ../src/system_config/usbdevice_pic32mz_ef_sk/btl_mz.ld ../../../board_firmware/firmware/DAQiFi_3_0.X/dist/pic32mz_ef_sk__ioexp__11n__freertos/production/DAQiFi_3_0.X.production.hex
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -O1 -o ${DISTDIR}/basic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MZ2048EFM144_peripherals.a      -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/basic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo "Creating unified hex file"
	@"C:/Program Files/Microchip/MPLABX/v6.05/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.05/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/basic.X.${IMAGE_TYPE}.hex ../../../board_firmware/firmware/DAQiFi_3_0.X/dist/pic32mz_ef_sk__ioexp__11n__freertos/production/DAQiFi_3_0.X.production.hex -odist/${CND_CONF}/production/basic.X.production.unified.hex

endif


# Subprojects
.build-subprojects:
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
	cd ../../../board_firmware/firmware/DAQiFi_3_0.X && ${MAKE}  -f Makefile CONF=pic32mz_ef_sk__ioexp__11n__freertos TYPE_IMAGE=DEBUG_RUN
else
	cd ../../../board_firmware/firmware/DAQiFi_3_0.X && ${MAKE}  -f Makefile CONF=pic32mz_ef_sk__ioexp__11n__freertos
endif


# Subprojects
.clean-subprojects:
	cd ../../../board_firmware/firmware/DAQiFi_3_0.X && ${MAKE}  -f Makefile CONF=pic32mz_ef_sk__ioexp__11n__freertos clean

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
