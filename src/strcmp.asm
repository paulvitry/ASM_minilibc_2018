section .text
    global strcmp



strcmp:
    push rbp
    mov rbp, rsp
    
start_strcmp:
    mov al, [rdi]
    sub al, [rsi]
    cmp al, 0
    jl lower
    jg greater
    cmp byte[rdi], 0
    je equal
    add rdi, 1
    add rsi, 1
    jmp start_strcmp

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











; strcmp:
;     push rbp
;     mov rbp, rsp

;     mov rax, 0
;     start_strcmp:
;     cmp rdi, rsi
;     jne not_equal
;     cmp byte[rdi], 0
;     je equal

;     add rdi, 1
;     add rsi, 1
;     jmp start_strcmp

;     not_equal:
;     cmp dil, sil
;     jl return_neg
;     cmp rdi, rsi
;     jg return_pos
    
;     return_neg:
;     mov rax, -8
;     leave
;     ret

;     return_pos:
;     mov rax, 9
;     leave
;     ret

;     equal:
;     leave
;     ret




    
