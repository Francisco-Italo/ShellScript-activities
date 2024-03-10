#!/bin/bash

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
#
# Description: forms a cute messsage using the hostname and machine's date
#
# Usage:
# ./saudacao.sh

user_str="$(who)"
date_str="$(date +%D)"

user=$(echo "$user_str" | cut -d' ' -f1)
day=$(echo "$date_str" | cut -d'/' -f2)
month=$(echo "$date_str" | cut -d'/' -f1)
year="$(date +%Y)"

echo -e "Olá $user,\nHoje é dia $day, do mês $month do ano de $year."
