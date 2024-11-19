 org 0x8600
jmp start

chen   db '0000000000000000'              ;汉字定义'陈单'
          db '0000011111000000'
          db '0000100000100000'
          db '0001000000010000'
          db '0001000000010000'
          db '0000111111110000'
          db '0000001010000000'
          db '0000110001100000'
          db '1111000000011110'
          db '0001000000010000'
          db '0001000000010000'
          db '0000111111100000'
          db '0000010001000000'
          db '0000010001000000'
          db '0000010001000000'
          db '0000000000000000'

dan     db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0000000000000000'
          db '0011110000000000'
          db '0100001000000000'
          db '1000000100000000'
          db '1000000100000000'
          db '0100001000000000'
          db '0011110000000000'
start:

MOV AL,0x13
MOV AH,0x00
INT 0x10

	mov dx,0x3c8	;1       颜色定义blue为'1'
	mov al,1
	out dx,al
	mov dx,0x3c9
	mov al,0
	out dx,al
	mov dx,0x3c9
	mov al,0
	out dx,al
	mov dx,0x3c9
	mov al,255
	out dx,al

	mov dx,0x3c9	;2
	mov al,123
	out dx,al
	mov dx,0x3c9
	mov al,121
	out dx,al
	mov dx,0x3c9
	mov al,0
	out dx,al

	mov dx,0x3c9	;3
	mov al,0
	out dx,al
	mov dx,0x3c9
	mov al,255
	out dx,al
	mov dx,0x3c9
	mov al,0
	out dx,al

	mov dx,0x3c9	;4
	mov al,255
	out dx,al
	mov dx,0x3c9
	mov al,255
	out dx,al
	mov dx,0x3c9
	mov al,255
	out dx,al

       mov ax,0xa000
       mov es,ax                                 ;初始化
       
       mov ax,0x0
       mov ds,ax
      
       call beijing
       call xian1
       call xian2
       call xian3
       call xian4
       call xian5
       call xian6
       call xian7
 
       mov di,chen                       ;16*16
       mov bx,0
       mov cx,16
       mov dx,16                

x0:  cmp byte[ds:di],'0'                 
       jz out1
       mov byte [es:bx],1
out1: inc di
       inc bx
       dec cx
       cmp cx,0
       jz x1
       jmp x0

x1:    sub bx,16              
       add bx,320
       dec dx
       cmp dx,0
       jz x2
       mov cx,16
       jmp x0

x2:   mov di,dan                   
       mov bx,17
       mov cx,16
       mov dx,16

x3:  cmp byte[ds:di],'0'
       jz out2
       mov byte [es:bx],1
out2: inc di
       inc bx
       dec cx
       cmp cx,0
       jz x4
       jmp x3

x4:   sub bx,16
       add bx,320
       dec dx
       cmp dx,0
       jz exit
       mov cx,16
       jmp x3

exit: jmp $                     ;结束

beijing:
	mov di,0
z2:	mov byte[es:di],3
	inc di
	cmp di,64000
	jb z2
ret
jmp $


xian1:
	mov di, 111
f1:	mov cx,0
	mov si,cx
	mov byte[es:di],4
f2:	inc di
	inc si
	cmp si,320
	jb f2
	cmp di,11311
	jb f1
	ret
	jmp $

xian2:
	mov di,11311
f3: 	mov byte[es:di],4
	inc di
	cmp di,11411
	jb f3
	ret
	jmp $

xian3:
	mov di, 211
f4:	mov cx,0
	mov si,cx
	mov byte[es:di],4
f5:	inc di
	inc si
	cmp si,320
	jb f5
	cmp di,11411
	jb f4
	ret
	jmp $

xian4:
	mov di,32001
f6: 	mov byte[es:di],4
	inc di
	cmp di,32320
	jb f6
	ret
	jmp $

xian5:
	mov di, 52910
f7:	mov cx,0
	mov si,cx
	mov byte[es:di],4
f8:	inc di
	inc si
	cmp si,320
	jb f8
	cmp di,63790
	jb f7
	ret
	jmp $

xian6:
	mov di,52910
f9: 	mov byte[es:di],4
	inc di
	cmp di,53010
	jb f9
	ret
	jmp $

xian7:
	mov di, 53010
f10:	mov cx,0
	mov si,cx
	mov byte[es:di],4
f11:	inc di
	inc si
	cmp si,320
	jb f11
	cmp di,63890
	jb f10
	ret
	jmp $
