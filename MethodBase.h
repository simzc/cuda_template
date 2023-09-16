#ifndef MathodBase_H
#define MathodBase_H

#include "stdio.h"

class MethodBase {
    public:
        __host__ __device__ MethodBase() {};
        __host__ __device__ virtual ~MethodBase() { printf("MethodBase Destructed.\n"); }

        __device__ virtual void Print() = 0;
};
    
#endif // end ifndef !MathodBase_H