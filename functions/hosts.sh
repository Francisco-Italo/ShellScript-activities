#!/bin/bash

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
#
# Description: this code simulates a database of hosts registered. 
#
# Usage: line 43

is_empty()
{
	if [[ ! -e "hosts.db" || ! -s "hosts.db" ]];
        then
        	echo "There is no data registered."
		exit 1
	fi
}

check_registries()
{	
	OPT=$2
        DATA="$([[ $OPT -gt 0  ]] && grep "$1" hosts.db|cut -f1 -d $'\t' 2>/dev/null || grep "$1" hosts.db|cut -f2 -d $'\t' 2>/dev/null)"
        
	if [ "$DATA" = "$1" ];
	then
		return 0;
	fi
	
	return 1
}

create_database()
{
	if [[ ! -e "hosts.db" ]];
	then
		touch hosts.db
	fi
}

usage()
{
	echo "Usage: $0 [ -a HOSTNAME -i IP ] [ -d HOSTNAME ] [ HOSTNAME ] [ -l ] "  
}

add()
{
	create_database
	check_registries $IP 0

	if [ $? -eq 0 ];
	then
		echo "Cannot add: $IP already registered."
		exit 1
	fi

	check_registries $HOST 1

	if [ $? -eq 0 ];
	then
		echo "Cannot add: hostname already registered."
		exit 1
	fi

	printf "%s\t%s\n" "$HOST" "$IP" >> hosts.db
	echo "Registration complete."
}

delete()
{
	PARAM=$2
	is_empty

	HOST=$(search $1 $PARAM)
	
	if [ $? -ne 0 ];
	then
		echo "Not found."
		exit 1
	fi

	sed -i "/$HOST/d" hosts.db 2>/dev/null

	if [ $? -eq 0 ];
	then
		echo "Registry(ies) $HOST successfully removed."
	else
		echo "An error occured while executing command."
	fi
}

search()
{
	PARAM=$2
	DATA="$([[ $PARAM -gt 1  ]] && grep "$1" hosts.db|cut -f1 -d $'\t' 2>/dev/null || grep "$1" hosts.db|cut -f2 -d $'\t' 2>/dev/null)"
		
	if [ -z $DATA  ] 2>/dev/null; 
	then
		echo "$1 not found."
	        exit 1
	else
		echo "$DATA"
		exit 0
	fi
}

list()
{
	is_empty

	cat "hosts.db" 2>/dev/null
	if [ $? -ne 0  ];
	then
		echo "Ocorreu um erro ao executar o comando."
	fi
}

OPT=^-[a-zA-Z]$
HOST=""
IP=""

if [[ $# -eq 0 ]];
then
	usage
	exit 1
fi

if ! [[ $1 =~ $OPT ]];
then
	search $1 $#
fi	

while getopts ":a:i:d:r:lh" option;
do
	case "${option}" in
		a)
			HOST=${OPTARG}
			;;
		i)
			IP=${OPTARG}

			if [ -z "$HOST" ];
			then
				usage
				exit 1
			fi

			add
			;;
		d)
			delete $2 $#
			;;
		l)
			list
			;;
		r)
			search $2 $#
			;;
		:)
			echo "Error: -${OPTARG} requires an argument."
			exit 1
			;;
		*|h)
			usage
			;;
	esac
done
