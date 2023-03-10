/*******************************************************************************
  DAQiFi TCPIP Announce Return
    
  Description:
    - Provides device info protobuf string

*******************************************************************************/


#ifndef	DAQIFI_TCPIP_ANNOUNCE_H
#define DAQIFI_TCPIP_ANNOUNCE_H

#include "system_definitions.h"
#include "tcpip/src/tcpip_private.h"

//  Custom announce function to format response in protobuf format
size_t DAQiFi_TCPIP_ANNOUNCE_Create(uint8_t *buffer, size_t bufferLen);

//  Function which is called anytime there is a change of information in MAC address
void DAQiFi_TCPIP_ANNOUNCE_Update (TCPIP_NET_IF* pNetIf);

#endif //DAQIFI_TCPIP_ANNOUNCE_H
