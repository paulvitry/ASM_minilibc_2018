section .text
    global memmove

memmove:
    push rbp
    mov rbp, rsp

    mov rax, rdi
    start_memmove:
    cmp dl, 0
    je end_memmove
    cmp byte[rsi], 0
    je end_memmove
    mov rdi, rsi
    add rsi, 1
    add rdi, 1
    jmp start_memmove

    end_memmove:
    
    leave
    ret