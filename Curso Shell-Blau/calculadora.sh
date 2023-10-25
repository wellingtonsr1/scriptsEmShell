#!/bin/bash


# Checar se foram informados os valores corretos
if [[ $# -ne 3 ]] || [[ ! "$2" =~ ('+'|'-'|'*'|'/') ]]; then  
    echo "----------------------------------------------------------"
    echo "                       Atenção!                           "
    echo "                                                          "
    echo " Informe os valores e operação que deseja realizar:       "
    echo " Uso: $0 <número1> <operador> <número2>                   "
    echo " Para multiplicação, usar \*                              "
    echo "----------------------------------------------------------"
    exit 1
else
    # Escolher qual operação processar e fazer os cãlculos
    case "$2" in
        +) 
            operacao='soma'; resultado=$(echo "$1 $2 $3" | bc)
        ;;
        
        -) 
            operacao='subtração'; resultado=$(echo "$1 $2 $3" | bc)
        ;;

        \*) 
            operacao='multiplicação'; resultado=$(echo "$1 $2 $3" | bc)
        ;;

        /) 
            if [[ $3 -ne 0 ]]; then
                operacao='divisão'; resultado=$(echo "scale=1; $1 $2 $3" | bc)
            else
                echo "Erro: Não é possível dividir por zero"; exit 1
            fi
        ;;
    esac
fi


# Exibir o resultado na tela
echo "--------------------------------------"
                # Exibir o nome da operação com a primeira letra em maiúsculo
echo "          $(echo $operacao | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')"
echo "--------------------------------------"
echo "                                      "
echo "O resultado da $operacao é $resultado "
echo "                                      "
echo "--------------------------------------"



