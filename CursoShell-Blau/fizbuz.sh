#!/bin/bash -xv
#
# -----------------------------------------------------------------------------
# Enunciado
# -----------------------------------------------------------------------------
# Passada uma lista de números como argumentos, o script deve imprimir,
# para cada um deles:
# 
# - Se o número for divisível por 3: fiz
# - Se o número for divisível por 5: buz
# - Se for divisível por 3 e 5: fizbuz
# - Se não for divisível por 3 nem por 5: o próprio número


# Verificar se foram passados os argumentos
if [[ $# -eq 0 ]]; then
    echo 'Favor, informar a lista de números.'
    echo "  - Uso: $0 1 2 3...N ou"
    echo "         $0 {1...N}, Onde <N> é valor final da lista"
    exit 1
fi

# Percorrer a lista testando seus valores.
echo '-----------'
echo '   Saída   '
echo '-----------'
for i in $@; do       
    if [[ $((i % 3)) -eq 0 ]] && [[ $((i % 5)) -eq 0 ]]; then
        echo "$i : fizbuz"       
    elif [[ $((i % 3)) -eq 0 ]]; then
        echo "$i : fiz"    
    elif [[ $((i % 5)) -eq 0 ]]; then
        echo "$i : buz"
    else
        echo "$i : $i"
    fi
done

