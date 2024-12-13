org 0x8400

jmp start

y  dw 50

string   times 10 db 0

;********************************************************************

Bchar      db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,0,0,0,0,0,0,1,0,0
           db 1,1,0,0,0,0,0,0,1,0,0
           db 1,1,1,1,1,1,1,1,0,0,0
           db 1,1,1,1,1,1,1,1,0,0,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0

Ochar      db 0,0,1,1,1,1,1,1,0,0,0
           db 0,1,1,1,1,1,1,1,1,0,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 0,1,1,1,1,1,1,1,1,0,0
           db 0,0,1,1,1,1,1,1,0,0,0

Cchar      db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0


Hchar      db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0


Schar      db 1,1,1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0,0,0
           db 1,1,1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,1,1,0
           db 0,0,0,0,0,0,0,0,0,0,1,1,0
           db 0,0,0,0,0,0,0,0,0,0,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,1,1,0


Wchar  	     db 1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0
	     db 0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0
             db 0,0,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0
             db 0,0,0,1,1,1,1,0,0,0,1,0,0,0,0,0,0
             db 0,0,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0
             db 0,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0
             db 1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0
             db 1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0
             db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0
             db 1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
             db 1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
             db 1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
             db 1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
             db 0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
             db 0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0
             db 0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0
             db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0


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

;********************************************************************BOCHS×ÖÑù
      
       mov word [ds:0x24],int_key
       mov word [ds:0x26],0
       mov si,0

y1:   cmp  byte[ds:string+si],0x9e
        jz y2

        jmp y1
y2:    call B
       call O
       call C
       call H
       call S
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

;********************************************************************B×Ö·û

B: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,24060

b0:   mov al,[ds:Bchar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz b1

      cmp cx,11
      jz b2  
 
b3:  cmp bx,110
      jb b0

pop si
pop cx
pop bx
      ret

b1:       mov dl,2
          mov [es:si],dl
          jmp b0

b2:       add si,309
          mov cx,0
          jmp b3

;********************************************************************O×Ö·û

O: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24076

o0:  mov al,[ds:Ochar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz o1

      cmp cx,11
      jz o2  
 
o3:  cmp bx,110
      jb o0

pop si
pop cx
pop bx
     ret

o1:       mov dl,2
          mov [es:si],dl
          jmp o0

o2:       add si,309
          mov cx,0
          jmp o3
;********************************************************************C×Ö·û

C: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24092

c0:  mov al,[ds:Cchar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz c1

       cmp cx,11
       jz c2   

c3:  cmp bx,110
      jb c0

pop si
pop cx
pop bx
     ret

c1:       mov dl,2
          mov [es:si],dl
          jmp c0

c2:        add si,309
          mov cx,0
          jmp c3

;********************************************************************H×Ö·û

H: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24108

h0:  mov al,[ds:Hchar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz h1

       cmp cx,11
       jz h2   

h3:  cmp bx,110
      jb h0

pop si
pop cx
pop bx
     ret

h1:       mov dl,2
          mov [es:si],dl
          jmp h0

h2:        add si,309
          mov cx,0
          jmp h3


;********************************************************************S×Ö·û

S: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,24124

s0:  mov al,[ds:Schar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz s1

       cmp cx,13
       jz s2   

s3:  cmp bx,130
      jb s0

pop si
pop cx
pop bx
     ret

s1:       mov dl,2
          mov [es:si],dl
          jmp s0

s2:       add si,307
          mov cx,0
          jmp s3

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
             mov   al,20
             out dx,al
             mov dx,0x3c9
             mov   al,40
             out dx,al
             mov dx,0x3c9
             mov   al,60
             out dx,al
ret

;********************************************************************ÑÕÉ«2

  clor2:     mov dx,0x3c8
             mov   al,2
             out dx,al
             mov dx,0x3c9
             mov   al,80
             out dx,al
             mov dx,0x3c9
             mov   al,100
             out dx,al
             mov dx,0x3c9
             mov   al,120
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
             mov   al,50
             out dx,al
             mov dx,0x3c9
             mov   al,100
             out dx,al
ret
