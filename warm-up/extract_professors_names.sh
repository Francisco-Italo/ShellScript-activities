#!/bin/bash

nome_docente=$(grep -o -E '\/docente\/([^\/"]+)' index.html | cut -d'/' -f3)

nome_docente=${nome_docente//-/_}

echo "$nome_docente" > nome_docente.txt
