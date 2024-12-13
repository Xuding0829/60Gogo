org 0x8400

jmp start

y  dw 50

string   times 10 db 0

;********************************************************************

Fchar      db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0

Achar      db 0,0,0,0,1,1,1,0,0,0,0
           db 0,0,0,0,1,0,1,0,0,0,0
           db 0,0,0,1,1,0,1,1,0,0,0
           db 0,0,0,1,0,0,1,1,0,0,0
           db 0,0,1,1,0,0,0,1,1,0,0
           db 0,0,1,1,1,1,1,1,1,0,0
           db 0,1,1,0,0,0,0,0,1,1,0
           db 0,1,1,0,0,0,0,0,1,1,0
           db 1,1,1,0,0,0,0,0,0,1,1
           db 1,1,0,0,0,0,0,0,0,1,1

Kchar      db 1,1,0,0,0,1,1,1,0,0,0
           db 1,1,0,0,1,1,1,0,0,0,0
           db 1,1,0,1,1,0,0,0,0,0,0
           db 1,1,1,1,0,0,0,0,0,0,0
           db 1,1,1,0,0,0,0,0,0,0,0
           db 1,1,1,0,0,0,0,0,0,0,0
           db 1,1,0,1,1,0,0,0,0,0,0
           db 1,1,0,0,1,1,0,0,0,0,0
           db 1,1,0,0,0,1,1,1,0,0,0
           db 1,1,0,0,0,0,0,1,1,0,0


Echar      db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0


Rchar      db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,0,1,0
           db 1,1,0,0,0,0,0,0,0,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,0,0,0,0,0,0
           db 1,1,0,0,1,1,1,0,0,0,0
           db 1,1,0,0,0,1,1,1,1,0,0
           db 1,1,0,0,0,0,0,1,1,1,0

Wchar   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


;********************************************************************


start:
       
        sti
        mov     al,0x13
        mov    ah,0x00
        int      0x10

       mov ax,0x0a000
       mov es,ax

       mov   ax,0
       mov  ds,ax

;********************************************************************¿ò¼Ü

       call clor1
       call clor2 
       call clor3
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 50
       mov cx,150
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 50
       mov dx,320
       call sx1

      mov bx, 150       
      call sx1

       ;call lsh
       ;call bk

;********************************************************************Ê±¼äÖÐ¶Ï

mov dl,1
mov word [ds:0x20],int_time0
mov word [ds:0x22],0

;********************************************************************FEKER×ÖÑù
      
       mov word [ds:0x24],int_key
       mov word [ds:0x26],0
       mov si,0

y1:   cmp  byte[ds:string+si],0xB9
        jz y2

        jmp y1
y2:    call F
       call A
       call K
       call E
       call R
       jmp y1
       jmp $

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
        in al,dx
        mov  [ds:string+si],al
     

        mov dx,0x20
        mov al,0x61
        out dx,al
        
        
        pop ds
        pop dx
        pop bx
        pop ax
        iret
;********************************************************************Ê±¼äÖÐ¶Ï

int_time0:
       push ax
       push bx

       call W
    

      mov al,0x20
      mov dx,0x20
      out dx,al

pop bx
pop ax
iret

;********************************************************************F×Ö·û

F: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,24060

f0:   mov al,[ds:Fchar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz f1

      cmp cx,11
      jz f2  
 
f3:  cmp bx,110
      jb f0

pop si
pop cx
pop bx
      ret

f1:       mov dl,2
          mov [es:si],dl
          jmp f0

f2:       add si,309
          mov cx,0
          jmp f3

;********************************************************************A×Ö·û

A: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24076

a0:  mov al,[ds:Achar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz a1

      cmp cx,11
      jz a2  
 
a3:  cmp bx,110
      jb a0

pop si
pop cx
pop bx
     ret

a1:       mov dl,2
          mov [es:si],dl
          jmp a0

a2:       add si,309
          mov cx,0
          jmp a3
;********************************************************************K×Ö·û

K: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24092

k0:  mov al,[ds:Kchar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz k1

       cmp cx,11
       jz k2   

k3:  cmp bx,110
      jb k0

pop si
pop cx
pop bx
     ret

k1:       mov dl,2
          mov [es:si],dl
          jmp k0

k2:        add si,309
          mov cx,0
          jmp k3

;********************************************************************E×Ö·û

E: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24108

e0:  mov al,[ds:Echar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz e1

       cmp cx,11
       jz e2   

e3:  cmp bx,110
      jb e0

pop si
pop cx
pop bx
     ret

e1:       mov dl,2
          mov [es:si],dl
          jmp e0

e2:        add si,309
          mov cx,0
          jmp e3


;********************************************************************R×Ö·û

R: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24124

r0:  mov al,[ds:Rchar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz r1

       cmp cx,11
       jz r2   

r3:  cmp bx,110
      jb r0

pop si
pop cx
pop bx
     ret

r1:       mov dl,2
          mov [es:si],dl
          jmp r0

r2:       add si,309
          mov cx,0
          jmp r3

;********************************************************************W×Ö·û

W: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24224
      
w0:  mov al,[ds:Wchar+bx]
      inc bx
       inc si
      inc cx  
      cmp al,1
       jz w1
       cmp cx,17
      jz w2   
w3:  cmp bx,459
      jb w0
inc dl
pop si
pop cx
pop bx
     ret
 w1:    mov [es:si],dl
         
       ;   cmp dl,3
         ; ja w4 
          jmp w0
w2:     add si,303
          mov cx,0
          jmp w3
;w4: mov dl,1   
      ; jmp w0

;********************************************************************ºáÏß

hx1:  
push ax
push bx
push cx
push dx 
push si
       sub  cx,bx
       mul dx 
       add bx,ax
       mov dl,1
     x0:mov [es:bx],dl
    inc bx   
    dec cx
    cmp cx,0
    ja x0
pop si
pop dx
pop cx
pop bx
pop ax
    ret

;********************************************************************ÊúÏß

sx1: 
push ax
push bx
push cx
push dx
  
       mul dx 
       add bx,ax 
       mov dl,1
     y0:  mov [es:bx],dl
       add bx,320
       dec cx
       cmp cx,0
       ja y0
pop dx
pop cx
pop bx
pop ax
ret  

;********************************************************************ÑÕÉ«1

  clor1:     mov dx,0x3c8
             mov   al,1
             out dx,al
             mov dx,0x3c9
             mov   al,100
             out dx,al
             mov dx,0x3c9
             mov   al,0
             out dx,al
             mov dx,0x3c9
             mov   al,0
             out dx,al
ret

;********************************************************************ÑÕÉ«2

  clor2:     mov dx,0x3c8
             mov   al,2
             out dx,al
             mov dx,0x3c9
             mov   al,0
             out dx,al
             mov dx,0x3c9
             mov   al,100
             out dx,al
             mov dx,0x3c9
             mov   al,0
             out dx,al
ret

;********************************************************************ÑÕÉ«3

  clor3:     mov dx,0x3c8
             mov   al,3
             out dx,al
             mov dx,0x3c9
             mov   al,0
             out dx,al
             mov dx,0x3c9
             mov   al,0
             out dx,al
             mov dx,0x3c9
             mov   al,100
             out dx,al
ret
