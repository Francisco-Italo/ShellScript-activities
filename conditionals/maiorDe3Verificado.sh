#!/bin/bash

# Name: Francisco Ítalo de Andrade moraes
# Email: italomorais181@gmail.com
# 
# Description: output the biggest value of three provided
#
# Usage:
# ./somaPreco.sh [N1] [N2] [N3]


if [ ! $# -eq 3 ];
then
	echo "Informe 3 parâmetros."
	exit 1
fi
if ! [[ $1 -eq $1 && $2 -eq $2 && $3 -eq $3 ]];
then
	echo "Somente números são permitidos!"
	exit 1
fi

echo "Maior:"
if [ $1 -ge $2  ];
then
	if [ $1 -ge $3  ];
	then
		echo "$1"
	else
		echo "$3"
	fi
else
	if [ $2 -ge $3  ];
	then
		echo "$2"
	else
		echo "$3"
	fi
fi

