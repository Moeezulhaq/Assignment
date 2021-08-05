

word=ab

if [ $word = "b" ]
then
    echo "condition is true"
elif [[ $word == "a" ]]
then 
    echo "condition a is true"
else
    echo "condition is false"
fi

echo "Enter food : "
read 
echo "Names : $REPLY"


var=$REPLY
var1=$REPLY

if [ $var = "cake" ]
then 
    echo "Moeez had cake"
elif [[ $var1 == "Dinner" ]]
then 
    echo "Moeez had dinner"
else
    echo "Moeez had Dinner and cake"
fi