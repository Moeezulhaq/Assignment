#! /bin/bash

echo "Hello bash script"
echo "Checking if this works" >> file.txt
#this will add text to a newfile.
#cat >> file1.txt 
: '
cat << kreative
hello kreatice text 
another one 
and another one
kreative 

count=10
if [ $count -gt 99 ]
then
    echo "The condition is true"
else
    echo "The condition is false"        
fi '
: '
count=10
if (( $count < 99 ))
then
    echo "The condition is true"
elif (( $count <= 9 ))
then
    echo "The condition is true"        
else 
    echo "The condition is false"
fi 

age=10

if [ "$age" -gt 9 ] && [ "$age" -lt 40 ]
then
    echo "Age is correct"
else
    echo "Age is not correct"
    fi 

age=10

if [[ "$age" -gt 9  &&  "$age" -lt 40 ]]
then
    echo "Age is correct"
else
    echo "Age is not correct"
    fi 

    age=30

if [ "$age" -lt 9  -o  "$age" -gt 40 ]
then
    echo "Age is correct"
else
    echo "Age is not correct"
    fi 

number=1
while [ $number -lt 10 ] 
do
    echo "$number"
    number=$(( number+1 ))
    done 

    number=1
until [ $number -ge 10 ] 
do
    echo "$number"
    number=$(( number+1 ))
    done '

    for i in 1 2 3 4 5 
    do
        echo $i
    done
    