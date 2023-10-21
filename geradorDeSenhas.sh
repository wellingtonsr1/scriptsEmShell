#!/usr/bin/env bash
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
declare -i passwordSize=0
declare -i minimumSize=8


until [ "${#characters[@]}" -ne 0 ]; do
    clear
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    echo "*            Gerador de senhas                    *"
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    echo " "

    echo "Escolha os caracteres que farão parte da senha"
    echo " ** Deve ser escolhido ao menos um tipo. **"
    echo " "

    read -p "=> Números (s\N)? " yesOrNo
    [[ "$yesOrNo" =~ ("s"|"S") ]] && characters+=(0 1 2 3 4 5 6 7 8 9) 

    read -p "=> Letras maiúscula (s\N)? " yesOrNo
    [[ "$yesOrNo" =~ ("s"|"S") ]] && characters+=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

    read -p "=> Letras minúsculas (s\N)? " yesOrNo
    [[ "$yesOrNo" =~ ("s"|"S") ]] && characters+=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    read -p "=> Caracteres especiais (s\N)? " yesOrNo
    [[ "$yesOrNo" =~ ("s"|"S") ]] && characters+=('!' '@' '#' '$' '%' '&' '*' '?')
    echo " "
done

until [ "$passwordSize" -ge "$minimumSize" ]; do
    read -p "Qual será o tamanho da senha (Mínimo é $minimumSize)? " passwordSize
done
echo " "

for ((i=0; i < "$passwordSize"; i++)); do
    indice=$(($RANDOM%${#characters[@]}))
    password["$i"]="${characters["$indice"]}"
done    

echo -n "Senha gerada: "; echo "${password[@]}" | sed 's/ //g'
echo " "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
