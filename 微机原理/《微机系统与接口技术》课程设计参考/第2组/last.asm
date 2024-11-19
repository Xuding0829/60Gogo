org 0x8400
jmp start

string db 'welcome to my computer'
string1 db 'Youth is not a time of life; it is a state of mind; it is not a matter of rosy cheeks, red lips and supple knees; it is a matter of the will, a quality of the imagination, a vigor of the emotions; it is the freshness of the deep springs of life.Youth means a temperamental predominance of courage over timidity, of the appetite for adventure over the love of ease. This often exists in a man of 60 more than a boy of 20. Nobody grows old merely by a number of years. We grow old by deserting our ideals. '
num db 0
key db 0

string2 db  00h, 08h, 7Fh,0FCh, 01h, 00h, 01h, 10h, 1Fh,0F8h, 11h, 10h, 11h, 10h, 1Fh,0F0h
        db  11h, 10h, 11h, 14h,0FFh,0FEh, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 50h, 10h, 20h
        db  00h, 10h, 1Fh,0F8h, 10h, 10h, 11h, 10h, 11h, 10h, 11h, 10h, 11h, 10h, 11h, 10h
        db  11h, 10h, 12h, 10h, 12h, 90h, 04h, 80h, 04h, 82h, 08h, 82h, 30h, 7Eh,0C0h, 00h
;再 
;见

start:

	sti	
	mov ax,0xb800
	mov es,ax

	mov ax,0
	mov ds,ax
	mov byte[ds:0x8200],0
	

	mov word [ds:0x24],int_key
	mov word [ds:0x26],0

	
m:	cmp byte[key],0x1c
        jne m

display_key:
	;mov bx,0
	mov byte[es:bx],' '
	mov byte[es:bx+1],0x0c
        add bx,2
        cmp bx,100
        jne display_key

        
        call Welcome
        call Delay

        sti
	
	mov ax,0xb800                 ;指向文本模式的显示缓冲区
    	mov es,ax

	mov ax,0
	mov ds,ax

	mov si,0	
	mov bx,0
	call clear

	mov dx,0

	mov word [ds:0x20],int_time0
 	mov word [ds:0x22],0
x9:
	jmp $

x6:
        cli
        call GoodBye
        jmp x9


	;***********
	display2:
	mov ax,0a000h
	mov es,ax
	cld
	mov cx,2
	lea si,[string2]
	dis1:
	push cx
	push si
	push di
	
	mov cx,16
disword:

	movsw	
	add di,78

	loop disword
	pop di
	pop si
	pop cx
	add si,32
	add di,2
	loop dis1

ret


GoodBye:
        
	call Delay 
        mov     al,0x13  ;vga320x200x8bit显示
        mov     ah,0x00
        int     0x10 
              
        mov     ax,0x0a000      ;往显存（0xa0000开始）
        mov     ds,ax    
   
	call ChangeColor   
	call DrawBorder


	call Delay
   
	mov     al,0x12  
	mov     ah,0x00
	int        0x10 
               
	mov ax,0
	mov ds,ax
	mov di,4820

	call display2

ret



int_key:
       	push ax  
	;push bx
	push ds

	mov ax,0
	mov dx,ax

	mov dx,0x60  ;采集扫描码
	in al,dx  
        mov [key],al


	mov dx,0x20
	mov al,0x61
	out dx,al

	pop ds
	;pop bx
	pop ax
iret


int_time0:
	mov al,[ds:string1+si]
	mov byte[es:bx],al
	mov byte[es:bx+1],0x0c 
	add bx,2
	add si,1
	cmp si,80
        je space
	cmp si,160
        je space
	cmp si,240
        je space
	cmp si,320
        je space
	cmp si,400
        je space
	cmp si,480
        je space 

x7: 	cmp bx,1970
	je x6  
x5:	cmp si,504
	je gl
x4:	mov al,0x20
	mov dx,0x20 
	out dx,al           ;EOI=1,中断结束	
	iret


gl:     mov si,503
	jmp x4
space: add bx,160
       jmp x5

clear:	mov byte[es:bx],al
	inc bx
	mov byte[es:bx],0x0c
	inc bx
	cmp bx,4000
	jbe clear
	mov bx,0
ret


Delay:

	push bx
	push cx
	mov cx,0
	x1:mov bx,500
	x2:    
   		dec bx
   
   		cmp bx,0
   		jne  x2
   		loop x1
   
   	pop cx
        pop bx


ret 

Welcome:	
        mov bx,0
aa:	mov  byte [es:bx],' '
	mov  byte [es:bx+1],0x0c 
	add bx,2
	cmp bx,100
	jne aa
	
	mov si,0
    	mov bx,0
bb:     mov  al,[ds:string+si]
   	mov  byte [es:bx+1800],al
 	mov  byte [es:bx+1801],0x0c
   	add bx,2
 	inc si
  	cmp si,22
 	jne bb

ret

DrawBorder:

	mov ax,320    
	mov bx,0    
	mov cx,319
	mov dx,0
	call HengXian

	mov ax,320
	mov bx,199
	mov cx,319
	mov dx,0
	call HengXian

	mov ax,320
	mov bx,0
	mov cx,199
	mov dx,0
	call ShuXian

	mov ax,320
	mov bx,319
	mov cx,199
	mov dx,0
	call ShuXian
ret

HengXian:
;***************
;ax=320
;bx=y
;cx=x2
;dx=x1
;***************
	push ax  ;堆栈
	push bx
	push cx
	push dx


	sub cx,dx     ;cx-dx得到循环次数
	mov di,dx
	mul bx        ;bx*ax
	add di,ax

	inc cx  
a:      mov byte[ds:di],1    ;往显存里放数据（颜色）   
	inc di                
 	dec cx
	jnz a

	pop dx
	pop cx
	pop bx
	pop ax

ret

ShuXian:
;***************
;ax=320
;bx=x=50
;cx=y1=150
;dx=y2=50
;***************

	push ax
	push bx
	push cx
	push dx

	sub cx,dx    ;cx-dx循环次数
	mul dx     
	add bx,ax
	inc cx   
c: 
        mov byte[ds:bx],1   ;往显存里放数据（颜色）    
        add bx,320
	dec cx
	jnz c

	pop dx
	pop cx
	pop bx
	pop ax

ret

ChangeColor:
;************************
  	mov dx,0x3c8
      	mov al,1
	out dx,al

	mov dx,0x3c9 ;R
       	mov al,255
	out dx,al

    	mov dx,0x3c9 ;G
        mov al,0
	out dx,al

      	mov dx,0x3c9 ;B
      	mov al,0
	out dx,al
;*************************
;************************
  	mov dx,0x3c8
      	mov al,2
	out dx,al

	mov dx,0x3c9 ;R
       	mov al,0
	out dx,al

    	mov dx,0x3c9 ;G
        mov al,255
	out dx,al

      	mov dx,0x3c9 ;B
      	mov al,0
	out dx,al
;*************************
;************************
  	mov dx,0x3c8
      	mov al,3
	out dx,al

	mov dx,0x3c9 ;R
       	mov al,0
	out dx,al

    	mov dx,0x3c9 ;G
        mov al,0
	out dx,al

      	mov dx,0x3c9 ;B
      	mov al,255
	out dx,al
;*************************
ret
