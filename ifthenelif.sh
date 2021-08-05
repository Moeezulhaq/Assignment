#!/bin/bash

echo "choose color from Red,Green,Blue,Orange"

read color

if [ $color == Red ]
then
    echo "you are cheerful"
elif [ $color == Blue ]    
then
    echo "you are lucky"
else
echo
    echo "you are both"
fi


#! /bin/bash

echo "Enter data"
read -a text

str="${text[*]}"
length=${#str}
echo "Length of '$str' is $length"
for (( i=0; i<${#str}; i++ )); do
   L=${str:$i:1}
   #echo $L   
   c=0
   x=($L)
   #echo $x
   if [[ "${L}" == "${x}" ]]
   then 
   #echo "I have the Value"
    if  [[ "${z[*]}" =~ "$x" ]]
   then
        for (( j= 0; j<${#str}; j++ )); do
      L2=${str:$j:1}
      #echo $L2
      if [[ "${L}" == "${L2}" ]]
      then
        # echo "if check"
        c=$(expr $c + 1)
      #echo $L = $L2
      fi
   done
   else 
      z+=($x) 
   fi
   fi
 #  echo "The vaule of array z is ${z[@]}"
   #for (( j= 0; j<${#str}; j++ )); do
      L2=${str:$j:1}
      #echo $L2
    #  if [[ "${L}" == "${L2}" ]]
     # then
        # echo "if check"
      #  c=$(expr $c + 1)
      #echo $L = $L2
      #fi
   #done
   echo $L = $c   
done