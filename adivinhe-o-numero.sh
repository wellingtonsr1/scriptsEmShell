#!/usr/bin/env bash

secret_number=$(($RANDOM%101))

echo '--------------------------------------------------'
echo '             Jogo de adivinhação                  '
echo '--------------------------------------------------'

until [[ $number -eq $secret_number ]]; do    
    # Pedir ao jogador que forneça um número de 1 a 100
    echo -n 'Escolha um número de 1 a 100: '
    read number
    echo ' '
    
    # Checar se o número informado é maior, menor ou igual ao número correto

    #   - Se for maior, exibir a mensagem de maior
    if [[ $number -gt $secret_number ]]; then
        echo '  - Seu número é maior.'
        echo ' '        
    #   - Se for menor, exibir a mensagem de menor
    elif [[ $number -lt $secret_number ]]; then
        echo '  - Seu número é menor.'
        echo ' '
    #   - Se for igual, exibir a mendsagem de 'Parabéns, Você acertou!'
    else
        echo "  - Parabéns, Você acertou! O número secreto é $secret_number."
        echo ' '
    fi
done

echo '--------------------------------------------------------'





