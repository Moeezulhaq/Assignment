#! /bin/bash


echo "Enter a data"
read text

word=$(echo -n "$text" | wc -w)

char=$(echo -n "$text" | wc -c)

lines=$(echo -n "$text" | wc -l)

special=$(expr length "${text//[^\~!@#$&*()]/}")

# #s="$text"; for i in {a..z}; do
# #     v=$(echo -n "$s" | grep -oi $i | wc -l); echo "$i : $v"; done

# echo -n "$text" | sed 's/\(.\)/\1\n/g'|sort | uniq -c | sed 's/[[:blank:]]//g'

# # Output
# echo "Number of Words = $word"
# echo "Number of Characters = $char"
# echo "Number of Special symbols = $special"
# echo "Number of lines = $lines"




for (( i= 0;i < $length;i++)); do
   foo=$text
   
   for (( a=0; a<${#foo}; a++ )); do
      Y=${foo:$i:1}

      if [[ "${text[i]}" == "${text[a]}" ]]
      then
         z=$(( Y+1 )) 
         echo ${foo:$i:1} = $z
      fi
   done
done



