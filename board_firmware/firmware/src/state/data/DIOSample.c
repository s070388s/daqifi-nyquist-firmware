#include "DIOSample.h"

#if USE_HEAPLIST == 1
void DIOSampleList_Initialize(DIOSampleList* list, size_t maxSize, bool dropOnOverflow, const LockProvider* lockPrototype)
{
    HeapList_Initialize(&list->List, maxSize, dropOnOverflow, lockPrototype);
}

void DIOSampleList_Destroy(DIOSampleList* list)
{
    HeapList_Destroy(&list->List);
}

bool DIOSampleList_PushBack(DIOSampleList* list, const DIOSample* data)
{
    return HeapList_PushBack(&list->List, (const uint8_t*)data, sizeof(DIOSample));
}

bool DIOSampleList_PopFront(DIOSampleList* list, DIOSample* data)
{
    return HeapList_PopFront(&list->List, (uint8_t*)data, sizeof(DIOSample));
}

size_t DIOSampleList_Size(DIOSampleList* list)
{
    return HeapList_Size(&list->List);
}

bool DIOSampleList_IsEmpty(DIOSampleList* list)
{
    return HeapList_IsEmpty(&list->List);
}

#else
#include "FreeRTOS.h"
#include "queue.h"

//! Ticks to wait for QUEUE OPERATIONS
#define DIOSAMPLE_QUEUE_TICKS_TO_WAIT               1000

//! Queue handler for DIO values
static QueueHandle_t DIOQueue;
//! Size of the queue, in number of items
static uint32_t queueSize = 0;

void DIOSampleList_Initialize( \
                            DIOSampleList* list, \
                            size_t maxSize, \
                            bool dropOnOverflow, \
                            const LockProvider* lockPrototype){
    
    (void)list;
    (void)maxSize;
    (void)dropOnOverflow;
    (void)lockPrototype;
    
    queueSize = maxSize;
    DIOQueue = xQueueCreate( maxSize, sizeof(DIOSample) );
}

void DIOSampleList_Destroy(DIOSampleList* list)
{
    (void)list;
    
    vQueueDelete( DIOQueue );
}

bool DIOSampleList_PushBack(DIOSampleList* list, const DIOSample* data){
    BaseType_t queueResult;
    
    if( data == NULL ){
        return false;
    }
    
    (void)list;
    
    queueResult = xQueueSend( \
                    DIOQueue, \
                    data, \
                    DIOSAMPLE_QUEUE_TICKS_TO_WAIT );
    return ( queueResult == pdTRUE ) ? true : false; 
}

bool DIOSampleList_PopFront(DIOSampleList* list, DIOSample* data)
{
    BaseType_t queueResult;
    
    (void) list;
    
    if( data == NULL ){
        return false;
    }
    
    queueResult = xQueueReceive( \
                    DIOQueue, \
                    data, \
                    DIOSAMPLE_QUEUE_TICKS_TO_WAIT );
    return ( queueResult == pdTRUE ) ? true : false; 
}

bool DIOSampleList_PeekFront(DIOSampleList* list, DIOSample* data)
{
    BaseType_t queueResult;
    
    (void)list;
    
    if( data == NULL ){
        return false;
    }
    
    queueResult = xQueuePeek( \
                    DIOQueue, \
                    data, \
                    DIOSAMPLE_QUEUE_TICKS_TO_WAIT );
    return ( queueResult == pdTRUE ) ? true : false; 
}

size_t DIOSampleList_Size(DIOSampleList* list)
{
    (void)list;
    
    if( queueSize == 0 ){
        return 0;
    }
    return (queueSize - uxQueueSpacesAvailable( DIOQueue ) );
}

bool DIOSampleList_IsEmpty(DIOSampleList* list)
{
    (void)list;
    
    if( DIOSampleList_Size(NULL) == queueSize ){
        return true;
    }
    return false;
}
#endif /* USE_HEAP_LIST */