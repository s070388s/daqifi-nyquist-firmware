#include "WifiApi.h"

#include <stdbool.h>
#include <string.h>
#include "wdrv_mrf24wn_api.h"
#include "Util/StringFormatters.h"
#include "state/data/BoardData.h"
#include "Util/Logger.h"

WF_CONFIG g_wifi_cfg;
WF_DEVICE_INFO g_wifi_deviceInfo;
WF_REDIRECTION_CONFIG g_redirectionConfig;

/**
 * A persistent cache for network settings
 */
TCPIP_NETWORK_CONFIG networkConfigCache;

/**
 * Initializes 'buffer' with a string of the specified length
 * @param buffer The pointer to the string to initialize
 * @param bufferLen The length of the required buffer
 * @return True on success, false otherwise
 */
static bool InitBuffer(char** buffer, uint8_t bufferLen)
{
    if (*buffer == NULL)
    {
        *buffer = malloc(bufferLen);
    }
    
    if (*buffer == NULL)
    {
        return false;
    }
    
    memset(*buffer, 0, bufferLen);
    return true;
}

bool WifiApplyNetworkSettings(WifiSettings* settings)
{
    // WifiConnectionDown();
    if (g_BoardData.PowerData.powerState < POWERED_UP)
    {
        LogMessage("Board must be powered-on for WiFi operations\n\r");
        return false;
    }
    
    TCPIP_NET_HANDLE handle = TCPIP_STACK_IndexToNet(0);
    if (handle == NULL)
    {
        return false;
    }
    
    TCPIP_STACK_INIT stackParams;
    if (!TCPIP_STACK_InitializeDataGet(sysObj.tcpip, &stackParams) || stackParams.nNets < 1)
    {
        return false;
    }
    
    // Load the existing wifi settings
    IWPRIV_GET_PARAM s_httpapp_get_param;
    s_httpapp_get_param.cfg.config = &g_wifi_cfg;
    iwpriv_get(CONFIG_GET, &s_httpapp_get_param);
    
    // Copy the new settings
    g_wifi_cfg.ssidLen = strlen(settings->ssid);
    strncpy((char *)g_wifi_cfg.ssid, (char *)settings->ssid, g_wifi_cfg.ssidLen);
    g_wifi_cfg.ssid[g_wifi_cfg.ssidLen] = '\0';
    
    g_wifi_cfg.securityMode = settings->securityMode;
    g_wifi_cfg.securityKeyLen = WifiCopyKey(g_wifi_cfg.securityKey, g_wifi_cfg.securityMode, settings->passKey);
    g_wifi_cfg.networkType = settings->networkType;
    
    // Set the new Wifi settings
    IWPRIV_SET_PARAM s_httpapp_set_param;
    s_httpapp_set_param.cfg.config = &g_wifi_cfg;
    iwpriv_set(CONFIG_SET, &s_httpapp_set_param);
    
    networkConfigCache.pMacObject = &TCPIP_NETWORK_DEFAULT_MAC_DRIVER_IDX0;
    networkConfigCache.interface = TCPIP_NETWORK_DEFAULT_INTERFACE_NAME_IDX0;
    
    if (InitBuffer(&networkConfigCache.hostName, TCPIP_DNS_CLIENT_MAX_HOSTNAME_LEN))
    {
        strncpy(networkConfigCache.hostName, settings->hostName, TCPIP_DNS_CLIENT_MAX_HOSTNAME_LEN);
    }

    if (InitBuffer(&networkConfigCache.macAddr, MAX_MAC_ADDR_LEN))
    {
        MacAddr_ToString(&settings->macAddr, networkConfigCache.macAddr, MAX_MAC_ADDR_LEN);
    }
    
    InitBuffer(&networkConfigCache.ipAddr, MAX_TCPIPV4_LEN);
    InitBuffer(&networkConfigCache.ipMask, MAX_TCPIPV6_LEN);
    InitBuffer(&networkConfigCache.gateway, MAX_TCPIPV6_LEN);
    
    InitBuffer(&networkConfigCache.ipv6Addr, MAX_TCPIPV6_LEN);
    InitBuffer(&networkConfigCache.ipv6Gateway, MAX_TCPIPV6_LEN);
    InitBuffer(&networkConfigCache.priDNS, MAX_TCPIPV6_LEN);
    InitBuffer(&networkConfigCache.secondDNS, MAX_TCPIPV6_LEN);
    if (settings->configFlags | TCPIP_NETWORK_CONFIG_IPV6_ADDRESS)
    {
        // IPv6
        if (networkConfigCache.ipv6Addr != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->ipAddr, 
                    networkConfigCache.ipv6Addr,
                    MAX_TCPIPV6_LEN);
        }
        
        if (networkConfigCache.ipv6Gateway != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->gateway, 
                    networkConfigCache.ipv6Gateway,
                    MAX_TCPIPV6_LEN);
        }
        
        if (networkConfigCache.priDNS != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->priDns, 
                    networkConfigCache.priDNS,
                    MAX_TCPIPV6_LEN);
        }
        
        if (networkConfigCache.secondDNS != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->secDns, 
                    networkConfigCache.secondDNS,
                    MAX_TCPIPV6_LEN);
        }
    }
    else
    {
        // Ipv4
        if (networkConfigCache.ipAddr != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->ipAddr, 
                    networkConfigCache.ipAddr,
                    MAX_TCPIPV4_LEN);
        }
        
        if (networkConfigCache.ipMask != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->ipMask, 
                    networkConfigCache.ipMask,
                    MAX_TCPIPV4_LEN);
        }
        
        if (networkConfigCache.gateway != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->gateway, 
                    networkConfigCache.gateway,
                    MAX_TCPIPV4_LEN);
        }
        
        if (networkConfigCache.priDNS != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->priDns, 
                    networkConfigCache.priDNS,
                    MAX_TCPIPV4_LEN);
        }
        
        if (networkConfigCache.secondDNS != NULL)
        {
            IpAddr_ToString(settings->configFlags & TCPIP_NETWORK_CONFIG_IPV6_ADDRESS,
                    &settings->secDns, 
                    networkConfigCache.secondDNS,
                    MAX_TCPIPV4_LEN);
        }
    }

    if (InitBuffer(&networkConfigCache.powerMode, 6))
    {
        if (settings->isEnabled)
        {
            strncpy(networkConfigCache.powerMode, TCPIP_STACK_IF_POWER_FULL, 5);
        }
    }

    networkConfigCache.startFlags = settings->configFlags;

    return WifiResetConnection(settings);
}

