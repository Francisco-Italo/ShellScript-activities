#!/bin/bash

# Name: Francisco Ítalo de Andrade moraes
# Email: italomorais181@gmail.com
# 
# Description: performs a sum of values from an input file
#
# Usage:
# ./somaPreco.sh [INPUT FILE]

soma=0
soma=$((soma + $(sed -n "1p" compras.txt | grep -o '[0-9]\+$')))
soma=$((soma + $(sed -n "2p" compras.txt | grep -o '[0-9]\+$')))
soma=$((soma + $(sed -n "3p" compras.txt | grep -o '[0-9]\+$')))
soma=$((soma + $(sed -n "4p" compras.txt | grep -o '[0-9]\+$')))
soma=$((soma + $(sed -n "5p" compras.txt | grep -o '[0-9]\+$')))
echo "Total: $soma"
