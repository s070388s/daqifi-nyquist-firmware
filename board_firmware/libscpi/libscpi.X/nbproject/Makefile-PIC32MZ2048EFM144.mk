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
${OBJECTDIR}/_ext/2080528684/error.o: ../libscpi/src/error.c  .generated_files/flags/PIC32MZ2048EFM144/d690f07b25bb08588dd770b8bc8df1bf7082a51 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/error.o.d" -o ${OBJECTDIR}/_ext/2080528684/error.o ../libscpi/src/error.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/expression.o: ../libscpi/src/expression.c  .generated_files/flags/PIC32MZ2048EFM144/6cd276942c3cbdcfa967e6335228feaa958fa55c .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/expression.o.d" -o ${OBJECTDIR}/_ext/2080528684/expression.o ../libscpi/src/expression.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/fifo.o: ../libscpi/src/fifo.c  .generated_files/flags/PIC32MZ2048EFM144/73551a7a71319e59626668f0cbc9ac347527a15b .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/fifo.o.d" -o ${OBJECTDIR}/_ext/2080528684/fifo.o ../libscpi/src/fifo.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/ieee488.o: ../libscpi/src/ieee488.c  .generated_files/flags/PIC32MZ2048EFM144/7ab7026c6a4a5665e038d47e1bca624027300807 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/ieee488.o.d" -o ${OBJECTDIR}/_ext/2080528684/ieee488.o ../libscpi/src/ieee488.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/lexer.o: ../libscpi/src/lexer.c  .generated_files/flags/PIC32MZ2048EFM144/35e7c8c88a5db4f5b2ff94a7258b20481abf952e .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/lexer.o.d" -o ${OBJECTDIR}/_ext/2080528684/lexer.o ../libscpi/src/lexer.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/minimal.o: ../libscpi/src/minimal.c  .generated_files/flags/PIC32MZ2048EFM144/7c010cdf91b04bbaff881181bd1e10f11f159362 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/minimal.o.d" -o ${OBJECTDIR}/_ext/2080528684/minimal.o ../libscpi/src/minimal.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/parser.o: ../libscpi/src/parser.c  .generated_files/flags/PIC32MZ2048EFM144/252585a8f3a57c7df72280103741e9a40224b999 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/parser.o.d" -o ${OBJECTDIR}/_ext/2080528684/parser.o ../libscpi/src/parser.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/units.o: ../libscpi/src/units.c  .generated_files/flags/PIC32MZ2048EFM144/afd49e29f9dc7add744b1c05a59d44ac3b8896ae .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/units.o.d" -o ${OBJECTDIR}/_ext/2080528684/units.o ../libscpi/src/units.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/utils.o: ../libscpi/src/utils.c  .generated_files/flags/PIC32MZ2048EFM144/7160cf6bdc9ac2ae3b8816ed9991cc18b8a07526 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/utils.o.d" -o ${OBJECTDIR}/_ext/2080528684/utils.o ../libscpi/src/utils.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/2080528684/error.o: ../libscpi/src/error.c  .generated_files/flags/PIC32MZ2048EFM144/8ec11a3ca2e08efc05f09b683be015c1bb390019 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/error.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/error.o.d" -o ${OBJECTDIR}/_ext/2080528684/error.o ../libscpi/src/error.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/expression.o: ../libscpi/src/expression.c  .generated_files/flags/PIC32MZ2048EFM144/69bd3adb011a953cbe0aa36fd1c1c059654bef09 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/expression.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/expression.o.d" -o ${OBJECTDIR}/_ext/2080528684/expression.o ../libscpi/src/expression.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/fifo.o: ../libscpi/src/fifo.c  .generated_files/flags/PIC32MZ2048EFM144/140312461e227f0b849a77467893d7e36f1bacbd .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/fifo.o.d" -o ${OBJECTDIR}/_ext/2080528684/fifo.o ../libscpi/src/fifo.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/ieee488.o: ../libscpi/src/ieee488.c  .generated_files/flags/PIC32MZ2048EFM144/ecc9049bd083d19747f76a819812ab2b5398afa2 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/ieee488.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/ieee488.o.d" -o ${OBJECTDIR}/_ext/2080528684/ieee488.o ../libscpi/src/ieee488.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/lexer.o: ../libscpi/src/lexer.c  .generated_files/flags/PIC32MZ2048EFM144/785dbfcbe634c8bd4d34e4f2059a5b9c6b92e773 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/lexer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/lexer.o.d" -o ${OBJECTDIR}/_ext/2080528684/lexer.o ../libscpi/src/lexer.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/minimal.o: ../libscpi/src/minimal.c  .generated_files/flags/PIC32MZ2048EFM144/ea81fe3f2aa03d9bd77387ab02c73635ea8435b9 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/minimal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/minimal.o.d" -o ${OBJECTDIR}/_ext/2080528684/minimal.o ../libscpi/src/minimal.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/parser.o: ../libscpi/src/parser.c  .generated_files/flags/PIC32MZ2048EFM144/3f7aa8ab584cbb7166da16c7b9da250fea897906 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/parser.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/parser.o.d" -o ${OBJECTDIR}/_ext/2080528684/parser.o ../libscpi/src/parser.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/units.o: ../libscpi/src/units.c  .generated_files/flags/PIC32MZ2048EFM144/87078d25def8ed59deb867b05af3b12ba5e66967 .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/units.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/units.o.d" -o ${OBJECTDIR}/_ext/2080528684/units.o ../libscpi/src/units.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2080528684/utils.o: ../libscpi/src/utils.c  .generated_files/flags/PIC32MZ2048EFM144/f5c37bccfff0a719e74cd80fc1dd08b9564bf80e .generated_files/flags/PIC32MZ2048EFM144/6a3a8b14b0030ef685ef523278bac81734aa6a18
	@${MKDIR} "${OBJECTDIR}/_ext/2080528684" 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/2080528684/utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../libscpi/inc" -MP -MMD -MF "${OBJECTDIR}/_ext/2080528684/utils.o.d" -o ${OBJECTDIR}/_ext/2080528684/utils.o ../libscpi/src/utils.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
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
