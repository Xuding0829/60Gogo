org 0x8400

jmp start


; 过渡变量 声音
nowUseHz dw 600
; hz 转化后的值保存
nowUseHzTurned dw 0

index db 0 ; 表示当前的标记数
dflag db 0 ; 0 小写 ， 1 大写

table	dw	262			;k1 发 do	的音，261.6HZ
		dw  294			;k2 发 re	的音，293.6HZ
		dw  330			;k3 发 mi	的音，329.6HZ
		dw  349			;k4 发 fa	的音，349.2HZ
		dw  392			;k5 发 sol	的音，392HZ
		dw  440			;k6 发 la	的音，440HZ
		dw  494			;k7 发 si	的音，493.8HZ

;图形


y  dw 50

string   times 10 db 0

;********************************************************************

Pchar      db 1,1,1,1,1,1,1,1,0,0,0
           db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,0,0,0,1,1,1,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,0,0
           db 1,1,1,1,1,1,1,1,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0
           db 1,1,0,0,0,0,0,0,0,0,0

Ichar      db 1,1,1,1,1,1,1,1,1,1,0
           db 0,1,1,1,1,1,1,1,1,1,0
           db 0,0,0,0,1,1,1,0,0,0,0
           db 0,0,0,0,1,1,1,0,0,0,0
           db 0,0,0,0,1,1,1,0,0,0,0
           db 0,0,0,0,1,1,1,0,0,0,0
           db 0,0,0,0,1,1,1,0,0,0,0
           db 0,0,0,0,1,1,1,0,0,0,0
           db 0,1,1,1,1,1,1,1,1,1,0
           db 1,1,1,1,1,1,1,1,1,1,0

Achar      db 0,0,0,0,1,1,0,0,0,0,0
           db 0,0,0,1,1,1,1,0,0,0,0
           db 0,0,1,1,0,0,1,1,0,0,0
           db 0,0,1,1,0,0,1,1,0,0,0
           db 0,1,1,0,0,0,0,1,1,0,0
           db 0,1,1,1,1,1,1,1,1,0,0
           db 0,1,1,1,1,1,1,1,1,0,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0


Nchar      db 1,1,0,0,0,0,0,0,1,1,0
           db 1,1,1,0,0,0,0,0,1,1,0
           db 1,1,1,1,0,0,0,0,1,1,0
           db 1,1,1,1,1,0,0,0,1,1,0
           db 1,1,0,1,1,1,0,0,1,1,0
           db 1,1,0,0,1,1,1,0,1,1,0
           db 1,1,0,0,0,1,1,1,1,1,0
           db 1,1,0,0,0,0,1,1,1,1,0
           db 1,1,0,0,0,0,0,1,1,1,0
           db 1,1,0,0,0,0,0,0,1,1,0


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


Wchar        db 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0
             db 0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0
             db 0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0
             db 0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0
             db 0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0
	       db 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0
             db 0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0
             db 0,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0
             db 1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,0
             db 1,1,0,0,0,1,1,1,1,1,0,0,0,0,1,1,0
             db 1,1,0,0,1,1,1,0,1,1,0,0,0,0,0,1,0
             db 1,1,0,0,1,1,0,0,0,1,1,0,0,0,0,1,0
             db 1,1,0,0,1,1,0,0,0,0,1,1,0,0,1,1,0
             db 0,1,1,0,0,1,1,0,0,0,1,1,0,0,1,1,0
             db 0,1,1,0,0,0,0,0,0,0,1,1,1,1,1,0,0
             db 0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0
             db 0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
             db 0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0
             db 0,0,0,0,0,1,1,1,1,0,0,0,1,1,0,0,0
             db 0,0,0,0,1,1,1,1,1,1,0,0,1,1,0,0,0
             db 0,0,0,0,1,1,1,1,1,1,0,0,1,1,0,0,0
             db 0,0,0,1,1,1,1,1,1,1,0,0,1,1,0,0,0
             db 0,0,0,0,1,1,1,1,1,0,1,1,1,0,0,0,0
             db 0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0

