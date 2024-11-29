#!/bin/bash

#----------------------------------------Variáveis--------------------------------------------------
VERSION="1.0"
AUTHOR="Wellington"
TXTFILE="minhasSenhas.txt"
GPGFILE="minhasSenhas.txt.gpg"
ID="Wellington"
BACKUP_DIR="bkp"
#---------------------------------------------------------------------------------------------------

# Função para exibir erros e sair
error_exit() {
    echo "Erro: $1" >&2
    exit 1
}

# Limpar a tela
clear

# Exibir cabeçalho
echo "---------------------------------------------------------------------------"
echo "*                            GUI-gpg                                      *"       
echo "---------------------------------------------------------------------------"

# Solicitar informações do usuário com validação
read -p "Nome do serviço: " SERVICE
[[ -z "$SERVICE" ]] && error_exit "O nome do serviço não pode estar vazio."

read -p "Login: " LOGIN
[[ -z "$LOGIN" ]] && error_exit "O login não pode estar vazio."

read -sp "Senha: " PASSWORD
echo
[[ -z "$PASSWORD" ]] && error_exit "A senha não pode estar vazia."

# Criar diretório de backup, se necessário
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -m 700 "$BACKUP_DIR" || error_exit "Não foi possível criar o diretório de backup."
fi

# Fazer backup do arquivo criptografado existente
if [ -f "$GPGFILE" ]; then
    BACKUP_FILE="${BACKUP_DIR}/${GPGFILE}.BKP.$(date +%Y%m%d%H%M%S).zip"
    zip -q -r "$BACKUP_FILE" "$GPGFILE" || error_exit "Falha ao criar o backup."
    echo "Backup criado em: $BACKUP_FILE"
else
    echo "Arquivo de senha original não encontrado. Será criado um novo."
fi

# Descriptografar o arquivo .gpg, se existir
if [ -f "$GPGFILE" ]; then
    gpg --quiet --decrypt "$GPGFILE" > "$TXTFILE" 2>/dev/null || error_exit "Falha ao descriptografar $GPGFILE."
    echo "Arquivo descriptografado com sucesso."
else
    echo "Criando novo arquivo de senhas."
    touch "$TXTFILE" || error_exit "Não foi possível criar $TXTFILE."
fi

# Inserir informações no arquivo texto
{
    echo "---------------------------------------------------------------------------"
    echo "Login e Senha do serviço: $SERVICE"
    echo "---------------------------------------------------------------------------"
    echo ""
    echo "Login: $LOGIN"
    echo "Senha: $PASSWORD"
    echo ""
} >> "$TXTFILE" || error_exit "Falha ao escrever no arquivo $TXTFILE."

# Criptografar o arquivo .txt
gpg --quiet --encrypt --recipient "$ID" "$TXTFILE" || error_exit "Falha ao criptografar $TXTFILE."

# Remover o arquivo texto não criptografado
shred -u "$TXTFILE" || error_exit "Falha ao apagar $TXTFILE."

# Exibir rodapé
echo -e "\n---------------------------------------------------------------------------"
echo "* Programa: $0    Versão: $VERSION                 Autor: $AUTHOR *"     
echo "---------------------------------------------------------------------------"

exit 0

