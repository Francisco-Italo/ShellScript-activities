#!/bin/bash

# Ler o nome do docente do arquivo nome_docente.txt
nome_docente=$(cat nome_docente.txt)

while IFS= read -r nome; do
    nome_arquivo="/home/italo/atividades/atividade02/professores/${nome}.txt"
    echo "Conteúdo para ${nome_arquivo}" > "$nome_arquivo"
done <<< "$nome_docente"

