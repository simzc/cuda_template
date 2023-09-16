
#include "cuda.h"
#include <iostream>
#include "vector_types.h"
#include "MethodDerived.h"
#include "device_launch_parameters.h"

template<typename Base, typename Derived>
__global__ void Test() {
    uint tid = blockDim.x * blockIdx.x + threadIdx.x;

    if(tid >= 1) {
        return;
    }
    
    Base* method = new Derived();
    method->Print();

    delete method;
}

// template<typename MethodBase>
// __global__ void Test(MethodBase* method) {
//     uint tid = blockDim.x * blockIdx.x + threadIdx.x;

//     if(tid >= 10) {
//         return;
//     }
//     method->Print();
// }

int main(int argc, const char** argv) {

    // MethodBase *test = new MethodDerived();
    // MethodBase* test;
    // cudaMalloc((void **)&test, sizeof(MethodBase));

    dim3 gridSize(128, 1);
    dim3 blockSize(128, 1);
    Test<MethodBase, MethodDerived><<<gridSize, blockSize>>>();
    cudaDeviceSynchronize();

    return 0;
}