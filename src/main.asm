org 0x7C00
bits 16
%define ENDL 0x0D, 0x0A
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

msg_hello: db "          uuUUUUUUUUuu",13,10,"     uuUUUUUUUUUUUUUUUUUuu",13,10,"    uUUUUUUUUUUUUUUUUUUUUUu",13,10,"  uUUUUUUUUUUUUUUUUUUUUUUUUUu",13,10,"  uUUUUUUUUUUUUUUUUUUUUUUUUUu",13,10,"  uUUUU       UUU       UUUUu",13,10, "   UUU        uUu        UUU",13,10,"   UUUu      uUUUu     uUUU",13,10,"    UUUUuuUUU     UUUuuUUUU",13,10, "     UUUUUUU       UUUUUUU",13,10, "       uUUUUUUUuUUUUUUUu",13,10,"           uUUUUUUUu",13,10,"         UUUUUuUuUuUUU",13,10,"           UUUUUUUUU",13,10,13,10,"            BruteOS", ENDL,0
times 510-($-$$) db 0
dw 0AA55h