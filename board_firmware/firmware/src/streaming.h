#pragma once

#include "state/board/BoardConfig.h"
#include "state/runtime/BoardRuntimeConfig.h"
#include "state/data/BoardData.h"

#ifdef	__cplusplus
extern "C" {
#endif
    /**
     * Initializes the streaming component
     */
    void Streaming_Init( void );
    
    /**
     * Starts the streaming timer
     */
    void Streaming_Start( void );
    
    /**
     * Stops the streaming timer
     */
    void Streaming_Stop( void );
    
    /**
     * Updates the streaming timer 
     */
    void Streaming_UpdateState( void );
    
    /**
     * Called to write streaming data to the underlying tasks
     * @param boardData The board data
     */
    void Streaming_Tasks( tBoardData* boardData );
    
    /**
     * Initializes and starts the timestamp timer
     */
    void TimestampTimer_Init( void );
    
#ifdef	__cplusplus
}
#endif

