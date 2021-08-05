#! /bin/bash
#while loops sleep command
n=1

while [ $n -le 100000000000 ]
do
    echo "$n" 
    (( ++n ))
    #sleep 1

done
