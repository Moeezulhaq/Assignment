#! /bin/bash
# for loops

echo ${BASH_VERSION}
for i in {1..10000000} ##{START..END..INCREMENT}
do 
    echo $i
done


echo ${BASH_VERSION}
for i in (( i=0; i<5; i++ ))
do 
    echo $i
done