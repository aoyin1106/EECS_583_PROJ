clang test0.c -w -O2 -S -mllvm -debug-only=vectorize-loops --target=hexagon -mllvm -print-after-all 2>1.ll

# this print out the hexagon backend pass flow structure
llc -march=hexagon test0.bc -debug-pass=Structure >1.ll 2>&1

# c to executable
clang hello.c -o hello

# c to bc
clang --target=hexagon -emit-llvm -c test0.c -o test0.bc

# c to ll
clang --target=hexagon -emit-llvm -c test0.c -S

# bc to final
llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -debug-only=pipeliner < test0.bc -pipeliner-experimental-cg=true >1.ll 2>&1

# bc to before.ll
llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -stop-before=pipeliner < test0.bc -pipeliner-experimental-cg=true >test0_before.ll 2>&1

# before.ll to final
llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -debug-only=pipeliner < sample.ll -pipeliner-experimental-cg=true >out.ll 2>&1

llc -march=sparc -enable-pipeliner -debug-only=pipeliner < sample.ll -pipeliner-experimental-cg=true >out.ll 2>&1


# * workflow for using hexagon-sim to simulate a 
# c to ll
hexagon-clang --target=hexagon -emit-llvm -c sample.c -S
# build a .ll testcase to assembly, add -debug=pipeliner if you need
llc -march=hexagon -enable-pipeliner < sample.ll -pipeliner-experimental-cg=true >sample_pipe.ll
# build executable from .s assembly
llc -march=hexagon -enable-pipeliner < sample_pipe.ll -pipeliner-experimental-cg=true -o sample_pipe.o -filetype=obj
hexagon-clang --target=hexagon sample_pipe.ll -o sample
# simulate it 
hexagon_sim sample


# this is the hexagon tutorial ver
hexagon-clang hello.c -o hello
hexagon-sim hello

# this is right
hexagon-clang -emit-llvm -c hello.c -S
hexagon-clang hello.ll -o hello
hexagon-sim hello

## can I send -mllvm to hexagon-clang?
hexagon-clang -emit-llvm -c hello.c -S
hexagon-clang hello.ll -mllvm -enable-pipeliner -mllvm -stop-before=pipeliner > jiehu.ll 2>&1

