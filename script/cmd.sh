clang test0.c -w -O2 -S -mllvm -debug-only=vectorize-loops --target=hexagon -mllvm -print-after-all 2>1.ll

# this print out the hexagon backend pass flow structure
llc -march=hexagon test0.bc -debug-pass=Structure >1.ll 2>&1

# c to bc
clang --target=hexagon -emit-llvm -c test0.c -o test0.bc

# c to ll
clang --target=hexagon -emit-llvm -c test0.c -S

# bc to final
llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -debug-only=pipeliner < test0.bc -pipeliner-experimental-cg=true >1.ll 2>&1

# bc to before.ll
llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -stop-before=pipeliner < test0.bc -pipeliner-experimental-cg=true >test0_before.ll 2>&1

# before.ll to final
llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -debug-only=pipeliner < test0_before.ll -pipeliner-experimental-cg=true >1.ll 2>&1
