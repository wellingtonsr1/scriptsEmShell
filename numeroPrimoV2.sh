#!/usr/bin/env bash
#
#+--------------------------------Descrição---------------------------------------------
#| - Dado um número (ou uma lista), é verificado se esse número é prime.                                       
#+----------------------------------Autor-----------------------------------------------
#| - Wellington        									         	                    
#+------------------------------Data de criação-----------------------------------------
#| - 28/10/2023
#+-----------------------------Sistemas testados----------------------------------------
#| - PopOS-x64		                    				 		                                    
#+---------------------------------IMPORTANTE-------------------------------------------
#| -                                                                                                                          
#+--------------------------------------------------------------------------------------


author='Wellingon'
version=2


# Checar se foi informado algum valor
if [[ -z $@ ]]; then  
    echo "---------------------------------------------------------------------"
    echo "                       Atenção!                                      "
    echo "                                                                     "
    echo " Uso: $0 <número1> <número2> <número3> ... <númeroN>                 "
    echo "                          ou                                         "
    echo "      $0 {<número-inicial..<número-final>}                           "
    echo "---------------------------------------------------------------------"
    exit 1
fi


# Exibir o cabeçalho
function displayHead {
    echo '-------------------------------------------------------'
    echo " Exibir os números primos e não-primos entre $1 e $2   "
    echo '-------------------------------------------------------'
}


# Exibir o rodapé
function displayFoot {
    echo '-------------------------------------------------------'
    echo " Desenvolvido por: $author             Versão: $version"
    echo '-------------------------------------------------------'
}


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
    local numberList="$@"
    
    # Pode ser usado o ${!#} para pegar o último valor
    displayHead ${@:1:1} ${@:(-1):1}
 
    # Chamar a função de teste passando um número por vez
    for i in $numberList; do
        isPrime $i
    done
    
    displayFoot
}


# Chamar a função principal
main $@




