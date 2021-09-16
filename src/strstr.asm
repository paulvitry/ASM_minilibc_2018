section .text
    global strstr

strstr:
    push rbp
    mov rbp, rsp

    mov rcx, rsi
    mov r8, rdi
    start_strstr:
    cmp byte[rsi], 0
    je replace
    add rsi, 1
    add rdx, 1
    jmp start_strstr
    replace:
    mov rsi, rcx
    jmp start_strncmp
    not_this_one:
    mov rsi, rcx
    add r8, 1
    cmp byte[r8], 0
    je end
    mov rdi, r8
    jmp start_strstr


start_strncmp:
    cmp rdx, 0
    je equal
    mov al, [rdi]
    sub al, [rsi]
    cmp al, 0
    jne not_this_one
    cmp byte[rdi], 0
    je equal
    sub rdx, 1
    add rdi, 1
    add rsi, 1
    jmp start_strncmp

equal:
    mov rax, r8
    leave
    ret
    

end:
    mov rax, 0
    leave
    ret