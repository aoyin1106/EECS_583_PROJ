DIR_0=original-output
DIR_1=psms-output
DIR_DIFF=diff-result

if [ -d $DIR_DIFF ]; then
    rm -r $DIR_DIFF
fi
mkdir $DIR_DIFF

for file in $DIR_0/*; do 
    case=$(echo $file | cut -d'.' -f1 | cut -d'/' -f2)
    echo "Case " $case

    file_0=$DIR_0/$case.ll-output
    file_1=$DIR_1/$case.ll-output
    echo "Compare " $file_0 " And " $file_1

    diff -y --suppress-common-lines -w -B -E $file_0 $file_1 > $DIR_DIFF/$case
done

find $DIR_DIFF -type f -empty -print -delete