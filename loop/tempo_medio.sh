#!/bin/bash

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
# 
# Description: this program takes a text file with ip addresses and complete it with the average response time (ping) of the respective addresses
# 
# Usage:
# ./tempo_medio.sh [TEXT FILE]

for ip_address in $(cat $1);
do
	echo "$ip_address $(ping -q -c10 "$ip_address" | tail -q -n1 | cut -f5 -d'/') ms" >> latency.txt
done < "ips.txt"

sort -n -k2,2 latency.txt
rm latency.txt
