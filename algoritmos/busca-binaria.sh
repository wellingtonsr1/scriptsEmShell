#!/usr/bin/env bash




list_of_numbers=(a b c d e f g h i j)

first=0
last=$((${#list_of_numbers[@]} - 1))

echo '---------------------------------------'
echo '           Busca binária               '
echo '---------------------------------------'
echo -n 'Qual número pesquisar: '
read choice

echo ' '
while [[ $first -le $last ]]; do
    half=$(( (first + last) / 2 ))
    number=${list_of_numbers[$half]}
    
    if [[ $number == $choice ]]; then
        echo "O $number foi encontrado e está na posição $half"
        found=1
        break
    elif [[ $number < $choice ]]; then 
        first=$((half + 1))
    else 
        last=$((half - 1))
    fi   
done


[[ $found -eq 0 ]] && echo "O número $choice não foi encontado."
              
echo '---------------------------------------'

# 1 2 3 4 5 6 7 8 9 10




