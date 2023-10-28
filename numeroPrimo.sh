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


 
while : 
do
    # Limpar a tela
    clear

    # Exibir o cabeçalho
    echo '--------------------------------------'
    echo '    Verifica se um número é primo.    '
    echo '--------------------------------------'
    
    # Informar um número a ser testado
    echo -n ' Qual o número? (<q> para sair) :  '
    read  valor
    echo ' '

    # Verificar se foi informado algo diferente de números ou as letras 'q' ou 'Q'
    if [[ ! $valor =~ [0-9qQ] ]]; then
        echo ' - Valor inválido.' 
    else 
        # Informando 'q' ou 'Q', o programa será encerrado
        [[ $valor =~ (q|Q) ]] && { echo ' Saindo...'; sleep 1; echo ' '; exit 0; }

        primo=true
        
        # Verificar se o valor informado é maior que 1
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
        
        # Exibir mensagem informando se é primo ou não
        if [[ $primo == true ]]; then
            echo " - O número $valor é primo."
        else
            echo " - O número $valor não é primo."
        fi    
    fi
    
    # Exibir o rodapé
    echo ' '
    echo '--------------------------------------'
    echo 'Pressione <ENTER> para continuar'
    read
done

