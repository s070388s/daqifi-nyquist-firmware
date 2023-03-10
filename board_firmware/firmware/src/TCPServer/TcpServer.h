/* 
 * File:   IpSockets.h
 * Author: Daniel
 *
 * Created on June 23, 2016, 5:21 PM
 */
#pragma once

#include "state/runtime/TcpServerConfig.h"

#ifdef	__cplusplus
extern "C" {
#endif
    /**
     * Initialization of the TCP server
     */
    void TcpServer_Initialize();
    
    /**
     * State machine entry point for the TCP server
     */
    void TcpServer_ProcessState();

#ifdef	__cplusplus
}
#endif


