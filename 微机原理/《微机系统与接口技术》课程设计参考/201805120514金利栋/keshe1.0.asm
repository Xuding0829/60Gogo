org 0x8400
jmp start
key db 0
num db 0
string times 10 db 0
start:
	mov al,0x13
	mov ah,0x00	 
	INT 0x10
	mov ax,0x0a000             		;(往显存0xa0000开始)	
	mov ds,ax
			
	mov ax,0		
	mov es,ax

	mov word[es:0x24],int_key
	mov word[es:0x26],0

	
	sti	
	mov si,30				;改变颜色	

x:	cmp byte[string],0xB9 		;按下空格键进入主界面
	je h1
	jmp x
h1:	
	call display1
	jmp next
	
next:
	cmp byte[string],0x9C	
	je h1
	cmp byte[string],0x82
	je h2
	cmp byte[string],0x83
	je h3
	jmp next	
h2:	mov byte[string],0		;按1单个切换颜色
	call display1
	jmp next
h3:	call display1  ;按2变色
	jmp next			

	
display1:
	call DelayA
	inc si
	;画框
	mov ax,5
	mov bx,5
	mov cx,315
	call DrawLineHeng
	mov bx,5
	mov ax,5
	mov cx,195
	call DrawLineShu
	mov ax,195
	mov bx,5
	mov cx,315
	call DrawLineHeng
	mov bx,315
	mov ax,5
	mov cx,195
	call DrawLineShu
	;画2
	mov ax,10
	mov bx,20
	mov cx,40	
	call DrawLineHeng
	mov bx,40
	mov ax,10
	mov cx,30
	call DrawLineShu
	mov ax,30
	mov bx,20
	mov cx,40
	call DrawLineHeng
	mov bx,20
	mov ax,30
	mov cx,50
	call DrawLineShu
	mov ax,50
	mov bx,20
	mov cx,40
	call DrawLineHeng

	;画0
	mov ax,10
	mov bx,50
	mov cx,70
	call DrawLineHeng
	mov bx,50
	mov ax,10
	mov cx,50
	call DrawLineShu
	mov ax,50
	mov bx,50
	mov cx,70
	call DrawLineHeng
	mov bx,70
	mov ax,10
	mov cx,50
	call DrawLineShu
	;画2
	mov ax,10
	mov bx,80
	mov cx,100	
	call DrawLineHeng
	mov bx,100
	mov ax,10
	mov cx,30
	call DrawLineShu
	mov ax,30
	mov bx,80
	mov cx,100
	call DrawLineHeng
	mov bx,80
	mov ax,30
	mov cx,50
	call DrawLineShu
	mov ax,50
	mov bx,80
	mov cx,100
	call DrawLineHeng
	;画0
	mov ax,10
	mov bx,110
	mov cx,130
	call DrawLineHeng
	mov bx,130
	mov ax,10
	mov cx,50
	call DrawLineShu
	mov ax,50
	mov bx,110
	mov cx,130
	call DrawLineHeng
	mov bx,110
	mov ax,10
	mov cx,50
	call DrawLineShu



;*********************
;ax :y
;bx :x1
;cx :x2
;*********************
DrawLineHeng:			;画横线
	push ax
	push bx
	push cx
	push dx
	mov dx,320
	mul dx
	add bx,ax
	add cx,ax
x1:	mov [ds:bx],si
	add bx,1
	cmp bx,cx
	jbe x1
	pop dx
	pop cx	
	pop bx
	pop ax
	ret
;*********************
;bx:x
;ax:y1
;cx:y2
;*********************
DrawLineShu:			;画竖线	
	push ax
	push bx
	push cx
	push dx

	mov di,ax
	mov es,cx
	mov dx,320
	mul dx
	add bx,ax
	mov dx,es

x2:	mov [ds:bx],si
	add bx,320
	inc di
	cmp di,dx
	jbe x2
	pop dx
	pop cx	
	pop bx
	pop ax
	ret

int_key:				;键盘中断
	push ax
	push bx
	push dx
	push es
	
	
	mov ax,0
	mov es,ax
	

	mov dx,0x60
	in al,dx
	
	mov [string],al
	
    mov dx,0x20
	mov al,0x61
	out dx,al
	

	pop es
	pop dx
	pop bx
	pop ax
	iret
DelayA:					;延时函数
	push	cx
	push	bx
	mov	cx,50000
	mov	bx,100
c1:	
	dec	cx
	cmp	cx,0
	ja	c1
	jmp	b1
b1:	
	dec	bx
	cmp	bx,0
	ja	c1
	
	pop	cx
	pop	bx
ret