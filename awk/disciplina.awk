#/bin/awk -f

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
#
# Description: this code receives a text file providing a student's name and its grades and outputs a message with the student's name, the situation and arithmetic average.
#
# Usage:
# awk -f disciplina.awk [ TEXT FILE ]


BEGIN {
	FS=":"
}
{
	if(NR == 1){
		printf("Aluno:Situação:Média\n")
		next
	}
	
	MED=0
	for (i = 2; i <= NF; i++){
		MED+=$i
	}
	MED/=(NF-1)

	if(MED < 4) STAT="Reprovado"
	else if(MED < 7) STAT="Final"
	else STAT="Aprovado"
	
	printf("%s:%s:%.1f\n", $1, STAT, MED)
	
	for(i = 2; i <= NF; i++){
		SUM_EXAM[i] += $i
	}
}
END {
	printf("Média das provas:");
	for(i = 2; i <= NF; i++) printf(" %.1f", SUM_EXAM[i]/(NR-1));
	printf("\n");	
}
