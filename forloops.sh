#! /bin/bash
# for loops

for VARIABLE in 1 2 3 4 5 .. N 
do 
    command1
    command2
    commandN
done
#OR---------------------------------------------

for VARIABLE in file1 file2 file3 .. N 
do 
    command1
    command2
    commandN
done
#OR--------------------------------------------

for OUTPUT in $(Linux-or-Unix-Command-Here)
    
    command1 on $OUTPUT
    command2 on $OUTPUT
    commandN
done
#OR - -----------------------------------------
for (( EXP1; EXP2; EXP3 ))
do
    command1
    command2
    command3
done