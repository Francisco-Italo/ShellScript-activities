#!/bin/bash

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
#
# Description: it prints a formatted message on the form: [ date time ] alteration old number of files -> new number of files. removed/added: file(s). Also, save the message in a log file. 
#
# Usage: line 13

if [ $# -lt 1 ];
then
	echo "Usage:"
	echo "./dirAlert <intervalo em segundos> <diretório para análise>"
	exit 1
fi

file_count_history=$(ls $2 | wc -l)
ls $2 | cut -f1 -d" " > file_history.txt

while true;
do
	current_file_count=$(ls $2 | wc -l)
	if [ $current_file_count -ne $file_count_history  ];
	then
		ls $2 | cut -f1 -d" " >> file_history.txt

		log=$(echo -n "[ $(date +"%d-%m-%y") $(date +"%H:%M:%S") ] Alteração! $file_count_history -> $current_file_count. ")
		log+=$([[ $current_file_count -gt $file_count_history  ]] && echo -n "Adicionado(s): " || echo -n "Removido(s): ")
		search=$(sort file_history.txt | uniq -u | tr "\n" ", " | sed 's/.$//')
		log+=$(echo $search)

		file_count_history="$current_file_count"
		ls $2 | cut -f1 -d" " > file_history.txt

		echo $log | tee -a dirSensors.log
	fi
	sleep $1
done
