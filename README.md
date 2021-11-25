# Compile Speed Benchmarks

This is a benchmark of gcc and clang compile times on a few open source code bases. There is
currently not a lot of good benchmarking done on the speed of compilers themselves.

Methodology: Microbenchmarking how compilers perform with specific language features may be
interesting but doesn't produce particularly useful or relevant results. The way to get useful
benchmarks is to run macro benchmarks on large codebases: This is a simple wall clock experiment.

The wall clock time includes more than just C++ source compilation time (notably object linking) but
this is ok. The vast majority of the time is C++ source compile time. By varying only which compiler
is used we can get a lower-bound for the relative performance between the compilers.

Benchmarks done with gcc 10 and clang 12

|                  | GCC     | Clang   |
| ---------------- |:-------:|:-------:|
| OpenCV Debug     | 12m 29s | 10m 52s (-12%) |
| OpenCV Release   | 18m 44s | 9m 11s  (-51%) |
| Mongo DB Release | 1h 57m  | 1h 19m  (-32%) |
<!--| Chromium Release | .       | 5h 30m  |-->
<!--| Chromium Debug   | .       | 5h 15m  |-->

Note: Not currently testing LTO or experimenting with different linkers. I would like to in the
future.

I'd like to test on more codebases. I spent a lot of time trying to get chromium to compile with gcc
but was unsuccessful.

### Related work

- [C macrobenchmark using the linux kernel][1]

[1]: https://linuxplumbersconf.org/event/7/contributions/802/attachments/652/1192/Measuring_Kernel_Compile_Times_w__Clang.pdf
