nasm bootloader.asm -f bin -o bootloader.bin && nasm extended.asm -f bin -o extended.bin && copy bootloader.bin+extended.bin bootloader.flp  && start bochsrc.bxrc
