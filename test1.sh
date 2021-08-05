#! /bin/bash

echo "Enter a data"
read -a text

str="${text[*]}"
length=${#str}
echo "Length of '$str' is $length"


#for (( i= 0;i < $length;i++)); do
  #  echo " ${text[i]} "
    foo=$text
for (( i=0; i<${#foo}; i++ )); do
   echo "${foo:$i:1}"


#done
#for x in {a..z}
#do
#    echo "$x"

done



#done

