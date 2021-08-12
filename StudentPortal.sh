#!/bin/bash

echo "**************************
     STUDENT PORTAL
**************************"

while ! [[ "$Input"  == "9" ]]

do

echo "Press 1 to add Student and Marks.
press 2 to check Marks of Students. 
Press 3 to delete student.
Press 9 to Exit."
    read -a Input
Check=0
check=0        
CHECK=0
if  [[ "$Input" == "1" ]]; then
        echo "Enter the Student's name"
        read -a user
        USER="${user[*]}"
        echo "Enter the Marks for the Student $USER"
        read -a Marks
        if  [[ "$Marks" == *['!'@#\$%^\&*()_+]* ]]; then

        echo "Please Dont use Special characters.Enter Number between 1-100"
        Check=1
        break
        fi
        
        if ! [[ "$Marks" =~ ^[[:digit:]]+$ ]]; then

            echo "Enter Number between 1-100"
        CHECK=1
        fi

        if  [[ "$Marks" -ge "100" ]]; then

        echo "==========================================
        "Enter value between 1-100"
=========================================="
        check=1
        fi        
        
        if  [[ "$Marks" -le "100" ]]; then

        MARKS="${Marks[*]}"
        STUDENTMARKS+=($MARKS)
        STUDENTS+=($USER)
        fi        
        

 
elif  [[ "$Input" == "2" ]]; then
    echo "Enter the Student name to check Marks "
    read -a User

check=0
    for (( i=0; i<${#STUDENTS[@]}; i++ )); do
        
        if  [[ "$User" == "${STUDENTS[i]}" ]]; then

        echo "==========================================
             "$User" got "${STUDENTMARKS[i]} Marks"
=========================================="
        check=1
                
        fi

            
    done   
elif [[ "$Input" == "3" ]];then
echo "Enter Student you want to Delete"
read -a Delete
#Delete Marks
for (( i=0; i<${#STUDENTS[@]}; i++ )); do
    if  [[ "$Delete" == "${STUDENTS[i]}" ]]; then
        for target in "${STUDENTMARKS[i]}"; do
            for i in "${!STUDENTMARKS[@]}"; do
                if [[ ${STUDENTMARKS[i]} = $target ]]; then
                    unset 'STUDENTMARKS[i]' 
                fi
            done
        done        
    fi
done  

#Deleting user
for target in "$Delete"; do
  for i in "${!STUDENTS[@]}"; do
    if [[ ${STUDENTS[i]} = $Delete ]]; then
      unset 'STUDENTS[i]'
    fi
  done
done
      
echo "Marks :    ${STUDENTMARKS[@]}"
echo "Students : ${STUDENTS[@]}"    
    CHECK=0

elif [[ "$Input" == "4" ]];then
echo "Students and Marks"
echo "Marks :    ${STUDENTMARKS[@]}"
echo "Students : ${STUDENTS[@]}"

elif  [[ "$Input" == "9" ]]; then
    echo "===================================    
        Exiting Program
==================================="  
    exit 1
break

else 
echo "===================================    
        Invalid value
==================================="   

fi
done
