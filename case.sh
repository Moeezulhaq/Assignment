#! /bin/bash

vehicle=$1

case $vehicle in 
    "car" )
        echo "Rent of $vehicle is 100 dollars per Day" ;;
    "van" )
        echo "Rent of $vehicle is 150 dollars Per Day";;
    "bicycle" )
        echo "Rent of $vehicle is 5 dollars Per Day" ;;
    "truck" )
        echo "Rent of $vehicle is 300 dollars Per Day" ;;                
       *    )
       echo "This vehicle is unkown ."
esac