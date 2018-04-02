#include "DIOSample.h"

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
