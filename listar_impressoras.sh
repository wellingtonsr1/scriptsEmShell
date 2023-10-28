#!/bin/bash

# Obtém a lista de impressoras de rede
impressoras=$(lpstat -a | awk '{print $1}')

# Itera sobre a lista de impressoras e imprime seus nomes
for impressora in $impressoras; do
    echo "Impressora de rede encontrada: $impressora"
done

