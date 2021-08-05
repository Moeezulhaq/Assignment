#! /bin/bash

select name in  mark john tom ben 
do
    case $name in 
    mark)
    echo mark selected
    ;;
    john)
    echo jhon selected
    ;;
    tom)
    echo tom selected
    ;;
    ben)
    echo ben selected
    ;;
    *)
    echo "Error,Please provide a number between 1..4" 
    esac
done