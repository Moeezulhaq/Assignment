#!/bin/bash

for array in {1..100}
    do 
  if [ $(($array%2)) -eq 0 ]
  then
    echo "$array is not a prime number."
  else 
    echo "$array is a prime number."
  fi
done