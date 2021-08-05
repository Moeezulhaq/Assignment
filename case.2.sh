#! /bin/bash

os=('ubuntu' 'windows' 'kali')
os[2]='mac'

unset [1]
echo "${os[@]}"
echo "${os[1]}"
echo "${!os[@]}"
echo "${#os[@]}"

string=svndc,mas. 
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
echo "${#os[@]}"