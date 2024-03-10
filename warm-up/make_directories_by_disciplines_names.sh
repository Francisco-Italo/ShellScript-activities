#!/bin/bash

linhas_td=$(grep -o '<td>.*<\/td>' matriz_ec.html)

for linha_td in $linhas_td; do
    nome_integro=$(echo "$linha_td" | tr ' ' '_')
    letras=$(echo "$nome_integro" | tr -d '[:space:]' | sed 's/<\/\?td>//g' | tr -d '[:digit:]')

    if [ -n "$letras" ]; then
        nome_processado=$(echo "$letras" | iconv -f UTF-8 -t ASCII//TRANSLIT | tr -cd '[:alnum:]_' | tr '-' '_')
        if [ ! -d "$nome_processado" ]; then
	   echo "' '"
        fi
    fi
done
