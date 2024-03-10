#!/bin/bash

# Name: Francisco Ítalo de Andrade moraes
# Email: italomorais181@gmail.com
# 
# Description: performs a sum of values from an input file
#
# Usage: see line 14


if [ $# -lt 1 ];
then
	echo "Uso:"
	echo "./agenda.sh <listar>/<adicionar> <Nome> <E-mail>/<remover> <E-mail>."
	exit 1
fi

case "$1" in
	listar)
		if [[ ! -e "agenda.db" || ! -s "agenda.db" ]];
		then
			echo "Arquivo vazio!"
		else
			cat "agenda.db"
			
			if [ $? -ne 0  ];
			then
				echo "Ocorreu um erro ao executar o comando."
			fi
		fi
		;;
	adicionar)
		if [[ ! -e "agenda.db" ]];
		then
			touch agenda.db
		fi

		grep -q "$2" agenda.db

		if [ $? -eq 0 ];
		then
			echo "Usuário já cadastrado."
			exit 0
		fi
		
		grep -q "$3" agenda.db

		if [ $? -eq 0 ];
		then
			echo "E-mail já cadastrado."
			exit 0
		fi
		
		echo "$2:$3" >> agenda.db
		echo "Usuário $2 adicionado com sucesso."
		;;
	remover)
		if [[ ! -e "agenda.db" || ! -s "agenda.db" ]];
		then
			echo "Arquivo vazio!"
		else
			grep -q "$2" agenda.db
			
			if [ $? -ne 0 ];
			then
				echo "Usuário não existe."
				exit 1
			fi

			sed -i "/$2/d" agenda.db

			if [ $? -eq 0 ];
			then
				echo "Usuário $2 removido com sucesso."
			else
				echo "Ocorreu um erro ao executar o comando."
			fi
		fi
		;;
	*)
		echo "Funções suportadas: listar, adicionar, remover."
		;;
esac
