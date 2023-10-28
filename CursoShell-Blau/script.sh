#!/usr/bin/env bash

IFS=$'\n'

#echo 'Sem aspas: ' # Ambos têm o mesmo efeito
#echo '-----------------------------'
#echo 'Lista de argumentos ($@): ' $@
#echo 'Lista de argumentos ($*): ' $*
#echo 'Quantidade de palavras: ' $#
#echo ''
#
#echo 'Com aspas'
#echo '-----------------------------'
#echo 'Lista de argumentos ("$@"): ' "$@"
#echo 'Lista de argumentos ("$*"): ' "$*"
#echo 'Quantidade de palavras: ' $#

# Usando o $@
# Com aspas
# Exibe uma palavra em cada linha, mas 'fruta pão' é vista como uma palavra.

# Sem aspas
# Exibe uma palavra em cada linha, mas 'fruta pão' é vista como 2 palavras.
 

# Usando o $*
# Sem aspas,
# Exibe cada palavra em uma linha, mas 'fruta pão', por exemplo, 'vista como 2 palavras.

# Com aspas
# Exibe todoas as palavras em uma linha

for i in $@; do
    echo $i
done
