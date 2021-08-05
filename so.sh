#! /bin/bash

echo "Enter data"
read -a string

text="${string[*]}"

for ascii in {{65..90},{97..122}}; do
    alphabets+=($ascii)
done

for (( i=0; i<${#text}; i++ )); do
    L=${text:$i:1}
    characters=($L)
    var=$(printf "%d\n" \'$characters)
    data+=($var)

    if  [[ "${data[i]}" =~ "${alphabets[*]}" ]]; then
        continue 
        else
        echo "${data[i]}"
        
    fi
done

