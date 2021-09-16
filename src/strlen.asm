section .text
    global strlen

strlen:
    push rbp
    mov rbp, rsp

    mov rax, 0
    start_strlen:
    cmp byte[rdi], 0
    je end_strlen
    add rax, 1
    add rdi, 1
    jmp start_strlen

    end_strlen:
    leave
    ret
