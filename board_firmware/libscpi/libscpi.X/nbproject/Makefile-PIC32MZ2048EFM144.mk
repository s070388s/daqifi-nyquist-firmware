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
ifeq "$(wildcard nbproject/Makefile-local-PIC32MZ2048EFM144.mk)" "nbproject/Makefile-local-PIC32MZ2048EFM144.mk"
include nbproject/Makefile-local-PIC32MZ2048EFM144.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC32MZ2048EFM144
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../libscpi/src/error.c ../libscpi/src/expression.c ../libscpi/src/fifo.c ../libscpi/src/ieee488.c ../libscpi/src/lexer.c ../libscpi/src/minimal.c ../libscpi/src/parser.c ../libscpi/src/units.c ../libscpi/src/utils.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2080528684/error.o ${OBJECTDIR}/_ext/2080528684/expression.o ${OBJECTDIR}/_ext/2080528684/fifo.o ${OBJECTDIR}/_ext/2080528684/ieee488.o ${OBJECTDIR}/_ext/2080528684/lexer.o ${OBJECTDIR}/_ext/2080528684/minimal.o ${OBJECTDIR}/_ext/2080528684/parser.o ${OBJECTDIR}/_ext/2080528684/units.o ${OBJECTDIR}/_ext/2080528684/utils.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2080528684/error.o.d ${OBJECTDIR}/_ext/2080528684/expression.o.d ${OBJECTDIR}/_ext/2080528684/fifo.o.d ${OBJECTDIR}/_ext/2080528684/ieee488.o.d ${OBJECTDIR}/_ext/2080528684/lexer.o.d ${OBJECTDIR}/_ext/2080528684/minimal.o.d ${OBJECTDIR}/_ext/2080528684/parser.o.d ${OBJECTDIR}/_ext/2080528684/units.o.d ${OBJECTDIR}/_ext/2080528684/utils.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2080528684/error.o ${OBJECTDIR}/_ext/2080528684/expression.o ${OBJECTDIR}/_ext/2080528684/fifo.o ${OBJECTDIR}/_ext/2080528684/ieee488.o ${OBJECTDIR}/_ext/2080528684/lexer.o ${OBJECTDIR}/_ext/2080528684/minimal.o ${OBJECTDIR}/_ext/2080528684/parser.o ${OBJECTDIR}/_ext/2080528684/units.o ${OBJECTDIR}/_ext/2080528684/utils.o