Onechar      db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,1,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,1,1,1,1,1,1,1,1,0,0

Twochar      db 0,0,0,1,1,1,1,0,0,0,0
  	       db 0,0,1,1,0,0,1,1,0,0,0
 	       db 0,1,1,0,0,0,0,1,1,0,0
 	       db 0,1,0,0,0,0,0,1,1,1,0
  	       db 0,0,0,0,0,0,1,1,1,0,0
 	       db 0,0,0,0,0,1,1,1,0,0,0
 	       db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,1,1,1,0,0,0,0,0,0
             db 0,1,1,1,1,1,1,1,1,0,0
             db 1,1,1,1,1,1,1,1,1,1,0

Threechar    db 0,0,1,1,1,1,1,0,0,0,0
  	       db 0,1,1,1,0,0,1,1,1,0,0
 	       db 1,1,0,0,0,0,0,0,1,1,0
 	       db 0,1,0,0,0,0,0,0,1,1,0
  	       db 0,0,0,0,0,0,0,1,1,0,0
 	       db 0,0,0,0,0,0,0,1,1,0,0
 	       db 0,1,0,0,0,0,0,0,1,1,0
             db 1,1,0,0,0,0,0,0,1,1,0
             db 0,1,1,1,0,0,1,1,1,0,0
             db 0,0,1,1,1,1,1,1,0,0,0

Fourchar     db 0,0,0,0,0,1,1,0,0,0,0
  	       db 0,0,0,1,1,1,1,0,0,0,0
 	       db 0,0,1,1,0,1,1,0,0,0,0
 	       db 0,1,1,0,0,1,1,0,0,0,0
  	       db 1,1,0,0,0,1,1,0,0,0,0
 	       db 1,1,1,1,1,1,1,1,1,1,0
 	       db 1,1,1,1,1,1,1,1,1,1,0
             db 0,0,0,0,0,1,1,0,0,0,0
             db 0,0,0,0,0,1,1,0,0,0,0
             db 0,0,0,0,0,1,1,0,0,0,0

Fivechar     db 0,0,0,0,1,1,1,1,1,1,0
  	       db 0,0,0,0,1,1,1,1,1,1,0
 	       db 0,0,0,0,1,1,0,0,0,0,0
 	       db 0,0,0,0,1,1,0,0,0,0,0
  	       db 0,0,0,0,1,1,1,1,0,0,0
 	       db 0,1,0,0,1,1,1,1,1,0,0
 	       db 1,1,0,0,0,0,0,1,1,1,0
             db 0,1,1,0,0,0,0,1,1,0,0
             db 0,1,1,1,1,1,1,1,1,0,0
             db 0,0,1,1,1,1,1,1,0,0,0

Sixchar      db 0,0,0,0,1,1,0,0,0,0,0
  	       db 0,0,0,1,1,0,0,0,0,0,0
 	       db 0,0,1,1,0,0,0,0,0,0,0
 	       db 0,1,1,1,1,1,1,1,0,0,0
  	       db 0,1,1,1,1,1,1,1,1,0,0
 	       db 1,1,1,0,0,0,0,0,1,1,0
 	       db 1,1,0,0,0,0,0,1,1,1,0
             db 0,1,1,1,0,0,1,1,1,0,0
             db 0,0,1,1,1,1,1,1,0,0,0
             db 0,0,0,1,1,1,1,0,0,0,0

Sevenchar    db 1,1,1,1,1,1,1,1,1,1,0
  	       db 1,1,1,1,1,1,1,1,1,1,0
 	       db 0,0,0,0,0,0,0,0,1,1,0
 	       db 0,0,0,0,0,0,0,1,1,0,0
  	       db 0,0,0,0,0,0,1,1,0,0,0
 	       db 0,0,0,0,0,0,1,1,0,0,0
 	       db 0,0,0,0,0,1,1,0,0,0,0
             db 0,0,0,0,0,1,1,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0
             db 0,0,0,0,1,1,0,0,0,0,0

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

;********************************************************************框架

       call clor1
       call clor2 
       call clor3

;do**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx,40
       mov cx,70
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 40
       mov dx,320
       call sx1

      mov bx, 70       
      call sx1



