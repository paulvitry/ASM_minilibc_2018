section .text
    global memset


memset:
    push rbp
    mov rbp, rsp

    mov rax, rdi
    start_memset:
        cmp byte[rdi], 0
        je end_memset
        cmp rdx, 0
        je end_memset
        mov byte[rdi], sil
        add rdi, 1
        sub rdx, 1
        jmp start_memset

    end_memset:
    leave
    ret