# Source Files
SOURCEFILES=../libscpi/src/error.c ../libscpi/src/expression.c ../libscpi/src/fifo.c ../libscpi/src/ieee488.c ../libscpi/src/lexer.c ../libscpi/src/minimal.c ../libscpi/src/parser.c ../libscpi/src/units.c ../libscpi/src/utils.c



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
	${MAKE}  -f nbproject/Makefile-PIC32MZ2048EFM144.mk ${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM144
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2080528684/error.o: ../libscpi/src/error.c  .generated_files/flags/PIC32MZ2048EFM144/e30aa3bab1e9b7cfb13429c974f4926fa644c6e0 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/error.o.d" -o ${OBJECTDIR}/_ext/2080528684/error.o ../libscpi/src/error.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/expression.o: ../libscpi/src/expression.c  .generated_files/flags/PIC32MZ2048EFM144/64d9854eed1d94237e5c1fb74ef2374d483d00b6 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/expression.o.d" -o ${OBJECTDIR}/_ext/2080528684/expression.o ../libscpi/src/expression.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/fifo.o: ../libscpi/src/fifo.c  .generated_files/flags/PIC32MZ2048EFM144/379a97271abc7e71098b3aad2202e68eb51d823b .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/fifo.o.d" -o ${OBJECTDIR}/_ext/2080528684/fifo.o ../libscpi/src/fifo.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/ieee488.o: ../libscpi/src/ieee488.c  .generated_files/flags/PIC32MZ2048EFM144/2c98b7f48828535bbb92d8600a175dd7eddb346e .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/ieee488.o.d" -o ${OBJECTDIR}/_ext/2080528684/ieee488.o ../libscpi/src/ieee488.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/lexer.o: ../libscpi/src/lexer.c  .generated_files/flags/PIC32MZ2048EFM144/17682b0527e35a87dcc3462bd3f4922cfef85161 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/lexer.o.d" -o ${OBJECTDIR}/_ext/2080528684/lexer.o ../libscpi/src/lexer.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/minimal.o: ../libscpi/src/minimal.c  .generated_files/flags/PIC32MZ2048EFM144/f74e80069036148fc0c9fe4bc9d15a16a5293b1d .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/minimal.o.d" -o ${OBJECTDIR}/_ext/2080528684/minimal.o ../libscpi/src/minimal.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/parser.o: ../libscpi/src/parser.c  .generated_files/flags/PIC32MZ2048EFM144/4405762e2686d5c5913311636926cb934e0c1de7 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/parser.o.d" -o ${OBJECTDIR}/_ext/2080528684/parser.o ../libscpi/src/parser.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/units.o: ../libscpi/src/units.c  .generated_files/flags/PIC32MZ2048EFM144/29c50a5d876b9a724ac5956b5645b4059c86dab1 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/units.o.d" -o ${OBJECTDIR}/_ext/2080528684/units.o ../libscpi/src/units.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/utils.o: ../libscpi/src/utils.c  .generated_files/flags/PIC32MZ2048EFM144/cbcbb626e5c63026daed3f7231caadae780c87da .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/utils.o.d" -o ${OBJECTDIR}/_ext/2080528684/utils.o ../libscpi/src/utils.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/2080528684/error.o: ../libscpi/src/error.c  .generated_files/flags/PIC32MZ2048EFM144/b75c2df2ea1d676897fd7663c45eea090a0dd1bc .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/error.o.d" -o ${OBJECTDIR}/_ext/2080528684/error.o ../libscpi/src/error.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/expression.o: ../libscpi/src/expression.c  .generated_files/flags/PIC32MZ2048EFM144/df6ea186e440da8bd828273a9e73eb68427ea389 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/expression.o.d" -o ${OBJECTDIR}/_ext/2080528684/expression.o ../libscpi/src/expression.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/fifo.o: ../libscpi/src/fifo.c  .generated_files/flags/PIC32MZ2048EFM144/a9f06be99eec6a10f73e7167ff22ee3f83ba0d89 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/fifo.o.d" -o ${OBJECTDIR}/_ext/2080528684/fifo.o ../libscpi/src/fifo.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/ieee488.o: ../libscpi/src/ieee488.c  .generated_files/flags/PIC32MZ2048EFM144/d671afc0e1a8228db96504295ff5912a5decd375 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/ieee488.o.d" -o ${OBJECTDIR}/_ext/2080528684/ieee488.o ../libscpi/src/ieee488.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/lexer.o: ../libscpi/src/lexer.c  .generated_files/flags/PIC32MZ2048EFM144/9ca2d379c386264b8cd787ba99009d5eaf94d8a2 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/lexer.o.d" -o ${OBJECTDIR}/_ext/2080528684/lexer.o ../libscpi/src/lexer.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/minimal.o: ../libscpi/src/minimal.c  .generated_files/flags/PIC32MZ2048EFM144/dadd592e1121e6fc35a0b1440c9ee28642e3b001 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/minimal.o.d" -o ${OBJECTDIR}/_ext/2080528684/minimal.o ../libscpi/src/minimal.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/parser.o: ../libscpi/src/parser.c  .generated_files/flags/PIC32MZ2048EFM144/dbd97dc459276dc3523e8187187a00a59be28bb5 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/parser.o.d" -o ${OBJECTDIR}/_ext/2080528684/parser.o ../libscpi/src/parser.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/units.o: ../libscpi/src/units.c  .generated_files/flags/PIC32MZ2048EFM144/7e42d074a9ad6b42079bb7ea0c11ca7ae3300ccb .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/units.o.d" -o ${OBJECTDIR}/_ext/2080528684/units.o ../libscpi/src/units.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2080528684/utils.o: ../libscpi/src/utils.c  .generated_files/flags/PIC32MZ2048EFM144/8179ae9142ff7a477d4e6470c3dd0335f69d9dd5 .generated_files/flags/PIC32MZ2048EFM144/98fdd68849e8a18ffcbcc43989dec45413e7b5e2
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/utils.o.d" -o ${OBJECTDIR}/_ext/2080528684/utils.o ../libscpi/src/utils.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: archive
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_AR} $(MP_EXTRA_AR_PRE)  r ${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
else
${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_AR} $(MP_EXTRA_AR_PRE)  r ${DISTDIR}/libscpi.X.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

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
