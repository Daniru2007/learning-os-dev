[org 0x7e00]

jmp EnterProtectedMode

jmp $

%include "gdt.asm"
%include "print.asm"

EnterProtectedMode:
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp CODE_SEG:StartProtectedMode

EnableA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret


[bits 32]
StartProtectedMode:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov al , 'R'
    mov ah, 0x0f
    mov [0xb8000], ax
    mov al , 'o'
    mov [0xb8002], ax
    mov al , 'w'
    mov [0xb8004], ax
    mov al , 'e'
    mov [0xb8006], ax
    mov al , 'r'
    mov [0xb8008], ax

    jmp $

times 2048-($-$$) db 0
