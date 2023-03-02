#include "BoardConfig.h"

BoardConfig g_BoardConfig;

void InitBoardConfig(TopLevelSettings* topLevelSettings)
{
    // Initialize variable to known state
    memset(&g_BoardConfig, 0, sizeof(g_BoardConfig));
    
    switch (topLevelSettings->boardVariant)
    {
    case 3:
        memcpy(&g_BoardConfig, &g_NQ3BoardConfig, sizeof(BoardConfig));
        break;
    case 2:
        memcpy(&g_BoardConfig, &g_NQ2BoardConfig, sizeof(BoardConfig));
        break;
    case 1: // Everything else is an NQ1
    default:
        memcpy(&g_BoardConfig, &g_NQ1BoardConfig, sizeof(BoardConfig));
        break;
    }
    
    // Set board version information from settings memory
    g_BoardConfig.BoardVariant = topLevelSettings->boardVariant;
    memcpy(&g_BoardConfig.boardFirmwareRev, &topLevelSettings->boardFirmwareRev, 16);
    memcpy(&g_BoardConfig.boardHardwareRev, &topLevelSettings->boardHardwareRev, 16);
    g_BoardConfig.boardSerialNumber = ((uint64_t)DEVSN1 << 32) | DEVSN0;
}
