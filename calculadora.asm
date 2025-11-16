; calculadora.asm
extern printf

section .data 
    number1 dq 128
    number2 dq 19
    neg_number dq -12
    
    fmt db "os numeros são %ld e %ld",10,0
    fmtint db "%s %ld",10,0
    sumi db "a soma é ",0
    difi db "a diferença é ",0
    inci db "o numero 1 foi incrementado: ",0
    deci db "o numero 1 foi decrementado: ",0
    sali db "numero 1 deslocado à esquerda (x4): ",0
    sari db "numero 1 deslocado à direita (/4): ",0
    sariex db "numero negativo deslocado à direita com extensão de sinal: ",0
    multi db "o produto é: ",0
    divi db "o quociente é: ",0
    remi db "o resto é: ",0

section .bss
    resulti resq 1
    modulo resq 1
    
section .text
global main
main:
    push rbp
    mov rbp, rsp
    
    ; display dos números
    mov rdi, fmt
    mov rsi, [number1]
    mov rdx, [number2]
    mov rax, 0
    call printf
    
    ; soma
    mov rax, [number1]
    add rax, [number2]
    mov [resulti], rax
    
    ; exibe soma
    mov rdi, fmtint
    mov rsi, sumi
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; subtração
    mov rax, [number1]
    sub rax, [number2]
    mov [resulti], rax
    
    ; exibe subtração
    mov rdi, fmtint
    mov rsi, difi
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; incremente número 1
    mov rax, [number1]
    inc rax
    mov [resulti], rax
    
    ; exibe incremento
    mov rdi, fmtint
    mov rsi, inci
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; decremento
    mov rax, [number1]
    dec rax
    mov [resulti], rax
    
    ; exibe decremento
    mov rdi, fmtint
    mov rsi, deci
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; deslocar para esquerda ( *4 )
    mov rax, [number1]
    sal rax, 2
    mov [resulti], rax
    
    ; exibe
    mov rdi, fmtint
    mov rsi, sali
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; deslocar para direita ( /4 )
    mov rax, [number1]
    sar rax, 2
    mov [resulti], rax
    
    ; exibe
    mov rdi, fmtint
    mov rsi, sari
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; deslocar negativo com extensão de sinal
    mov rax, [neg_number]
    sar rax, 2
    mov [resulti], rax
    
    ; exibe
    mov rdi, fmtint
    mov rsi, sariex
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; multiplicação
    mov rax, [number1]
    imul qword [number2]
    mov [resulti], rax
    
    ; exibe
    mov rdi, fmtint
    mov rsi, multi
    mov rdx, [resulti]
    mov rax, 0
    call printf
    
    ; divisão
    mov rax, [number1]
    mov rdx, 0
    idiv qword [number2]
    mov [resulti], rax
    mov [modulo], rdx
    
    ; exibe quociente
    mov rdi, fmtint
    mov rsi, divi
    mov rdx, [resulti]
    mov rax, 0
    call printf

    ; exibe resto
    mov rdi, fmtint
    mov rsi, remi
    mov rdx, [modulo]
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp
    ret
