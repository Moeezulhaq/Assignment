#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name ]
then 
        if [ -w $file_name ]
        then
            echo "Type some text data.To quit press ctrl+d."
            cat > $file_name
        else
        echo "THe file does not have write permissions"
        fi
else
    echo "$file_name empty"
fi

#cat > $file_name is used to overwrite data . cat >> $file_name is used to add to the file