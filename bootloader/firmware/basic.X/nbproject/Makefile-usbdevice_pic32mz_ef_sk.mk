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
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3fbb1fadb95eb98b9498386f01ae7e3f5051aa02 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/1730aede8f36a6882c53388bb2c90a95e40a3668 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/bootloader.o: ../../../../../framework/bootloader/src/bootloader.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/88eb8022d978dd329e0271e5c2ee582b0d5776f8 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/bootloader.o.d" -o ${OBJECTDIR}/_ext/686445382/bootloader.o ../../../../../framework/bootloader/src/bootloader.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/nvm.o: ../../../../../framework/bootloader/src/nvm.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/65cb4cbc504998a97c3bb41800cc6cb0f8914349 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/nvm.o.d" -o ${OBJECTDIR}/_ext/686445382/nvm.o ../../../../../framework/bootloader/src/nvm.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream.o: ../../../../../framework/bootloader/src/datastream/datastream.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/ec72cd6bc04189d8c51a341982be41a686459965 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream.o ../../../../../framework/bootloader/src/datastream/datastream.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o: ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/c8ebb07bd9cd1cfb3bc3e3a05a135f4ff4d9e4c4 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/941160041/drv_tmr.o: ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/c659bfca035c12f482cd928bf71ca1d4801684f9 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/941160041" 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk.o: ../../../../../framework/system/clk/src/sys_clk.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/fbda5c21ef44632e841ecfa194de4490903b5e9c .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk.o ../../../../../framework/system/clk/src/sys_clk.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o: ../../../../../framework/system/clk/src/sys_clk_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/f8b6bf0fb4e8b552530a05790c9cc98b479e55fc .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o ../../../../../framework/system/clk/src/sys_clk_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/63cf0bb176fbb122e1208808c5c5935d3ec3dc15 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3f0a6099995a07bd7cef26c9565c5568cabb352 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/f81f29a1963adf9dfdaf81320cde73dc0d9818b4 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device.o: ../../../../../framework/usb/src/dynamic/usb_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/bb72383df63555954d7bbd63bc0857a39c143a76 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device.o ../../../../../framework/usb/src/dynamic/usb_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/f7feef5c94927d52ea848ce5d12bf6a6ae9550c6 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device_hid.o: ../../../../../framework/usb/src/dynamic/usb_device_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/ad28cf96f52a52b00a795d793dde266a6f6ea0b1 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o ../../../../../framework/usb/src/dynamic/usb_device_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/5b3211a978117146e23a46ff3f23f78b3837af .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/b91e8e9dedcedab69c2ec50c6e558a55015655eb .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/278102762/sys_ports_static.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/493364b54beda3b1569646eba312c3db52615933 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/278102762" 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/278102762/sys_ports_static.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/612711379/sys_reset.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/e86578e7b76c51c227b0fcdeb1ad23cfa858133d .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/612711379" 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/612711379/sys_reset.o.d" -o ${OBJECTDIR}/_ext/612711379/sys_reset.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_init.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/5139f9009d7c43cc8e605b89678bd8707100d84a .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_init.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_init.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_interrupt.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/d6c1326aac67717dbe395fecaf4c56fb0f7dfe6d .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_interrupt.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_exceptions.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/860306ea3c1dfeae5145fd737a4cb08a6bc8ac0 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_exceptions.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_tasks.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/155b484d7a2c9ef5e6a785776e2a669d9bb00227 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_tasks.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/8fbc99d4819b4f725cd3931646f553d067825d3d .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/13db5b6454a641bd59cbd604df6c0b9c5e21f7ca .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/bootloader.o: ../../../../../framework/bootloader/src/bootloader.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/84ae6a58ebebd2d694ec225255fc89a62f4152bb .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/bootloader.o.d" -o ${OBJECTDIR}/_ext/686445382/bootloader.o ../../../../../framework/bootloader/src/bootloader.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/686445382/nvm.o: ../../../../../framework/bootloader/src/nvm.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/2aab179be2af47bbd14f1dcd490811ab48f39535 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/686445382/nvm.o.d" -o ${OBJECTDIR}/_ext/686445382/nvm.o ../../../../../framework/bootloader/src/nvm.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream.o: ../../../../../framework/bootloader/src/datastream/datastream.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/440ee2da2e682e1378759ccb37618ea12646e0c4 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream.o ../../../../../framework/bootloader/src/datastream/datastream.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o: ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/1a3577c4e8501f6e85ab5088ce77ad9671f183b7 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream_usb_hid.o ../../../../../framework/bootloader/src/datastream/datastream_usb_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/941160041/drv_tmr.o: ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/6e9b727349d38912209255ef23106df22b871cbb .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/941160041" 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk.o: ../../../../../framework/system/clk/src/sys_clk.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3a0c21b6c89923b22d20112d2bf664d51e27ad89 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk.o ../../../../../framework/system/clk/src/sys_clk.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o: ../../../../../framework/system/clk/src/sys_clk_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3809ce42160ad418f70702e16a203c4a413648be .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/52938249" 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o.d" -o ${OBJECTDIR}/_ext/52938249/sys_clk_pic32mz.o ../../../../../framework/system/clk/src/sys_clk_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/7e47dea3fa1d467f4cb6634287635547abc2e617 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/2fb9d46b88e1a6d7c26dbe971fb0c769b18b8f98 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/488a4a76c9baa132802e32f2387551f179ea322c .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device.o: ../../../../../framework/usb/src/dynamic/usb_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/77b71bfecb01add214138d67c3c5e24741a092c .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device.o ../../../../../framework/usb/src/dynamic/usb_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o: ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/353bf2313b3f3fd5294217285ea4832158fa455d .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179651966" 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o.d" -o ${OBJECTDIR}/_ext/179651966/drv_usbhs_device.o ../../../../../framework/driver/usb/usbhs/src/dynamic/drv_usbhs_device.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2136608937/usb_device_hid.o: ../../../../../framework/usb/src/dynamic/usb_device_hid.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/8d8f2eaadf4a76788f752d421ac5250b2622ec0f .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2136608937" 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2136608937/usb_device_hid.o.d" -o ${OBJECTDIR}/_ext/2136608937/usb_device_hid.o ../../../../../framework/usb/src/dynamic/usb_device_hid.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/b3ff29c9a28aac2a55c199806edbf86347de8fdd .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/3fb8e6710f67d3306e1887bfa98bab7ad4606af8 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/658126509" 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/658126509/sys_devcon_pic32mz.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/278102762/sys_ports_static.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/efa8137366eb922066c889ae97b49fb62ad1c634 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/278102762" 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/278102762/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/278102762/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/278102762/sys_ports_static.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/ports/src/sys_ports_static.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/612711379/sys_reset.o: ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/56c218107b23d0397af302e3a7f84fb02e46265a .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/612711379" 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/612711379/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/612711379/sys_reset.o.d" -o ${OBJECTDIR}/_ext/612711379/sys_reset.o ../src/system_config/usbdevice_pic32mz_ef_sk/framework/system/reset/src/sys_reset.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_init.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/4c6b671208f7a6458dee33f499d7b8832b308033 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_init.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_init.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_init.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_interrupt.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/19cc5fc1a0dcb316b422a8e1d8a7207ad78ebee6 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_interrupt.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_interrupt.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_exceptions.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/4ff574c38deecdd47f705e1935c5e29fe2f5384e .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_exceptions.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_exceptions.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1340256719/system_tasks.o: ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c  .generated_files/flags/usbdevice_pic32mz_ef_sk/ed6982eda42ab4d8ec8b1d14aa6a2eb21f185615 .generated_files/flags/usbdevice_pic32mz_ef_sk/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1340256719" 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1340256719/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -DFORCE_BOOTLOADER_FLAG_ADDR="0x80000000+0x80000-0x10" -DFORCE_BOOTLOADER_FLAG_VALUE="0xF4CEB007" -I"../src" -I"../src/system_config/usbdevice_pic32mz_ef_sk" -I"../src/usbdevice_pic32mz_ef_sk" -I"../../../../../framework" -I"../src/system_config/usbdevice_pic32mz_ef_sk/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1340256719/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1340256719/system_tasks.o ../src/system_config/usbdevice_pic32mz_ef_sk/system_tasks.c    -DXPRJ_usbdevice_pic32mz_ef_sk=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
