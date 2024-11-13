#!/usr/bin/env bash
#
#+------------------------------------------------Descrição-----------------------------------------------------------------+
#| - Gera senhas usando números, letra minúsculas, maiúscula e caratcteres especiais.                                       |
#+--------------------------------------------------Autor-------------------------------------------------------------------+
#| - Wellington        									         	                                                        |
#+--------------------------------------------Sistemas testados-------------------------------------------------------------+
#| - PopOS-x64		                    				 		                                                            |
#+-----------------------------------------------IMPORTANTE-----------------------------------------------------------------+
#| -                                                                                                                        |  
#+--------------------------------------------------------------------------------------------------------------------------+


password=()
characters=()
declare -i password_length=0
declare -i minimum_length=8

read -p "Qual será o tamanho da senha (Tecle Enter para $minimum_length)? " password_length
[[ $password_length -lt $minimum_length ]] && password_length=$minimum_length


until [[ "${#characters[@]}" -ne 0 ]]; do
    clear
    echo '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
    echo '*            Gerador de senhas                    *'
    echo '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
    echo ' '

    echo 'Escolha os caracteres que farão parte da senha'
    echo ' ** Deve ser escolhido ao menos um tipo. **'
    echo ' '

    read -p '=> Números (s\N)? ' yes_or_no
    [[ "$yes_or_no" =~ ("s"|"S") ]] && characters+=(0 1 2 3 4 5 6 7 8 9) 

    read -p '=> Letras maiúscula (s\N)? ' yes_or_no
    [[ "$yes_or_no" =~ ("s"|"S") ]] && characters+=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

    read -p '=> Letras minúsculas (s\N)? ' yes_or_no
    [[ "$yes_or_no" =~ ("s"|"S") ]] && characters+=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    read -p '=> Caracteres especiais (s\N)? ' yes_or_no
    [[ "$yes_or_no" =~ ("s"|"S") ]] && characters+=('!' '@' '#' '$' '%' '&' '*' '?')
    echo ' '
done

for ((i=0; i < "$password_length"; i++)); do
    indice=$(($RANDOM%${#characters[@]}))
    password["$i"]="${characters["$indice"]}"
done    

echo -n 'Senha gerada: '; echo "${password[@]}" | sed 's/ //g'
echo ' '
echo '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
