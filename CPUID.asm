DetectCPUID:
    pushfd
    pop eax

    mov ecx, eax

    xor eax, 1 << 21

    push eax
    popfd

    pushfd
    pop eax

    popfd
    push ecx

    xor ecx, eax

    jz  NoCPUID
    ret


DetectLongMode:
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz NoLongMode
    ret

NoLongMode:
    hlt ; No Long Mode support

NoCPUID:
    hlt ; No CPUID support
