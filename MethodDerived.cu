#include "stdio.h"
#include "MethodDerived.h"

__device__ void MethodDerived::Print() {
    printf("This is printed from device.\n");
}