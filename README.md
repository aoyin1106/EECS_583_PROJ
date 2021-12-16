# EECS583 Final Project

This is the project repo of team 18 for Umich EECS 583 Fall2021. Our project designs a power-sensitive modulo scheduling algorithm based on the swing modulo scheduling algorithm. The algorithm aims at producing an instruction scheduling with more balanced power consumption at each cycle. We implement this algorithm in llvm and get satisfying experimental results.

For detailed information, please read the project report and related papers in `doc` repo.

## Build

As far as we know, llc does not support the user to write and build their own pass and link that static library to the llvm core. Instead, you have to register it into the llvm core and compile the whole project. For simplification, we re-write the MachinePipeliner pass in llvm, but that also means you should have 2 llvm projects built separately if you want to compare the effect of this modified modulo scheduling algorithm with the original version.

To build it, you should clone the source code of llvm project (the llvm version we use is 14.0), then replace the `MachinePipeliner.cpp` located in `llvm-project/llvm/lib/CodeGen` with the file with same name in the `src` repository of this repo. Then you can follow the ordinary process of building an llvm project, which can be found here: https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm

## Test

We have scripts for testing the effect of our pass. To run a new test, you can move the testcases into `benchmark/testcases/` and then run `psms.sh` or `sms.sh` under `benchmark` repo. As is said before,  you need to build 2 llvm projects for compare. If the llvm runs modified pipeliner code, then run`psms.sh`, else you should run `sms.sh`. They have same function, just different in names.

After you have results written to `benchmark/original-output` and `benchmark/psms-output`, you can then compare them by running `cmp.sh` under `benchmark` repo. There has been some cases tested and stored in the repos, two critical cases have been analyzed in detail and you can see some more readable visualizations in our report located in `doc/`.