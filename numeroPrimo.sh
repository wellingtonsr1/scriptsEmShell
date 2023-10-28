#!/usr/bin/env bash

 

while : 
do
    clear
    echo '--------------------------------------'
    echo '    Verifica se um número é primo.    '
    echo '--------------------------------------'
    echo -n ' Qual o número? (<q> para sair) :  '
    read  valor
    echo ' '

    [[ $valor =~ (q|Q) ]] && exit 0

    primo=true

    if [[ $valor -gt 1 ]]; then
        for ((i=2; i<=$valor/2; i++)); do
            if [[ $valor%$i -eq 0 ]]; then
                primo=false
                break
            fi
        done
    else
        primo=false
    fi

    if [[ $primo == true ]]; then
        echo " - O número $valor é primo."
    else
        echo " - O número $valor não é primo."
    fi
    echo ' '
    echo '--------------------------------------'
    
    echo 'Pressione <ENTER> para continuar'
    read
done





