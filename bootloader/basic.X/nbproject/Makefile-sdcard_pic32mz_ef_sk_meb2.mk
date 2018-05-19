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
ifeq "$(wildcard nbproject/Makefile-local-sdcard_pic32mz_ef_sk_meb2.mk)" "nbproject/Makefile-local-sdcard_pic32mz_ef_sk_meb2.mk"
include nbproject/Makefile-local-sdcard_pic32mz_ef_sk_meb2.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sdcard_pic32mz_ef_sk_meb2
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp/bsp.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/clk/src/sys_clk_pic32mz.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_pic32mz.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/ports/src/sys_ports_static.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/reset/src/sys_reset.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_init.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_interrupt.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_exceptions.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_tasks.c ../src/main.c ../src/app.c ../../../../../framework/bootloader/src/datastream/datastream_sdcard.c ../../../../../framework/bootloader/src/bootloader.c ../../../../../framework/bootloader/src/nvm.c ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c ../../../../../framework/driver/spi/src/dynamic/drv_spi.c ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../framework/system/fs/src/dynamic/sys_fs.c ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../framework/system/tmr/src/sys_tmr.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1436307855/bsp.o ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o ${OBJECTDIR}/_ext/354547916/drv_spi_api.o ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o ${OBJECTDIR}/_ext/736125341/sys_devcon.o ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/973355514/sys_ports_static.o ${OBJECTDIR}/_ext/82541373/sys_reset.o ${OBJECTDIR}/_ext/2090968255/system_init.o ${OBJECTDIR}/_ext/2090968255/system_interrupt.o ${OBJECTDIR}/_ext/2090968255/system_exceptions.o ${OBJECTDIR}/_ext/2090968255/system_tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o ${OBJECTDIR}/_ext/686445382/bootloader.o ${OBJECTDIR}/_ext/686445382/nvm.o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ${OBJECTDIR}/_ext/1964723635/ff.o ${OBJECTDIR}/_ext/732200470/diskio.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1436307855/bsp.o.d ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d ${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d ${OBJECTDIR}/_ext/736125341/sys_devcon.o.d ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d ${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d ${OBJECTDIR}/_ext/82541373/sys_reset.o.d ${OBJECTDIR}/_ext/2090968255/system_init.o.d ${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d ${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d ${OBJECTDIR}/_ext/2090968255/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d ${OBJECTDIR}/_ext/686445382/bootloader.o.d ${OBJECTDIR}/_ext/686445382/nvm.o.d ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d ${OBJECTDIR}/_ext/1324760662/drv_spi.o.d ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d ${OBJECTDIR}/_ext/1750042194/sys_fs.o.d ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d ${OBJECTDIR}/_ext/1964723635/ff.o.d ${OBJECTDIR}/_ext/732200470/diskio.o.d ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1436307855/bsp.o ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o ${OBJECTDIR}/_ext/354547916/drv_spi_api.o ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o ${OBJECTDIR}/_ext/736125341/sys_devcon.o ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/973355514/sys_ports_static.o ${OBJECTDIR}/_ext/82541373/sys_reset.o ${OBJECTDIR}/_ext/2090968255/system_init.o ${OBJECTDIR}/_ext/2090968255/system_interrupt.o ${OBJECTDIR}/_ext/2090968255/system_exceptions.o ${OBJECTDIR}/_ext/2090968255/system_tasks.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o ${OBJECTDIR}/_ext/686445382/bootloader.o ${OBJECTDIR}/_ext/686445382/nvm.o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ${OBJECTDIR}/_ext/1964723635/ff.o ${OBJECTDIR}/_ext/732200470/diskio.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o

# Source Files
SOURCEFILES=../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp/bsp.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/clk/src/sys_clk_pic32mz.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_pic32mz.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/ports/src/sys_ports_static.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/reset/src/sys_reset.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_init.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_interrupt.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_exceptions.c ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_tasks.c ../src/main.c ../src/app.c ../../../../../framework/bootloader/src/datastream/datastream_sdcard.c ../../../../../framework/bootloader/src/bootloader.c ../../../../../framework/bootloader/src/nvm.c ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c ../../../../../framework/driver/spi/src/dynamic/drv_spi.c ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../framework/system/fs/src/dynamic/sys_fs.c ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../framework/system/tmr/src/sys_tmr.c


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
	${MAKE}  -f nbproject/Makefile-sdcard_pic32mz_ef_sk_meb2.mk dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFH144
MP_LINKER_FILE_OPTION=,--script="..\src\system_config\sdcard_pic32mz_ef_sk_meb2\btl_mz.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/736125341" 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -DRealICEPlatformTool=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=RealICEPlatformTool=1
	
else
${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/736125341" 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/736125341/sys_devcon_cache_pic32mz.o.asm.d",--gdwarf-2
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1436307855/bsp.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1436307855" 
	@${RM} ${OBJECTDIR}/_ext/1436307855/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1436307855/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1436307855/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1436307855/bsp.o.d" -o ${OBJECTDIR}/_ext/1436307855/bsp.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp/bsp.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/354547916" 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/354547916/drv_spi_api.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/354547916" 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_api.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/354547916/drv_spi_api.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/354547916" 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/clk/src/sys_clk_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/93314346" 
	@${RM} ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d" -o ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/clk/src/sys_clk_pic32mz.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/736125341/sys_devcon.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/736125341" 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/736125341/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/736125341/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/736125341/sys_devcon.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/736125341" 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/973355514/sys_ports_static.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/973355514" 
	@${RM} ${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/973355514/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/973355514/sys_ports_static.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/ports/src/sys_ports_static.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/82541373/sys_reset.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/reset/src/sys_reset.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/82541373" 
	@${RM} ${OBJECTDIR}/_ext/82541373/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/82541373/sys_reset.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/82541373/sys_reset.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/82541373/sys_reset.o.d" -o ${OBJECTDIR}/_ext/82541373/sys_reset.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/reset/src/sys_reset.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_init.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_init.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_init.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_init.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_interrupt.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_interrupt.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_interrupt.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_exceptions.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_exceptions.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_exceptions.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_tasks.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_tasks.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_tasks.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_tasks.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/615392287/datastream_sdcard.o: ../../../../../framework/bootloader/src/datastream/datastream_sdcard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o ../../../../../framework/bootloader/src/datastream/datastream_sdcard.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/686445382/bootloader.o: ../../../../../framework/bootloader/src/bootloader.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/686445382/bootloader.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/686445382/bootloader.o.d" -o ${OBJECTDIR}/_ext/686445382/bootloader.o ../../../../../framework/bootloader/src/bootloader.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/686445382/nvm.o: ../../../../../framework/bootloader/src/nvm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/686445382/nvm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/686445382/nvm.o.d" -o ${OBJECTDIR}/_ext/686445382/nvm.o ../../../../../framework/bootloader/src/nvm.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1789358541/drv_sdcard.o: ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1789358541" 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d" -o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1324760662/drv_spi.o: ../../../../../framework/driver/spi/src/dynamic/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1324760662" 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1324760662/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1324760662/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ../../../../../framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o: ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1385053818" 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/941160041/drv_tmr.o: ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/941160041" 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1750042194/sys_fs.o: ../../../../../framework/system/fs/src/dynamic/sys_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1750042194/sys_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ../../../../../framework/system/fs/src/dynamic/sys_fs.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o: ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1964723635/ff.o: ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1964723635" 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1964723635/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1964723635/ff.o.d" -o ${OBJECTDIR}/_ext/1964723635/ff.o ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/732200470/diskio.o: ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/732200470" 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/732200470/diskio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/732200470/diskio.o.d" -o ${OBJECTDIR}/_ext/732200470/diskio.o ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -DRealICEPlatformTool=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/1436307855/bsp.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1436307855" 
	@${RM} ${OBJECTDIR}/_ext/1436307855/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1436307855/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1436307855/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1436307855/bsp.o.d" -o ${OBJECTDIR}/_ext/1436307855/bsp.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp/bsp.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/354547916" 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/354547916/drv_spi_tasks.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/354547916/drv_spi_api.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/354547916" 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_api.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/354547916/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/354547916/drv_spi_api.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/354547916" 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/354547916/drv_spi_master_ebm_tasks.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/clk/src/sys_clk_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/93314346" 
	@${RM} ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o.d" -o ${OBJECTDIR}/_ext/93314346/sys_clk_pic32mz.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/clk/src/sys_clk_pic32mz.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/736125341/sys_devcon.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/736125341" 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/736125341/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/736125341/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/736125341/sys_devcon.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/736125341" 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/736125341/sys_devcon_pic32mz.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/973355514/sys_ports_static.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/973355514" 
	@${RM} ${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/973355514/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/973355514/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/973355514/sys_ports_static.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/ports/src/sys_ports_static.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/82541373/sys_reset.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/reset/src/sys_reset.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/82541373" 
	@${RM} ${OBJECTDIR}/_ext/82541373/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/82541373/sys_reset.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/82541373/sys_reset.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/82541373/sys_reset.o.d" -o ${OBJECTDIR}/_ext/82541373/sys_reset.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework/system/reset/src/sys_reset.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_init.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_init.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_init.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_init.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_interrupt.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_interrupt.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_interrupt.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_exceptions.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_exceptions.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_exceptions.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2090968255/system_tasks.o: ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2090968255" 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/2090968255/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2090968255/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2090968255/system_tasks.o.d" -o ${OBJECTDIR}/_ext/2090968255/system_tasks.o ../src/system_config/sdcard_pic32mz_ef_sk_meb2/system_tasks.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/615392287/datastream_sdcard.o: ../../../../../framework/bootloader/src/datastream/datastream_sdcard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/615392287" 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d 
	@${RM} ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/615392287/datastream_sdcard.o.d" -o ${OBJECTDIR}/_ext/615392287/datastream_sdcard.o ../../../../../framework/bootloader/src/datastream/datastream_sdcard.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/686445382/bootloader.o: ../../../../../framework/bootloader/src/bootloader.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/bootloader.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/686445382/bootloader.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/686445382/bootloader.o.d" -o ${OBJECTDIR}/_ext/686445382/bootloader.o ../../../../../framework/bootloader/src/bootloader.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/686445382/nvm.o: ../../../../../framework/bootloader/src/nvm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/686445382" 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/686445382/nvm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/686445382/nvm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/686445382/nvm.o.d" -o ${OBJECTDIR}/_ext/686445382/nvm.o ../../../../../framework/bootloader/src/nvm.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1789358541/drv_sdcard.o: ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1789358541" 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d" -o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1324760662/drv_spi.o: ../../../../../framework/driver/spi/src/dynamic/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1324760662" 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1324760662/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1324760662/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ../../../../../framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o: ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1385053818" 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/941160041/drv_tmr.o: ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/941160041" 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/941160041/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/941160041/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/941160041/drv_tmr.o ../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1750042194/sys_fs.o: ../../../../../framework/system/fs/src/dynamic/sys_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1750042194/sys_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ../../../../../framework/system/fs/src/dynamic/sys_fs.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o: ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1964723635/ff.o: ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1964723635" 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1964723635/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1964723635/ff.o.d" -o ${OBJECTDIR}/_ext/1964723635/ff.o ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/732200470/diskio.o: ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/732200470" 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/732200470/diskio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/732200470/diskio.o.d" -o ${OBJECTDIR}/_ext/732200470/diskio.o ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2" -I"../src/sdcard_pic32mz_ef_sk_meb2" -I"../../../../../framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/framework" -I"../src/system_config/sdcard_pic32mz_ef_sk_meb2/bsp" -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MZ2048EFH144_peripherals.a  ../src/system_config/sdcard_pic32mz_ef_sk_meb2/btl_mz.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -DRealICEPlatformTool=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MZ2048EFH144_peripherals.a      -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=RealICEPlatformTool=1,--defsym=_min_heap_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MZ2048EFH144_peripherals.a ../src/system_config/sdcard_pic32mz_ef_sk_meb2/btl_mz.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MZ2048EFH144_peripherals.a      -DXPRJ_sdcard_pic32mz_ef_sk_meb2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=2048,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/basic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/sdcard_pic32mz_ef_sk_meb2
	${RM} -r dist/sdcard_pic32mz_ef_sk_meb2

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
