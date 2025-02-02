#!/bin/bash

DADOS_FILE="dados.txt"

echo "Escolha uma opção:"
echo "1 - Adicionar um serviço"
echo "2 - Recuperar credenciais"
echo "3 - Alterar credenciais"
read -p "Opção: " opcao

case $opcao in
    1)
        read -p "Serviço: " servico
        read -p "Login: " login
        read -s -p "Senha: " senha
        echo ""
        echo "$servico;$login;$senha" >> "$DADOS_FILE"
        echo "Dados adicionados com sucesso."
        ;;
    2)
        read -p "Informe o serviço: " servico
        grep "^$servico;" "$DADOS_FILE" | while IFS=';' read -r srv log sen; do
            echo "Login: $log, Senha: $sen"
        done
        ;;
    3)
        read -p "Informe o serviço a ser alterado: " servico
        if grep -q "^$servico;" "$DADOS_FILE"; then
            linha_atual=$(grep "^$servico;" "$DADOS_FILE")
            IFS=';' read -r srv_atual log_atual sen_atual <<< "$linha_atual"
            
            read -p "Novo login (pressione Enter para manter atual: $log_atual): " novo_login
            read -s -p "Nova senha (pressione Enter para manter atual): " nova_senha
            echo ""
            
            novo_login=${novo_login:-$log_atual}
            nova_senha=${nova_senha:-$sen_atual}
            
            sed -i "s/^$servico;.*$/$servico;$novo_login;$nova_senha/" "$DADOS_FILE"
            echo "Dados alterados com sucesso."
        else
            echo "Serviço não encontrado."
        fi
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

