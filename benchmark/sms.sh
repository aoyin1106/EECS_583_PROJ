DIR=original-output
if [ -d $DIR ]; then
    rm -r $DIR
fi
mkdir $DIR

for file in testcases/*; do
    echo $file
    llc -march=hexagon -mcpu=hexagonv5 -enable-pipeliner -debug-only=pipeliner < $file -pipeliner-experimental-cg=true > $DIR/$(basename "$file")-ouptut 2>&1
done
echo "SMS Done"