#! /bin/bash
 
: '
echo "Hello bash script"
echo "Checking if this works" >> file.txt
#this will add text to a newfile.
#cat >> file1.txt 

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
    done 

for i in {0..20..2} #{start..ending..increment}
    do
        echo $i
done 
    
for (( i=0; i<5; i++ ))
do
    echo $i
done 
    
for (( i=0; i<10; i++ ))
do
    if [ $i -gt 5 ]
    then
        break
    fi
    echo $i
done 

for (( i=0; i<10; i++ ))
do
    if [ $i -eq 3 ] || [ $i -eq 7 ]
    then
        break
    fi
    echo $i
done 

echo $1 $2 $3 

args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} 

args=("$@")
echo $@

echo $# 

while read line
do 
    echo "$line"
done < "${1:-/dev/stdin}" 

ls -al 1>file1.txt 2>file2.txt 

ls -al >file1.txt 

ls -al >& file1.txt 

Message="hello linuxint audiance"
export Message
./file.sh  

echo " The message from bash is ": $Message

echo "enter 1st string"
read st1 

echo "enter 2nd string"
read st2

if [ "$st1" == "$st2" ]
then
    echo "strings match"
else
    echo "strings dont match"
fi 

echo "enter 1st string"
read st1 

echo "enter 2nd string"
read st2 

if [ "$st1" \< "$st2" ]
then
    echo "$st1 is smaller than $st2"
elif [ "$st1" \> "$st2" ]
then 
    echo "st2 is smaller than $st1"
else
    echo "both strings are equal"
fi 

echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

echo ${st1^}
echo ${st1^^} 

n1=4
n2=20

echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))
echo $(( n1 % n2 )) 

n1=4
n2=20

echo $(expr $n1 + $n2)
echo $(expr $n1 - $n2)
echo $(expr $n1 \* $n2)
echo $(expr $n1 / $n2)
echo $(expr $n1 % $n2) 

echo "Enter Hx Number of your choice"
read Hex

echo -n "The decimal value of $Her is : "
echo "obase=10; ibase=16; $Hex" | bc '

