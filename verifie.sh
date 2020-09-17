#!/bin/bash

#permet de convertir  le fichier.xls en csv

xls2csv fichier.xls > converted.csv

# chemin pour acceder au fichier.xls

input="/home/info/Documents/fichier.xls/converted.csv"
# utiliser pour lister les utilisateur
 
array=($(awk -F: '{ print $1 }' /etc/passwd))

# initialisation

i=0;
# lire la ligne

while IFS=read -r line
do
     i=0
     for item in ${array[*]}
     do
          if [ "$line" = "\" $item\""];then
                i=$((i+1))
          fi
     done
#comparer

     if [ "$i" = 0 ]; then
         echo "$line"
         useradd $line
     fi
done < "$input"
  

