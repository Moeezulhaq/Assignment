#/!bin/bash

echo "Enter your age"

read age

if [ "$age" -ge 18 ]; then

    echo "you ae eligible to vote"
else
    echo "you are younger !!"
fi