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
function msgPrimo {
    [[ $1 == true ]] && resultado='é primo' || resultado='não é primo'
    
    echo " - O número $2 $resultado"
    #sleep 1
} 


# Verificar se o número passado é primo
function ePrimo {
    primo=true
    numero=$1
    
    [[ "$numero" -le 1 ]] && primo=false
    
    for ((i=2; i<=($numero/2); i++)); do
        if [[ $((numero%i)) -eq 0 ]]; then
            primo=false
            break
        fi
    done
    
    msgPrimo $primo $numero
}


# Chamar a função de teste passando um número por vez
for i in $@; do
    ePrimo $i
done 





