section .text
    global strcspn

strcspn:
    push rbp
    mov rbp, rsp

    mov rcx, 0
    mov rax, 0
    mov rdx, rsi
    start_strcspn:
    cmp byte[rdi], 0
    je not_in
    
    start_rsi:
    cmp byte[rsi], 0
    je change_char
    mov al, [rdi]
    sub al, [rsi]
    cmp al, 0
    je end_strcspn
    add rsi, 1
    jmp start_rsi

    change_char:
    mov rsi, rdx
    add rdi, 1
    add rcx, 1
    jmp start_strcspn

    end_strcspn:
    mov rax, rcx
    leave
    ret

    not_in:
    mov rax, 0
    leave
    ret
