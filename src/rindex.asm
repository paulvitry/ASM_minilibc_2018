section .text
    global rindex

rindex:
    push rbp
    mov rbp, rsp

    mov rax, 0
    start_rindex:
    cmp byte[rdi], 0
    je end_rindex
    cmp byte[rdi], sil
    je addrax
    add rdi, 1
    jmp start_rindex

    end_rindex:
    leave
    ret




    addrax:
    mov rax, rdi
    add rdi, 1
    jmp start_rindex




