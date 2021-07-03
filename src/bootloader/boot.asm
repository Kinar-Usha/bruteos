org 0x7C00
bits 16
%define ENDL 0x0D, 0x0A
jmp short start
nop
bdb_oem db 'MSWIN4.1'
bdb_bytes_per_sector:   dw 512
bdb_sectors_per_cluster:    db 1
bdb_reserved_sectors:   dw 1

start:
    jmp main
puts:
    push si
    push ax

.loop:
    lodsb
    or al,al
    jz .done
    

    mov ah, 0x0e
    mov bh,0
    int 0x10
    jmp .loop

.done:
    pop ax
    pop si
    ret
main:
    mov ax,0
    mov ds, ax
    mov es,ax

    mov ss,ax
    mov sp, 0x7C00
    mov si, msg_hello
    call puts

    hlt

.halt
    jmp .halt

msg_hello: db 'Hello world!', ENDL,0
times 510-($-$$) db 0
dw 0AA55h