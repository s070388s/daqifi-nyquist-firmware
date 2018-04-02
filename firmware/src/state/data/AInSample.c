#include "AInSample.h"

void AInSampleList_Initialize(AInSampleList* list, size_t maxSize, bool dropOnOverflow, const LockProvider* lockPrototype)
{
    HeapList_Initialize(&list->List, maxSize, dropOnOverflow, lockPrototype);
}

void AInSampleList_Destroy(AInSampleList* list)
{
    HeapList_Destroy(&list->List);
}

bool AInSampleList_PushBack(AInSampleList* list, const AInSample* data)
{
    return HeapList_PushBack(&list->List, (const uint8_t*)data, sizeof(AInSample));
}

bool AInSampleList_PopFront(AInSampleList* list, AInSample* data)
{
    return HeapList_PopFront(&list->List, (uint8_t*)data, sizeof(AInSample));
}

bool AInSampleList_PeekFront(AInSampleList* list, AInSample* data)
{
    return HeapList_PeekFront(&list->List, (uint8_t*)data, sizeof(AInSample));
}

size_t AInSampleList_Size(AInSampleList* list)
{
    return HeapList_Size(&list->List);
}

bool AInSampleList_IsEmpty(AInSampleList* list)
{
    return HeapList_IsEmpty(&list->List);
}
