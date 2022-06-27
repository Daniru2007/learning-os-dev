PROGRAM_SPACE equ 0x7e00
BOOT_DISK: db 0 

Read_Disk:
    mov ah, 0x2
    mov bx, PROGRAM_SPACE
    mov al, 4
    mov dl, [BOOT_DISK]
    mov ch, 0
    mov dh, 0
    mov cl, 2

    int 0x13

    jc DiskReadFailed


    ret

DiskReadErrorString: db 'Disk Read Failed', 0

DiskReadFailed:
    mov bx, DiskReadErrorString
    call PrintString
    ret