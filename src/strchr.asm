section .text
    global strchr


strchr:
    push rbp
    mov rbp, rsp

    mov rax, 0
    start_strchr:
    cmp byte[rdi], 0
    je return_null
    cmp byte[rdi], sil
    je end_strchr
    add rdi, 1
    jmp start_strchr

    return_null:
    mov rax, 0
    leave
    ret

    end_strchr:
    mov rax, rdi
    leave
    ret
