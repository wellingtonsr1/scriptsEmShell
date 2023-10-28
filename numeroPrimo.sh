#!/usr/bin/env bash


#if [[ $# -eq 0 ]]; then
#    echo '-----------------------------------------'
#    echo ' Favor, informar a lista de números.'
#    echo ' Uso:' 
#    echo "   $0 <1> <2> <3> ... <N>"
#    echo '               ou             '
#    echo "   $0 <{1...N}>"
#    echo '-----------------------------------------'
#fi 

echo 'Qual valor? '
read valor

declare -i count=1
for ((i=1; i <= "$valor"; i++)) do
    #echo 'i' $i
    if [[ $i -gt 1 ]]; then
        for ((j=2; j <= 10; j++)); do
            [[ $i%$j -eq 0 ]] && ((count++))
     #       echo 'J' $j
            [[ $count -eq 2 ]] && echo "O número $i é primo. Count $count"
        done
    fi
done
