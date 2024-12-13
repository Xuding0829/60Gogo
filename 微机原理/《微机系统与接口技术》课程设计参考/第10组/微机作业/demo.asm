;--------------------------主要实现-----------------------------;
;A-Z通过键盘输入  backspace回退  按下shift键并同时按下A-Z为小写 定时清屏
;--------------------------------------------------------------;



org 0x8400



num dw 0x00                 ;记录键盘中断次数
time dw 0x00
key_code db 0x1e,0x30,0x2e,0x20,0x12,0x21,0x22,0x23,0x17,0x24,0x25,0x26,0x32,0x31,0x18,0x19,0x10,0x13,0x1f,0x14,0x16,0x2f,0x11,0x2d,0x15,0x2c,0x0b,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x29,0x0c,0x0d,0x2b,0x0e,0x39,0x2a,0xaa
asc db      0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4a,0x4b,0x4c,0x4d,0x4e,0x4f,0x50,0x51,0x52,0x53,0x54,0x55,0x56,0x57,0x58,0x59,0x5a,0x30,0x31,0x32,0x33,0x34,0x35,0x36,0x37,0x38,0x39,0x60,0x2d,0x3d,0x5c,0x08,0x20,0x1f,0x1e
key_num db 44
i db 0x00
shif db 0x00
shifup db 0x00

jmp start

start:
    sti                                             ;开启中断
    mov ax, 0xb800                                  ;显示起地址
    mov es, ax 
    mov ax, 0
    mov ds, ax
    mov byte[ds:num], 0

    mov word [ds:0x24], key_scan                    ;键盘中断
    mov word [ds:0x26], 0

    mov word [ds:0x20], int_time0
    mov word [ds:0x22], 0

    mov bx, 0
    mov cl, 0x41

    jmp $


key_scan:
    push ax
    push bx
    push dx
    push ds
    mov ax, 0
    mov ds, ax
    mov dx, 0x60                            ;键盘控制器获得编码
    in al, dx
    mov [ds:8200h], al
    CALL key_cmp

    
    
    L3:
        mov dx, 0x20
        mov al, 0x61
        out dx, al

    pop ds
    pop dx
    pop bx
    pop ax
    iret




key_cmp:
    mov ax, 0
    mov ds, ax
    mov [ds:i], ax

    L1:
    mov al, [ds:8200h]
    mov si, [ds:i]
    mov bl, [ds:key_code+si]
    cmp al, bl
    je END


    inc si
    mov [ds:i], si
    mov al, [ds:i]
    mov bl, [ds:key_num]
    cmp al, bl
    je L2
    jne L1


    END:
        mov al, [ds:asc+si]
        cmp al, 0x08           ;按下了backspace
        jne L5    
        ;------------若按下了backspace--------------;
        dec byte[ds:num]
        dec byte[ds:num]
        mov al, 0x00
        mov bx, [ds:num]
        mov byte [es:bx], al
        inc word[ds:num]
        mov bx, [ds:num]
        mov byte [es:bx], 0x0e
        inc word[ds:num]
        dec word[ds:num]
        dec word[ds:num]
        jmp L2
        ;------------------------------------------;

        L5:
        cmp al, 0x1f;      按下了shift
        jne L6

        ;---------------若按下了shift---------------;
        mov al, 1
        mov byte[ds:8201h], al
        mov al, 0
        mov byte[ds:8202h], al
        jmp L2
        ;------------------------------------------;

        L6:
        cmp al, 0x1e;       抬起了shift
        jne L7
        ;------------抬起了shift--------------------;
        mov al, 0
        mov byte[ds:8201h], al
        mov al, 1
        mov byte[ds:8202h], al
        jmp L2
        ;------------------------------------------;

        L7:
        cmp al, 0x41
        jb L8     ;小于'A'
        cmp al, 0x5A;  
        ja L8     ;高于'A'
        mov bl, byte[ds:8201h]
        cmp bl, 1
        jne L8
        add al, 32


        L8:
        mov bx, [ds:num]
        mov byte[es:bx], al
        inc word[ds:num]
        mov bx, [ds:num]
        mov byte[es:bx], 0x0e
        inc word[ds:num]
    L2:
        ret






;------------------------;
;        定时清屏         ;
;------------------------;
int_time0:
    push ax
    mov ax, 0;
    mov ds, ax;
    inc word[ds:time]
    mov ax, [ds:time]
    cmp ax, 0xff
    jne OUT
    ;------达到清屏时间-------;
    mov word[ds:time], 0
    mov bx, 0
    mov word[ds:num], 0
    NEXT:
        mov byte[es:bx], 0x00
        inc bx
        mov byte[es:bx], 0x0e
        inc bx
        cmp bx, 4000
        jne NEXT
    ;------------------------;
    OUT:
        inc cl
        mov al, 0x20
        mov dx, 0x20
        out dx, al                                          ;中断结束
        pop ax
        iret