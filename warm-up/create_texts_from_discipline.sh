#!/bin/bash

nome_disciplina=$(cat disciplines_names)

while IFS= read -r nome; do
    nome_arquivo="/home/italo/atividades/atividade02/disciplinas/${nome}.txt"
    echo "Conteúdo para ${nome_arquivo}" > "$nome_arquivo"
done <<< "$nome_disciplina"
