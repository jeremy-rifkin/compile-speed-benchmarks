# install
git clone https://github.com/opencv/opencv.git --depth 1
#git -C opencv checkout master
sudo apt install cmake
mkdir -p build && cd build
# diagnose problems: VERBOSE=1 with make

# gcc release
cmake ../opencv -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc-10 -DCMAKE_CXX_COMPILER=g++-10
time make -j$(nproc)
rm -rf *
# clang release
cmake ../opencv -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12
time make -j$(nproc)
rm -rf *
# gcc debug
cmake ../opencv -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=gcc-10 -DCMAKE_CXX_COMPILER=g++-10
time make -j$(nproc)
rm -rf *
# clang debug
cmake ../opencv -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=clang-12 -DCMAKE_CXX_COMPILER=clang++-12
time make -j$(nproc)
rm -rf *
