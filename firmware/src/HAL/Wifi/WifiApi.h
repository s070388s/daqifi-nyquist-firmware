/* 
 * File:   WifiApi.h
 * Author: Daniel
 *
 * Defines the publicly accessible API for the wifi portion of the application
 * 
 * Created on May 9, 2016, 2:55 PM
 */

#ifndef WIFIAPI_H
#define	WIFIAPI_H

#include "system_config.h"
#include "system_definitions.h"

#include "../NVM/DaqifiSettings.h"

#ifdef	__cplusplus
extern "C" {
#endif
    
    /**
     * Applies provided network settings (and resets the wifi connection)
     * @return True on success, false otherwise
     */
    bool WifiApplyNetworkSettings(WifiSettings* settings);

    /**
     * Reset the wifi connection
     * NOTE: This does not apply new settings- call ApplyNetworkSettings to do that
     * @return True on success, false otherwise
     */
    bool WifiResetConnection(WifiSettings* settings);

    /**
     * Copies the wifi key from the source to the buffer
     * @param buffer
     * @param securityMode
     * @param key
     * @return 
     */
    uint8_t WifiCopyKey(uint8_t* buffer, uint8_t securityMode, const uint8_t* source);
    
    /**
     * Brings the network connection up
     */
    bool WifiConnectionUp();
    
    /**
     * Brings the network connection down
     * @return 
     */
    bool WifiConnectionDown();
#ifdef	__cplusplus
}
#endif

#endif	/* WIFIAPI_H */

