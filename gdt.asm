gdt_start:
gdt_nulldesc:
    dd 0x0
    dd 0x0

gdt_codedesc:
    dw 0xffff ; 16 bits of the limit

    dw 0x0 ; 16 bits of the base
    db 0x0 ; 8 bits of the base 8 + 16 = 24

    db 0b10011010
    db 0b11001111 ; 4 bits of the limit

    db 0x00

gdt_datadesc:
    dw 0xffff ; 16 bits of the limit

    dw 0x0 ; 16 bits of the base
    db 0x0 ; 8 bits of the base 8 + 16 = 24

    db 0b10010010
    db 0b11001111 ; 4 bits of the limit

    db 0x00
gdt_end:

gdt_descriptor:
    gdt_size:
        dw gdt_end - gdt_start -1
        dd gdt_nulldesc

CODE_SEG equ gdt_codedesc - gdt_start
DATA_SEG equ gdt_datadesc - gdt_start