;re**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 70
       mov cx,100
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov dx,320

      mov bx, 100      
      call sx1

;mi**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 100
       mov cx,130
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov dx,320

      mov bx, 130       
      call sx1

;fa**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 130
       mov cx,160
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov dx,320

      mov bx, 160       
      call sx1

;so**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 160
       mov cx,190
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov dx,320

      mov bx, 190       
      call sx1

;la**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 190
       mov cx,220
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov dx,320

      mov bx, 220      
      call sx1




;si**********      
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov bx, 220
       mov cx,250
       mov dx,320
       call hx1

       mov  word[ds:y],100
       mov  ax,[ds:y]
       call hx1

       mov cx,51
       mov  word[ds:y],50
       mov  ax,[ds:y]
       mov dx,320

      mov bx, 250     
      call sx1


       ;call lsh
       ;call bk

;********************************************************************时间中断

mov dl,1
mov word [ds:0x20],int_time0
mov word [ds:0x22],0

;********************************************************************PIANO字样+音符变色
      
       mov word [ds:0x24],int_key
       mov word [ds:0x26],0
       mov si,0

y1:   cmp  byte[ds:string+si],0x9e
        jz y2

        jmp y1
y2:    call P
       call I
       call A
       call N
       call O
       call clor3
       call W
       call One
       call Two
       call Three
       call Four
       call Five
       call Six
       call Seven
       jmp start_sound

;**************************************sound 
start_sound:
    mov ax, 0xb800
    mov es,ax

    mov ax,0
    mov ds,ax
    
    mov si, 0
      cli 
    mov word [ds:0x24] , int_key_sound
    mov word [ds:0x26] , 0
    sti

exit:
    jmp exit


    
; 键盘中断  
int_key_sound:
            mov dx, 0x60
        in  al, dx 
        
        ; a  1
        cmp al , 0x02
        je call_1

        ; b  2
        cmp al , 0x03
        je call_2
        
        ; c  3 
        cmp al , 0x04
        je call_3
        
        ; d  4 
        cmp al , 0x05
        je call_4
        
        ; e  5
        cmp al , 0x06
        je call_5
 
    
        ; e  6
        cmp al , 0x07
        je call_6


        ; e  7
        cmp al , 0x08
        je call_7
        jmp r1

    call_1:
        mov bx , [ds:table]
        call tosound
        jmp r1
    call_2:
        mov bx , [ds:table+2]
        call tosound
        jmp r1
    call_3:
        mov bx , [ds:table+4]
        call tosound
        jmp r1
    call_4:
        mov bx , [ds:table+6]
        call tosound
        jmp r1
    call_5:
        mov bx , [ds:table+8]
        call tosound
	jmp r1
    call_6:
        mov bx , [ds:table+10]
        call tosound
	jmp r1
    call_7:
        mov bx , [ds:table+12]
        call tosound
	jmp r1
    r1: mov dx, 0x20
        mov al, 0x61
        out dx, al ; 写入 cpu 
iret

tosound:
    mov [ds:nowUseHz] , bx
    call initSound
    call delay
    call openSoundPort
    call delay
    call closeSoundPort
ret

initSound:
    mov  al, 10110110B 
    out  43H, al 
    call TurnHzToHex
    mov  ax, [ds:nowUseHzTurned] 
    out  42H, al 
    mov  al, ah
    out  42H, al 
ret


; 打开扬声器
openSoundPort:
    push ax
    in al , 61H
    or al , 00000011B ; 0000 0011 b
    out 61H , al
    pop ax
ret


closeSoundPort:
    push ax
    in   al,61H
	and	 al,11111100B	;并行接口8255，PB1=0,关扬声器
	out	 61H,al
    pop ax
ret


TurnHzToHex:
	push dx 
    push ax
    push dx
    mov dx,12H
	mov ax,34DEH
	mov di,[ds:nowUseHz]
	div di
    mov [ds:nowUseHzTurned] , ax
    pop dx 
    pop ax
    pop dx
ret

