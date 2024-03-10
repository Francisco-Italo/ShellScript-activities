#!/bin/bash

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
# 
# Description: This code performs queries chose by the user in a server log.
# 
# Usage:
# ./logins.sh [1-4]

case "$1" in 
	1) 
		echo -e "Comando 1: todas as linhas com mensagens que não são do sshd.\n"
		grep -v sshd auth.log
	;;
	2) 
		echo -e "Comando 2: usuários cujo nome começa com 'j' que conseguiram fazer login via sshd.\n"
		grep "sshd.*opened.*j" auth.log
	;;
	3)
	        echo -e "Comando 3: Número de vezes que alguém tentou fazer login via root com o sshd.\n"
		grep -c "sshd.*Disconnected.*root" auth.log
	;;
	4) 
		echo -e "Comando 4: todos os registros de login com sucesso entre 11 e 12 de Outubro.\n"
		grep -E  "Oct (11|12).*New" auth.log
	;;
	*) 
		echo "Entrada inválida."
	;;
esac
