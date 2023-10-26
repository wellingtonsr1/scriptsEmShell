#!/bin/bash
#----------------------------------------Variáveis--------------------------------------------------
VERSION="1"
AUTHOR="wellington"
TXTFILE="minhasSenhas.txt"
GPGFILE="minhasSenhas.txt.gpg"
ID="Wellington"
#---------------------------------------------------------------------------------------------------

# Limpar a tela
clear

# Exibir cabeçalho
echo "---------------------------------------------------------------------------"
echo "*                            GUI-gpg                                      *"       
echo "---------------------------------------------------------------------------"

# Informar o nome do serviço
read -p "Nome do serviço: " SERVICE

# Informar o login
read -p "Login: " LOGIN

# Informar a senha do serviço
read -p "Senha: " PASSWORD

# Criar um arquivo .zip de backup
#zip -q -r "$GPGFILE".BKP.zip "$GPGFILE"

# Verificar se o diretório bkp existe
[ ! -d "bkp" ] && mkdir bkp

# Verificar se o arquivo .zip existe
if [ -e "$GPGFILE".BKP.zip ]; then
    mv "$GPGFILE".BKP.zip bkp
else
    echo "Arquivo de backup não existe."
fi

# Descriptografar o arquivo .gpg gerando um .txt
gpg -d "$GPGFILE" > "$TXTFILE" 

# Inserir o cabeçalho, login e senha do serviço no arquivo.txt
(echo "---------------------------------------------------------------------------"
 echo "Login e Senha do "$SERVICE"                                                "
 echo "---------------------------------------------------------------------------"
 echo ""  
 echo "Login: "$LOGIN""
 echo "Senha: "$PASSWORD"") >> "$TXTFILE"


# Criptografar o arquivo .txt gerando um .gpg
gpg -r "$ID" -e "$TXTFILE"

# Apagar o .txt
rm -f "$TXTFILE"

#gpg -d "$GPGFILE"

# Exibir rodapé
echo -e "\n---------------------------------------------------------------------------"
echo "* Programa: $0    Versão: $VERSION                 Autor: $AUTHOR: *  "     
echo "---------------------------------------------------------------------------"






