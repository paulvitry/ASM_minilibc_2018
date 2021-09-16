section .text
    global strcasecmp


strcasecmp:
    push rbp
    mov rbp, rsp
    
start_strcasecmp:
    mov al, [rdi]
    sub al, [rsi]
    cmp al, 0
    jl lower
    jg greater
    cmp byte[rdi], 0
    je equal
    add rdi, 1
    add rsi, 1
    jmp start_strcasecmp

next:
    add rsi, 1
    add rdi, 1
    jmp start_strcasecmp

lower:
    cmp al, -32
    je next
    mov rax, -1
    leave
    ret
    
greater:
    cmp al, 32
    je next
    mov rax, 1
    leave
    ret

equal:
    mov rax, 0
    leave
    ret


; strcasecmp:
;     push rbp
;     mov rbp, rsp
    
; start_strcasecmp:
;     mov al, [rdi]
;     sub al, [rsi]
;     cmp al, 0
;     jne not_equal
;     cmp byte[rdi], 0
;     je equal
;     add rdi, 1
;     add rsi, 1
;     jmp start_strcasecmp

; not_equal:
;     cmp al, 32
;     jne continue
;     cmp al, -32
;     jne continue
;     cmp al, 0
;     jl lower
;     jg greater

; continue:
;     add rdi, 1
;     add rsi, 1
;     jmp start_strcasecmp

; lower:
;     mov rax, -1
;     leave
;     ret
    
; greater:
;     mov rax, 1
;     leave
;     ret

; equal:
;     mov rax, 0
;     leave
;     ret
    
