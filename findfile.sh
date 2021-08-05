#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -s $file_name ]
then 
    echo "$file_name not empty"
else
    echo "$file_name empty"
fi

# -f flag is used for files -d flag is used for directories -b is used for videos and images -c 
#for character special files. To check if file is empty for not use flag -s.