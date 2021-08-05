#!/bin/bash
echo "enter a string"
read -a string
for ((i=0; i<${#string[@]}; i++)); do
#echo "${string[i]}"
WORD=${string[i]}
     for ((a=0;a<${#WORD};a++)); do
     #echo ${WORD[a]}
        var=" "
        LETTER=${WORD:$a:1}
       # echo "$LETTER"
        var=$(printf "%d\n" \'$LETTER)
        ASCIIARRAY+=($var)

    done
 #   echo ${#ASCIIARRAY[@]}
    for ((t=0;t<${#ASCIIARRAY[@]};t++)); do    
        for ((j=$t+1;j<${#ASCIIARRAY[@]}; j++)); do
            if [[ "${ASCIIARRAY[j]}" -lt "${ASCIIARRAY[t]}" ]]; then
               # echo "test"
                temp="${ASCIIARRAY[j]}"
                ASCIIARRAY[j]="${ASCIIARRAY[t]}"
                ASCIIARRAY[t]="$temp"
            fi
        done    
    done

  #  echo ${ASCIIARRAY[@]}
for ((t=0;t<${#ASCIIARRAY[@]};t++)); do 
    VARR=${ASCIIARRAY[t]} 
    c=$(echo "VARR" | xxd -p -r)

echo "$c"


done
 #    echo ${ASCIIARRAY[@]}

done
 for ((t=0;t<${#ASCIIARRAY[@]};t++)); do  
     echo "${ASCIIARRAY[t]}"
 done

