
PrintString:
    mov ah, 0x0e
    .loop:
        cmp [bx], byte 0
        je .exit
        mov al, [bx]
        int 0x10
        inc bx
        jmp .loop
    .exit:
        mov al, 0x0d
        int 0x10

        mov al, 0x0a
        int 0x10
    ret
