wget https://mirrors.concertpass.com/gcc/releases/gcc-11.1.0/gcc-11.1.0.tar.xz
tar -xf gcc-11.1.0.tar.xz
rm gcc-11.1.0.tar.xz
cd gcc-11.1.0

contrib/download_prerequisites

mkdir obj
cd obj
# gcc release
../configure --enable-languages=c,c++ --disable-multilib --disable-bootstrap
time make -j$(nproc)
make clean
rm -rf *
# clang release
CXX=clang++-12 CC=clang-12 ../configure --enable-languages=c,c++ --disable-multilib --disable-bootstrap
time make -j$(nproc)
make clean
rm -rf *
