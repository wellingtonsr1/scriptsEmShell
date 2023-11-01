section .data
    msg db "Digite seu nome: ",0 ; Mensagem para o usuário

section .bss
    buffer resb 64 ; Buffer para armazenar o nome inserido pelo usuário


section .text
    global _start

_start:
    ; Escreve a mensagem para o usuário
    mov rdi, 1 ; Descritor de arquivo para STDOUT (saída padrão)
    mov rsi, msg ; Endereço da mensagem
    mov rdx, 17 ; Tamanho da mensagem
    mov rax, 1 ; Código da syscall para sys_write (escrever na tela)
    syscall

    ; Lê a entrada do usuário
    mov rdi, 0 ; Descritor de arquivo para STDIN (entrada padrão)
    mov rsi, buffer ; Endereço do buffer para armazenar a entrada do usuário
    mov rdx, 64 ; Tamanho máximo da entrada
    mov rax, 0 ; Código da syscall para sys_read (ler da entrada)
    syscall

    ; Escreve o nome na tela
    mov rdi, 1 ; Descritor de arquivo para STDOUT (saída padrão)
    mov rsi, buffer ; Endereço do buffer que contém o nome
    mov rdx, 64 ; Tamanho máximo da entrada
    mov rax, 1 ; Código da syscall para sys_write (escrever na tela)
    syscall

    ; Sai do programa
    mov rax, 60 ; Código da syscall para sys_exit
    xor rdi, rdi ; Código de status de saída 0
    syscall

