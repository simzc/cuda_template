#ifndef MethodDerived_H
#define MethodDerived_H

#include "MethodBase.h"

class MethodDerived : public MethodBase {
    public:
        __host__ __device__ MethodDerived() {};
        __host__ __device__ ~MethodDerived() { printf("MethodDerived Destructed.\n"); }

        __device__ virtual void Print() override;
};


#endif // end ifndef !MethodDerived_H