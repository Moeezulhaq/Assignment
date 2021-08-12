#!/bin/bash

echo "**************************
  WELCOME TO THE LIBRARY
**************************"

while ! [[ "$VARR"  == "e" ]]

do

echo "Press a to add user.
Press b to enter bookname.
Press x to assign book to user.
press c to check if user has any book assigned. 
Press q to print list of assigned books. 
Press r to Ressign book to a new user.
Press o to Ressignbook.
Press t to check Which book is assigned to which user.
press e to EXIT."
    read -a VARR



if  [[ "$VARR"  == "a" ]]; then
        echo "Enter Username"
        read -a username
        USERNAME="${username[*]}"
        echo "New user $USERNAME is added"
        ARRAYUSERS+=($USERNAME)

elif  [[ "$VARR" == "b" ]]; then
        echo "Enter bookname"
        read -a bookname
        BOOKNAME="${bookname[*]}"
        echo "New book $BOOKNAME is added"
        ARRAYBOOKS+=($BOOKNAME)
elif  [[ "$VARR" == "x" ]]; then
        echo "Enter the User you want to Assign the book too"
        read -a user
        USER="${user[*]}"
        echo "Enter the book name you want to assign to the user $USER"
        read -a book
        BOOK="${book[*]}"
        BOOKASSIGNED+=($BOOK)
        USERSASSIGNED+=($USER)
elif  [[ "$VARR" == "t" ]]; then

 echo "${BOOKASSIGNED[@]}"
 echo "${USERSASSIGNED[@]}"
elif [[ "$VARR" == "o" ]];then
echo "Enter the existing username"
read -a EXUSER
echo "Enter the book you want to ressiagn "
read -a EXBOOK
    
    for (( l=0; l<${#BOOKASSIGNED[@]}; l++ )); do

        if [[ "$EXBOOK" == "${BOOKASSIGNED[l]}" ]]; then

                    BOOKASSIGNED[$l]=0
        fi
    
    done 
    CHECK=0
    for (( i=0; i<${#USERSASSIGNED[@]}; i++ )); do
               
                if  [[ "$EXUSER" == "${USERSASSIGNED[i]}" ]]; then

                    BOOKASSIGNED[$i]="$EXBOOK"
                    echo ""$EXBOOK" has been ressigned to "${USERSASSIGNED[i]}""
                    CHECK=1


                fi 
    done
    if [[ $CHECK == "0" ]]; then
        echo "===================================    
        User Doesnot Exist
==================================="  
    fi
         
# echo "${BOOKASSIGNED[@]}"
# echo "${USERSASSIGNED[@]}"
elif [[ "$VARR" == "r" ]]; then
echo "Enter the new user name"
read -a USER
echo "Enter the book you want to ressiagn "
read -a BOOK    
    
    for (( i=0; i<${#BOOKASSIGNED[@]}; i++ )); do
                        
        if  [[ "$BOOK" == "${BOOKASSIGNED[i]}" ]]; then

                USERSASSIGNED[$i]="$USER"
                        
                echo ""$USER" has book "${BOOKASSIGNED[i]}""

            fi
    
    done
# echo "${BOOKASSIGNED[@]}"
# echo "${USERSASSIGNED[@]}"
elif  [[ "$VARR" == "c" ]]; then
    echo "Enter the Username to check which book is assigned to user "
    read -a User

check=0
            for (( i=0; i<${#USERSASSIGNED[@]}; i++ )); do
        
                if  [[ "$User" == "${USERSASSIGNED[i]}" ]]; then

                        echo ""$User" has book "${BOOKASSIGNED[i]}""
                    check=1
                
                fi

            
        done    
if [ $check -eq "0" ]; then
     echo "$User has no book"
fi
elif  [[ "$VARR" == "q" ]]; then
    echo "Already Assigned books are ${BOOKASSIGNED[@]}"


elif  [[ "$VARR" == "e" ]]; then
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

