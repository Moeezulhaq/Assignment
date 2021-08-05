#! /bin/bash

function print () {
name=$1
echo "the name is $name"
}

name="Tom"

echo "The name is $name :before"

print Maxxx

echo "The name is $name :after"