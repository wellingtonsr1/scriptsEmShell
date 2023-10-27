section .data
    nome db 'Wellington', 0xa ; 0xa é o caractere de nova linha (line feed)
    len equ $ - nome ; Calcula o comprimento da string

section .text
    global _start

_start:
    ; Chama o sistema para escrever a string na saída padrão (stdout)
    mov rdi, 1         ; Descritor de arquivo: stdout (1)
    mov rax, 1         ; Número da chamada ao sistema: sys_write
    mov rsi, nome      ; Endereço da string a ser escrita
    mov rdx, len       ; Comprimento da string
    syscall            ; Chama a interrupção do sistema

    ; Termina o programa
    mov rax, 60        ; Número da chamada ao sistema: sys_exit
    xor rdi, rdi       ; Código de saída: 0
    syscall            ; Chama a interrupção do sistema

