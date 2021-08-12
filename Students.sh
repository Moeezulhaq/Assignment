#!/bin/bash

echo "**************************
     STUDENT PORTAL
**************************"

while ! [[ "$Input"  == "9" ]]

do

echo "Press 1 to add Student and Marks.
press 2 to check Marks of Students. 
Press 3 to delete student.
Press 4 to Print student.
Press 5 to Print student.
Press 9 to Exit."
    read -a Input
Check=0
check=0        
CHECK=0
Checkk=0
if  [[ "$Input" == "1" ]]; then
        echo "Enter the Student's name"
        read -a user
        USER="${user[*]}"
        echo "Enter the Marks for the Student $USER"
        read -a Marks

        
        if  [[ "$user" == *['!'@#\$%^\&*()_+]* ]]; then

        echo "Please Dont use Special characters."
        Check=1
        break
        fi
        
        
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
    CHeck=0        

if  [[ "$User" == *['!'@#\$%^\&*()_+]* ]]
    then
    echo "Please Dont use Special characters."
    CHeck=1
fi
    USER="${User[*]}"

check=0
    for (( i=0; i<${#STUDENTS[@]}; i++ )); do
        
        if  [[ "$User" == "${STUDENTS[i]}" ]]; then

        echo "==========================================
             "$User" got "${STUDENTMARKS[i]} Marks"
=========================================="
        check=1
                
        fi
if [ $check -eq "0" ]; then
     echo "$User Not Found"
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
      
echo "user $Delete and its marks have been deleted."

elif [[ "$Input" == "4" ]];then
echo "Students and Marks"
echo "Marks :    ${STUDENTMARKS[@]}"
echo "Students : ${STUDENTS[@]}"

elif [[ "$Input" == "5" ]];then

echo "Enter old name"
read -a Oldusr
echo "Enter new user name"
read -a Newusr
for (( l=0; l<${#STUDENTS[@]}; l++ )); do

    if [[ "$Oldusr" == "${STUDENTS[l]}" ]]; then

            STUDENTS[$l]=$Newusr
    fi
done
elif [[ "$Input" == "6" ]];then
echo "Enter user name"
read -a usr
echo "Enter new Marks"
read -a usrmarks
for (( i=0; i<${#STUDENTS[@]}; i++ )); do
        
    if  [[ "$usr" == "${STUDENTS[i]}" ]]; then
                STUDENTMARKS[$i]=$usrmarks
    fi
done
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
