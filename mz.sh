#! /bin/bash

echo "Enter data"
read -a text

str="${text[*]}"
length=${#str}


echo "Length of '$str' is $length"
for (( i=0; i<${#str}; i++ )); do
   L=${str:$i:1}
   c=0
   x=($L)
    if ! [[ "${z[@]}" =~ "${x}" ]]; then
      z+=($x) 
      for (( j= 0; j<${#str}; j++ )); do
         L2=${str:$j:1}
         if [[ "${L}" == "${L2}" ]]
         then
            c=$(expr $c + 1)
         fi
      done
      if [[ "${z[@]}" != "${L2}" ]]; then
         echo $L = $c 
      fi
   fi
done
