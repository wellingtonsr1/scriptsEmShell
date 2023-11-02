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


AUTHOR='Wellingon'
VERSION=2


# Checar se foi informado algum valor
if [[ -z $@ ]]; then  
    echo "---------------------------------------------------------------------"
    echo "                       Atenção!                                      "
    echo "                                                                     "
    echo " Uso: $0 <número1> <número2> <número3> ... <númeroN>                 "
    echo "                          ou                                         "
    echo "      $0 {<número-inicial>..<número-final>}                          "
    echo "---------------------------------------------------------------------"
    exit 1
fi


# Exibir o cabeçalho
function display_head {
    echo '-------------------------------------------------------'
    echo " Exibir os números primos e não-primos entre $1 e $2   "
    echo '-------------------------------------------------------'
}


# Exibir o rodapé
function display_foot {
    echo '-------------------------------------------------------'
    echo " Desenvolvido por: $AUTHOR             Versão: $VERSION"
    echo '-------------------------------------------------------'
}


# Exibir na tela se o número é primo ou não
function display_prime {
    [[ $1 == true ]] && result='é primo' || result='não é primo'
    
    echo " - O número $2 $result"
    #sleep 1
} 


# Verificar se o número passado é primo
function is_prime {
    local prime=true; number=$1
    
    [[ "$number" -le 1 ]] && prime=false
    
    for ((i=2; i<=($number/2); i++)); do
        if [[ $((number%i)) -eq 0 ]]; then
            prime=false
            break
        fi
    done
    
    display_prime $prime $list_of_numbers 
}


# Função principal
function main {
    local list_of_numbers="$@"
    
    # Pode ser usado o ${!#} para pegar o último valor
    display_head ${@:1:1} ${@:(-1):1}
 
    # Chamar a função de teste passando um número por vez
    for item in $list_of_numbers; do
        is_prime $item
    done
    
    display_foot
}


# Chamar a função principal
main $@




