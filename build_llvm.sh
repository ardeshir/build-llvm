#!/usr/bin/bash -e 



git clone https://github.com/llvm/llvm-project.git

cd llvm-project

git checkout -b llvm-17 llvmorg-17.0.1

export CMAKE_GENERATOR=Ninja
export CMAKE_BUILD_TYPE=Release

sudo apt -y install llvm-dev 

sudo apt -y install gcc g++ git cmake ninja-build zlib1g-dev

mkdir ./build

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS=clang -B build -S llvm

cmake --build build

sudo cmake --install build
