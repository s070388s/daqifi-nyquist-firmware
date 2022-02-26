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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../pb_common.c ../pb_decode.c ../pb_encode.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/pb_common.o ${OBJECTDIR}/_ext/1472/pb_decode.o ${OBJECTDIR}/_ext/1472/pb_encode.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/pb_common.o.d ${OBJECTDIR}/_ext/1472/pb_decode.o.d ${OBJECTDIR}/_ext/1472/pb_encode.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/pb_common.o ${OBJECTDIR}/_ext/1472/pb_decode.o ${OBJECTDIR}/_ext/1472/pb_encode.o

# Source Files
SOURCEFILES=../pb_common.c ../pb_decode.c ../pb_encode.c



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
	${MAKE}  -f nbproject/Makefile-PIC32MZ2048EFM144.mk dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/1472/pb_common.o: ../pb_common.c  .generated_files/flags/PIC32MZ2048EFM144/37ef34bf95eca03f1e248320a1b0b9a88ff9a86 .generated_files/flags/PIC32MZ2048EFM144/707457b5383574c8bb88f3ba8030f39eb185905a
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MP -MMD -MF "${OBJECTDIR}/_ext/1472/pb_common.o.d" -o ${OBJECTDIR}/_ext/1472/pb_common.o ../pb_common.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1472/pb_decode.o: ../pb_decode.c  .generated_files/flags/PIC32MZ2048EFM144/b2825f6084e4995a2740b10a462cfef3a2070045 .generated_files/flags/PIC32MZ2048EFM144/707457b5383574c8bb88f3ba8030f39eb185905a
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_decode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_decode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MP -MMD -MF "${OBJECTDIR}/_ext/1472/pb_decode.o.d" -o ${OBJECTDIR}/_ext/1472/pb_decode.o ../pb_decode.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1472/pb_encode.o: ../pb_encode.c  .generated_files/flags/PIC32MZ2048EFM144/8c73fe5e5962eec5685e8820062dec3d0cde1367 .generated_files/flags/PIC32MZ2048EFM144/707457b5383574c8bb88f3ba8030f39eb185905a
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_encode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_encode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MP -MMD -MF "${OBJECTDIR}/_ext/1472/pb_encode.o.d" -o ${OBJECTDIR}/_ext/1472/pb_encode.o ../pb_encode.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/1472/pb_common.o: ../pb_common.c  .generated_files/flags/PIC32MZ2048EFM144/887a551764965ac7fae1257eb82ed81e81631715 .generated_files/flags/PIC32MZ2048EFM144/707457b5383574c8bb88f3ba8030f39eb185905a
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MP -MMD -MF "${OBJECTDIR}/_ext/1472/pb_common.o.d" -o ${OBJECTDIR}/_ext/1472/pb_common.o ../pb_common.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1472/pb_decode.o: ../pb_decode.c  .generated_files/flags/PIC32MZ2048EFM144/ff531d03cb6feae057663611568e824d36d0e6b4 .generated_files/flags/PIC32MZ2048EFM144/707457b5383574c8bb88f3ba8030f39eb185905a
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_decode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_decode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MP -MMD -MF "${OBJECTDIR}/_ext/1472/pb_decode.o.d" -o ${OBJECTDIR}/_ext/1472/pb_decode.o ../pb_decode.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1472/pb_encode.o: ../pb_encode.c  .generated_files/flags/PIC32MZ2048EFM144/459c7cdc5ba0a3948fbacce1017bf84634e1ac1e .generated_files/flags/PIC32MZ2048EFM144/707457b5383574c8bb88f3ba8030f39eb185905a
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_encode.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/pb_encode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -MP -MMD -MF "${OBJECTDIR}/_ext/1472/pb_encode.o.d" -o ${OBJECTDIR}/_ext/1472/pb_encode.o ../pb_encode.c    -DXPRJ_PIC32MZ2048EFM144=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: archive
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE)  r dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
else
dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE)  r dist/${CND_CONF}/${IMAGE_TYPE}/nanopb.X.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC32MZ2048EFM144
	${RM} -r dist/PIC32MZ2048EFM144

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
