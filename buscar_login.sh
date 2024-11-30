#!/bin/bash

# Caminho para o arquivo contendo os dados
ARQUIVO_DADOS="dados.txt"

# Verifica se o arquivo existe
if [[ ! -f "$ARQUIVO_DADOS" ]]; then
    echo "Arquivo '$ARQUIVO_DADOS' não encontrado. Por favor, crie o arquivo com os dados no formato 'serviço|login|senha'."
    exit 1
fi

# Solicita ao usuário o nome do serviço
read -p "Informe o nome do serviço: " SERVICO

# Busca as informações do serviço no arquivo
RESULTADO=$(grep -i "^$SERVICO|" "$ARQUIVO_DADOS")

# Verifica se o serviço foi encontrado
if [[ -n "$RESULTADO" ]]; then
    # Extrai os campos do resultado
    LOGIN=$(echo "$RESULTADO" | cut -d'|' -f2)
    SENHA=$(echo "$RESULTADO" | cut -d'|' -f3)
    echo "Serviço: $SERVICO"
    echo "Login: $LOGIN"
    echo "Senha: $SENHA"
else
    echo "Serviço '$SERVICO' não encontrado no arquivo '$ARQUIVO_DADOS'."
fi

