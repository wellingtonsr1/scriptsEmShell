#!/usr/bin/env bash
# Criado por: Marcos Moreira
# https://www.vivaolinux.com.br/script/Instalacao-de-pacotes-em-uma-lista
# Email: marcosmoreirapro2077@gmail.com
# Data: 2018-12-21
# Licença: MIT
#
# Modificado por: Wellington
#====================================================================================================


# Verifica se as condições para executar o programa foram atendidas
#====================================================================================================#
if [ "$EUID" -ne 0 ]; then
  echo -e "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\e[1;33m Atenção!!! \e[0m=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
  echo "Por favor, Execute como root!"
  echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  exit
fi

if [ -z $1 ]; then
    echo -e "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\e[1;33m Atenção!!! \e[0m=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    echo "Sintaxe: $0 <arquivo>"
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    exit
fi
#=====================================================================================================#


# Atualiza os repositórios
#=====================================================================================================#
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo -e "\e[1;32mIniciando a atualização dos repositórios... \e[0m"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
apt-get update -y
if [ $? ]; then
	# Instala os pacotes da lista e destaca se a intsalção teve sucesso ou não
	#=====================================================================================================#
	while IFS= read -r PACOTE; do #Lê o arquivo linha por linha
		echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
		echo -e "\e[1;32mIniciando a instalação do pacote:.......... $PACOTE \e[0m"
		echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
		apt-get install $PACOTE -y
		if [ ! $? ]; then
			echo ""
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
			echo -e "\e[1;32mFalha na instalação do pacote:.......... $PACOTE \e[0m"
			echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
			echo ""
		fi
	done < $1
	
	apt-get install -f
else
    echo -e "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\e[1;33m Atenção!!! \e[0m-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"	
    echo -e "\e[1;31mA atualização falhou.\e[0m"
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
	exit
fi
#=====================================================================================================#
