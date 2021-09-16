section .text
    global strncmp

strncmp:
    push rbp
    mov rbp, rsp

start_strncmp:
    cmp rdx, 0
    je equal
    mov al, [rdi]
    sub al, [rsi]
    cmp al, 0
    jl lower
    jg greater
    cmp byte[rdi], 0
    je equal
    sub rdx, 1
    add rdi, 1
    add rsi, 1
    jmp start_strncmp

lower:
    mov rax, -1
    leave
    ret
    
greater:
    mov rax, 1
    leave
    ret

equal:
    mov rax, 0
    leave
    ret
    