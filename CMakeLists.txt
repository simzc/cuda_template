cmake_minimum_required(VERSION 3.25.0 FATAL_ERROR)

project(cuda_template LANGUAGES CXX CUDA)

# CUDA PACKAGE
find_package(CUDAToolkit REQUIRED)
# Global fix for CUDA language bug
include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})
message(STATUS "CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES is: ${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES}")
if(verbose_for_generate)
    get_directory_property( my_import_targets DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} IMPORTED_TARGETS )
    message( STATUS "my_import_targets=${my_import_targets}" )
endif()

set(TEST_HEADERS KenelLaunch.h MethodBase.h MethodDerived.h)

set(TEST_SOURCES main.cu MethodBase.cu MethodDerived.cu)

add_executable(${PROJECT_NAME} ${TEST_HEADERS} ${TEST_SOURCES})

set_target_properties(${PROJECT_NAME} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)