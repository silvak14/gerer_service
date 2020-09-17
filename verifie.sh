#!/bin/bash

xls2csv fichier.xls > converted.csv

input="/home/info/Documents/Embauche/converted.csv"
array=($(awk -F: '{ print $1 }' /etc/passwd))

i=0;

while IFS=read -r line
do
     i=0
     for item in ${array[*]}
     do
          if [ "$line" = "\" $item\""];then
                i=$((i+1))
          fi
     done
     if [ "$i" = 0 ]; then
         echo "$line"
         useradd $line
     fi
done < "$input"
  

