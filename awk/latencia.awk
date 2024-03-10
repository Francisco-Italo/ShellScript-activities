#/bin/awk -f

# Name: Francisco Ítalo de Andrade Moraes
# Email: italomorais181@gmail.com
#
# Description: awk version of tempo_medio.sh (see in folder "loop").
#
# Usage:
# awk -f latencia.awk [ TEXT FILE ]

BEGIN {
	IP_ADDRESS=ARGV[1]
}

{
	PING_REQ="ping -q -c10 " $IP_ADDRESS
		
	while(PING_REQ | getline OUT){
		split(OUT,OUT_VEC,"/")
		if(OUT_VEC[5] != "")
			print $IP_ADDRESS " " OUT_VEC[5] " ms" >> "latency.txt"
	}
	close(PING_REQ)
}

END {
	system("sort -n -k2,2 latency.txt")
    	system("rm latency.txt")
}
