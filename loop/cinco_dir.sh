#!/bin/bash

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
# 
# Description: this code create five folders and four texts inside each folder
# 
# Usage:
# ./cinco_dirs.sh

mkdir -p cinco

i=1
while [ $i -le 5 ]
do
	mkdir -p cinco/dir$i

	j=1
	while [ $j -le 4 ]
	do
		echo "$j" > cinco/dir$i/arq$j.txt
		j=$((j+1))
	done
	
	i=$((i+1))
done