; 0.1s 的延迟
delay:
    push cx 
    push ax 
    push dx
    mov  cx, 0FH
    mov  dx, 4240H
    mov  ah, 86H
    int  15H
    pop cx 
    pop ax 
    pop dx
ret


;********************************************************************键盘中断

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
;********************************************************************时间中断

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

;********************************************************************P字符

P: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,6460

b0:   mov al,[ds:Pchar+bx]
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

;********************************************************************I字符

I: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,6476

o0:  mov al,[ds:Ichar+bx]
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
;********************************************************************A字符

A: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,6492

c0:  mov al,[ds:Achar+bx]
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

;********************************************************************N字符

N: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,6508

h0:  mov al,[ds:Nchar+bx]
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


;********************************************************************O字符

O: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,6524

s0:  mov al,[ds:Ochar+bx]
       inc bx
       inc si
       inc cx  
       cmp al,1
       jz s1

       cmp cx,11    ;*13
       jz s2   

s3:  cmp bx,110     ;*113
      jb s0

pop si
pop cx
pop bx
     ret

s1:       mov dl,2
          mov [es:si],dl
          jmp s0

s2:       add si,309                    ;*307
          mov cx,0
          jmp s3
;********************************************************************1字符

One: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25650

j0:   mov al,[ds:Onechar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz j1

      cmp cx,11
      jz j2  
 
j3:  cmp bx,110
      jb j0

pop si
pop cx
pop bx
      ret

j1:       mov dl,2
          mov [es:si],dl
          jmp j0

j2:       add si,309
          mov cx,0
          jmp j3

;********************************************************************2字符

Two: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25680

k0:   mov al,[ds:Twochar+bx]
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

k2:       add si,309
          mov cx,0
          jmp k3


;********************************************************************3字符

Three: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25710

l0:   mov al,[ds:Threechar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz l1

      cmp cx,11
      jz l2  
 
l3:  cmp bx,110
      jb l0

pop si
pop cx
pop bx
      ret

l1:       mov dl,2
          mov [es:si],dl
          jmp l0

l2:       add si,309
          mov cx,0
          jmp l3

;********************************************************************4字符

Four: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25740

m0:   mov al,[ds:Fourchar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz m1

      cmp cx,11
      jz m2  
 
m3:  cmp bx,110
      jb m0

pop si
pop cx
pop bx
      ret

m1:       mov dl,2
          mov [es:si],dl
          jmp m0

m2:       add si,309
          mov cx,0
          jmp m3


;********************************************************************5字符

Five: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25770

n0:   mov al,[ds:Fivechar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz n1

      cmp cx,11
      jz n2  
 
n3:  cmp bx,110
      jb n0

pop si
pop cx
pop bx
      ret

n1:       mov dl,2
          mov [es:si],dl
          jmp n0

n2:       add si,309
          mov cx,0
          jmp n3

;********************************************************************6字符

Six: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25800

p0:   mov al,[ds:Sixchar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz p1

      cmp cx,11
      jz p2  
 
p3:  cmp bx,110
      jb p0

pop si
pop cx
pop bx
      ret

p1:       mov dl,2
          mov [es:si],dl
          jmp p0

p2:       add si,309
          mov cx,0
          jmp p3


;********************************************************************7字符

Seven: 
push bx 
push cx
push si 
      
      mov bx ,0 
      mov cx,0
      mov si ,25830

q0:   mov al,[ds:Sevenchar+bx]
      inc bx
      inc si
      inc cx  
      cmp al,1
      jz q1

      cmp cx,11
      jz q2  
 
q3:  cmp bx,110
      jb q0

pop si
pop cx
pop bx
      ret

q1:       mov dl,2
          mov [es:si],dl
          jmp q0

q2:       add si,309
          mov cx,0
          jmp q3
;********************************************************************W字符

W: 
push bx 
push cx
push si 
      
       mov bx ,0 
       mov cx,0
       mov si ,3424
      
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

;********************************************************************横线

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

;********************************************************************竖线

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

;********************************************************************颜色1

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

;********************************************************************颜色2

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

;********************************************************************颜色3

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
