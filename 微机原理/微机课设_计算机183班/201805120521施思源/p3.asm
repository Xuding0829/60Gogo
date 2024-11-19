org 0x8400
jmp start

offset1 dw 64h
string times 10 db 0
key_buf times 100 db 0
color db 1

;显示文字SSY		
SSY    db   0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,1,0,0,0,0,0,1,0	
       db   0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0
       db   0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0
       db   0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0
       db   0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0
       db   0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0
       db   0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0
       db   0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0
       db   0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0
	 

start:
	mov al,0x13	   ;320x200
	mov ah,0x00
	INT 0x10

	call	col	
	
	mov ax,0
	mov ds,ax		;指向图形模式的显示缓冲区
	mov ax,0x0a000    ;起始显存
	mov es,ax
	
	mov bp,0
 
	mov bx,0
        mov cx,0
        mov si,0

	call disp_draw
	
	cli			
	mov word [ds:0x24],int_key	;按键中断
	mov word [ds:0x26],0
	sti
	
com:	
	cmp byte[string],0x9C
	je loop2
	
	call ch_color
	jmp com	
loop2:
		
	mov si,100
	jmp loop3
loop3:	
	mov bx,0
        mov cx,0
	mov si,28947
	
	call disp_SSY
	mov byte[es:si],1
	cmp byte[string],0x9C
	je jump2
	jmp com

	jmp $

jump2:	
	mov byte[es:si],2
	add si,320
	cmp si,63900
	ja back
	jmp com
	
back:	mov si,100
	jmp com	

int_key:
        push ax
	push bx
	push dx
	push ds
	mov ax,0
	mov ds,ax
	mov dx,0x60	
	in al,dx

	mov [string],al
	
	mov dx,0x20   ;键盘中断结束
	mov al,0x61 
	out dx,al

	pop ds
	pop dx
	pop bx
	pop ax
	iret


disp_SSY:
	;显示SSY字符
	push bx
        push cx
	push si
r:	mov al,[ds:SSY+bx]
    inc bx
    inc si
    inc cx
    cmp al,1
    jz  r1
    cmp  cx,24      ;大于24行换列
    jz  r2
r3: cmp bx,216
    jb r   

    pop si
    pop cx
    pop bx 
    ret

r1: mov dl,byte[color]
    mov [es:si],dl
    jmp r
   
r2: add si,296
    mov cx,0
    jmp r3  

disp_draw:
	mov word[ds:offset1],50		;第一横
	mov ax,[ds:offset1]
	mov bx,50
	mov cx,270
	call heng		

	mov word[ds:offset1],150		;第二横
	mov ax,[ds:offset1]
	mov bx,50
	mov cx,270
	call heng

	mov word[ds:offset1],50		;第一竖
	mov ax,[ds:offset1]
	mov bx,50
	mov cx,150
	call shu


	mov word[ds:offset1],50		;第二竖
	mov ax,[ds:offset1]
	mov bx,270
	mov cx,370
	call shu
	ret
	
;横竖的调用模组函数
heng:		;画横线
	mov dx,320
	MUL dx			;mul是乘法dx:ax=dx*ax
	sub cx,bx		
	add bx,ax
a:	mov byte[es:bx],1
	add bx,1
	DEC cx
	cmp cx,0
	ja a
	ret

shu:		;画竖线
	mov dx,320
	MUL dx		;mul是乘法dx:ax=dx*ax 
   	sub cx,bx	   	 ; 竖线的长度
        add bx,ax
b:	mov byte[es:bx],1
	add bx,320
	dec cx
	cmp cx,0
	ja b	
	ret
	
;颜色改变函数	
ch_color:
	cmp byte[color],3
	jae jumpout
	inc byte[color]
	jmp pend
jumpout:
	mov byte[color],1
pend:
	ret

col:

;颜色代码
	
	mov al,1      ;1号颜色号（0，255，0）绿
	mov dx,0x3c8
	out dx,al
	
	mov dx,0x3c9	
	mov al,0      
	out dx,al
	
	mov al,255         
	out dx,al
	
	mov al,0		
	out dx,al
	
	mov al,2      ;2号颜色号（255，255，0）黄色
	mov dx,0x3c8
	out dx,al
	
	mov dx,0x3c9	
	mov al,255      
	out dx,al
	
	mov al,255        
	out dx,al
	
	mov al,0		
	out dx,al
	
	mov al,3      ;3号颜色号（255，0，0）红色
	mov dx,0x3c8
	out dx,al
	
	mov dx,0x3c9	
	mov al,255   
	out dx,al
	
	mov al,0       
	out dx,al
	
	mov al,0		
	out dx,al
;颜色定义完毕
	ret