section .text
    global memcpy


memcpy:
    push rbp,
    mov rbp, rsp

    mov al, 0
    start_memcpy:

    cmp byte[rdi], 0
    je rax_memcpy
    cmp al, dl
    je rax_memcpy
    cmp byte[rsi], 0
    je rax_memcpy

    mov rdi, rsi
    add rdi, 1
    add rsi, 1
    add rax, 1

    jmp start_memcpy

    rax_memcpy:
    cmp al, 0
    je end_memcpy
    sub al, 1
    jmp rax_memcpy

    end_memcpy:
    mov rax, rdi
    leave
    ret