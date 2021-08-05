#! /bin/bash



#curl -o output.txt https://www.eurustechnologies.com/ &>/dev/null  

#cat output.txt |sed -n '/Main navigation/,/Main navigation/p' output.txt | sed 's/<[^>]\+>/ /g'

curl=$(which curl)
output="output.txt"
url="https://www.eurustechnologies.com/" 

function web_output(){
    $curl -o $output $url
} 

function cleaning_html () {
sed -n '/Main navigation/,/Main navigation/p' $output | sed 's/<[^>]*>//g ; /^$/d' | sed 's/[[:blank:]]//g' > temp.txt && cp temp.txt test.txt 
}
#sed 's/<[^>]*>//g ; /^$/d' $VAR1 | sed 's/[[:blank:]]//g'
web_output 
cleaning_html
