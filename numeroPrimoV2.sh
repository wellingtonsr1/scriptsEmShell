#!/usr/bin/env bash
#
#+--------------------------------Descrição---------------------------------------------
#| - Dado um número, é verificado se esse número é primo.                                       
#+----------------------------------Autor-----------------------------------------------
#| - Wellington        									         	                    
#+------------------------------Data de criação-----------------------------------------
#| - 28/10/2023
#+-----------------------------Sistemas testados----------------------------------------
#| - PopOS-x64		                    				 		                                    
#+---------------------------------IMPORTANTE-------------------------------------------
#| -                                                                                                                          
#+--------------------------------------------------------------------------------------


 

# Exibir na tela se o número é primo ou não
function displayPrime {
    [[ $1 == true ]] && result='é primo' || result='não é primo'
    
    echo " - O número $2 $result"
    #sleep 1
} 


# Verificar se o número passado é primo
function isPrime {
    local prime=true; number=$1
    
    [[ "$number" -le 1 ]] && prime=false
    
    for ((i=2; i<=($number/2); i++)); do
        if [[ $((number%i)) -eq 0 ]]; then
            prime=false
            break
        fi
    done
    
    displayPrime $prime $number
}


# Função principal
function main {
    local numberList=$@
    
    # Chamar a função de teste passando um número por vez
    for i in $numberList; do
        isPrime $i
    done 
}


# Chamar a função principal
main $@