uint8_t WifiCopyKey(uint8_t* buffer, uint8_t securityMode, const uint8_t* source)
{  
    uint8_t keySize =0;
    switch (securityMode) {
        case WDRV_SECURITY_WEP_40:
            keySize = 5;
            break;
        case WDRV_SECURITY_WEP_104:
            keySize = 13;
            break;
        case WDRV_SECURITY_WPA_WITH_PASS_PHRASE:
        case WDRV_SECURITY_WPA2_WITH_PASS_PHRASE:
        case WDRV_SECURITY_WPS_PIN:
            keySize = strlen((const char*)source); // ascii so use strlen
            break;
        case WDRV_SECURITY_OPEN:
        case WDRV_SECURITY_WPS_PUSH_BUTTON:
        default:
            keySize = 0;
            break;
    }
    
    if (keySize > 0)
    {
        memcpy(buffer, source, keySize);
    }
    buffer[keySize] = '\0';

    return keySize;
}

bool WifiResetConnection(WifiSettings* settings)
{
    if (g_BoardData.PowerData.powerState < POWERED_UP)
    {
        LogMessage("Board must be powered-on for WiFi operations\n\r");
        return false;
    }
    
    bool result = WifiConnectionDown();
    
    if (settings->isEnabled)
    {
        result = WifiConnectionUp();
    }
    
    return result;
}

bool WifiConnectionUp()
{
    if (g_BoardData.PowerData.powerState < POWERED_UP)
    {
        LogMessage("Board must be powered-on for WiFi operations\n\r");
        return false;
    }
    
    TCPIP_NET_HANDLE handle = TCPIP_STACK_IndexToNet(0);
    if (handle == NULL)
    {
        return false;
    }

    if (!TCPIP_STACK_NetIsUp(handle))
    {
        TCPIP_STACK_NetUp(handle, &networkConfigCache);
    }
  
    return true;
}

bool WifiConnectionDown()
{
    if (g_BoardData.PowerData.powerState < POWERED_UP)
    {
        LogMessage("Board must be powered-on for WiFi operations\n\r");
        return false;
    }
    
    TCPIP_NET_HANDLE handle = TCPIP_STACK_IndexToNet(0);
    if (handle == NULL)
    {
        return false;
    }
    
    if (TCPIP_STACK_NetIsUp(handle))
    {
        TCPIP_STACK_NetDown(handle);
    }
    
    return true;
}