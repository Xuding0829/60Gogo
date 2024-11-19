   org 0x8400

   jmp start

   y  dw 50

string   times 10 db 0
;********************************************************************98

z9char     db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,0,0,0,1,0,0,0
           db 0,0,0,1,0,0,0,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,0,0,0,0,1,0,0,0
           db 0,0,0,0,0,0,0,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0

z8char     db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,0,0,0,1,0,0,0
           db 0,0,0,1,0,0,0,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,0,0,0,1,0,0,0
           db 0,0,0,1,0,0,0,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0
           db 0,0,0,1,1,1,1,1,0,0,0

;********************************************************************


start:
       
       sti
       mov  al,0x13
       mov  ah,0x00
       int  0x10

       mov  ax,0x0a000
       mov  es,ax

       mov  ax,0
       mov  ds,ax

       call clor1
       call clor2 
       
       


;********************************************************************98Í¼ÐÎ
      
       mov  word [ds:0x24],int_key
       mov  word [ds:0x26],0
       mov  si,0

y1:    cmp  byte[ds:string+si],0x9e
       jz   y2
       jmp  y1
y2:    call z9
       call z8
       jmp  y1
       jmp  $

;********************************************************************¼üÅÌÖÐ¶Ï

int_key:
        push ax
        push bx
        push dx
        push ds
        

        mov ax,0
        mov ds,ax
        mov si,0

        mov dx,0x60
        in  al,dx
        mov [ds:string+si],al
     

        mov dx,0x20
        mov al,0x61
        out dx,al
        
        
        pop ds
        pop dx
        pop bx
        pop ax
        iret



;********************************************************************9×Ö·û

z9: 
push bx 
push cx
push si 
      
        mov bx ,0 
        mov cx,0
        mov si ,24060

z90:    mov al,[ds:z9char+bx]
        inc bx
        inc si
        inc cx  
        cmp al,1
        jz  z91

        cmp cx,11
        jz  z92  
 
z93:    cmp bx,110
        jb  z90

pop si
pop cx
pop bx
        ret

z91:    mov dl,2
        mov [es:si],dl
        jmp z90

z92:    add si,309
        mov cx,0
        jmp z93

;********************************************************************8×Ö·û

z8: 
push bx 
push cx
push si 
      
        mov bx ,0 
        mov cx,0
        mov si ,24076

z80:    mov al,[ds:z8char+bx]
        inc bx
        inc si
        inc cx  
        cmp al,1
        jz  z81

        cmp cx,11
        jz  z82  
 
z83:    cmp bx,110
        jb  z80

pop si
pop cx
pop bx
        ret

z81:    mov dl,2
        mov [es:si],dl
        jmp z80

z82:    add si,309
        mov cx,0
        jmp z83

;********************************************************************ÑÕÉ«1

clor1:       mov dx,0x3c8
             mov al,1
             out dx,al
             mov dx,0x3c9
             mov al,100
             out dx,al
             mov dx,0x3c9
             mov al,100
             out dx,al
             mov dx,0x3c9
             mov al,100
             out dx,al
ret

;********************************************************************ÑÕÉ«2

clor2:       mov dx,0x3c8
             mov al,2
             out dx,al
             mov dx,0x3c9
             mov al,50
             out dx,al
             mov dx,0x3c9
             mov al,50
             out dx,al
             mov dx,0x3c9
             mov al,50
             out dx,al
ret