org 0x8400
jmp start

num db 0
key_buf	times 100 db 0
mov	[ds:key_buf+bx],al  

start:	
	MOV 	AL, 0x13		;VGA320x200x8bit显存
	MOV 	AH, 0x00
	INT 	0x10

	mov 	ax, 0x0a000
	mov 	es, ax		;es==0

	sti             	;if寄存器置1 打开中断
	mov	word [ds:0x24],int_key
	mov	word [ds:0x26],0 		;设置中断

	jmp	x3

display_key:
	mov	al,[ds:key_buf+bx]
	cmp	al,0x1e     ;0x1e
	je	x1
	cmp	al,0x1f
	je	x2	;若键盘输入为B 将cl变为100
	jnz	display_key

	jmp	$

x1:	mov 	dx, 0x3c8
	mov 	al, 1
	out	dx, al		;颜色号    0,50,50
	mov 	dx, 0x3c9
	mov 	al, 0
	out	dx, al		;R/4
	mov 	dx, 0x3c9
	mov 	al, 150
	out	dx, al		;G/4
	mov 	dx, 0x3c9
	mov 	al, 50
	out	dx, al		;B/4
	
	mov	ax,30          
	mov	bx,30
	mov	cx,60
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,30
	mov	cx,60
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,90
	mov	cx,120
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,45
	mov	bx,90
	mov	cx,120
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,150
	mov	cx,180
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,45
	mov	bx,150
	mov	cx,180
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,210
	mov	cx,240
	mov	dx,320
	call	DrawLineHeng0fH
;*************************************竖线************************************************
	mov	ax,30
	mov	bx,60
	mov	cx,62
	mov	dx,320
qwe:	call	DrawLineShu0fH
	inc	ax
	dec	bx
	dec	cx
	cmp	bx,30
	ja	qwe	;qwe 为斜线
	
	mov	ax,30
	mov	bx,90
	mov	cx,121
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,120
	mov	cx,151
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,150
	mov	cx,181
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,210
	mov	cx,241
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,240
	mov	cx,271
	mov	dx,320
	call	DrawLineShu0fH

	jmp	display_key

x2:	
	mov 	dx, 0x3c8
	mov 	al, 1
	out	dx, al		;颜色号  50,100,50
	mov 	dx, 0x3c9
	mov 	al, 0
	out	dx, al		;R/4
	mov 	dx, 0x3c9
	mov 	al, 100
	out	dx, al		;G/4
	mov 	dx, 0x3c9
	mov 	al, 200
	out	dx, al		;B/4

	call	DrawLineHeng0fH
        mov	ax,60
	mov	bx,30
	mov	cx,60
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,75
	mov	cx,100
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,45
	mov	bx,75
	mov	cx,100
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,75
	mov	cx,100
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,120
	mov	cx,145
	mov	dx,320
	call	DrawLineHeng0fH



	mov	ax,30
	mov	bx,150
	mov	cx,180
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,150
	mov	cx,180
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,190
	mov	cx,220
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,190
	mov	cx,220
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,240
	mov	cx,270
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,290
	mov	cx,315
	mov	dx,320
	call	DrawLineHeng0fH
	mov	ax,45
	mov	bx,290
	mov	cx,315
	mov	dx,320
	call	DrawLineHeng0fH
	mov	ax,60
	mov	bx,290
	mov	cx,315
	mov	dx,320
	call	DrawLineHeng0fH




	mov	ax,0         
	mov	bx,0
	mov	cx,320
	mov	dx,320
	call	DrawLineHeng0fH

        mov	ax,198      
	mov	bx,0
	mov	cx,320
	mov	dx,320
	call	DrawLineHeng0fH  

        mov	ax,199        
	mov	bx,0
	mov	cx,320
	mov	dx,320
	call	DrawLineHeng0fH           
;*************************************竖线************************************************

	
	mov	ax,30
	mov	bx,75
	mov	cx,106
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,120
	mov	cx,151
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,150
	mov	cx,181
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,190
	mov	cx,221
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,220
	mov	cx,251
	mov	dx,320
	call	DrawLineShu0fH


	mov	ax,30
	mov	bx,240
	mov	cx,271
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,255
	mov	cx,286
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,270
	mov	cx,301
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,290
	mov	cx,321
	mov	dx,320
	call	DrawLineShu0fH



        mov	ax,1
	mov	bx,0
	mov	cx,197
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,30
	mov	cx,61
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,45
	mov	cx,76
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,60
	mov	cx,91
	mov	dx,320
	call	DrawLineShu0fH






	jmp	display_key


x3:	
	mov 	dx, 0x3c8
	mov 	al, 1
	out	dx, al		;颜色号  50,100,50
	mov 	dx, 0x3c9
	mov 	al,0
	out	dx, al		;R/4
	mov 	dx, 0x3c9
	mov 	al, 200
	out	dx, al		;G/4
	mov 	dx, 0x3c9
	mov 	al, 100
	out	dx, al		;B/4

	

	mov	ax,60
	mov	bx,30
	mov	cx,60
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,75
	mov	cx,100
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,45
	mov	bx,75
	mov	cx,100
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,75
	mov	cx,100
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,120
	mov	cx,145
	mov	dx,320
	call	DrawLineHeng0fH



	mov	ax,30
	mov	bx,150
	mov	cx,180
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,150
	mov	cx,180
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,190
	mov	cx,220
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,60
	mov	bx,190
	mov	cx,220
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,240
	mov	cx,270
	mov	dx,320
	call	DrawLineHeng0fH

	mov	ax,30
	mov	bx,290
	mov	cx,315
	mov	dx,320
	call	DrawLineHeng0fH
	mov	ax,45
	mov	bx,290
	mov	cx,315
	mov	dx,320
	call	DrawLineHeng0fH
	mov	ax,60
	mov	bx,290
	mov	cx,315
	mov	dx,320
	call	DrawLineHeng0fH




	mov	ax,0         
	mov	bx,0
	mov	cx,320
	mov	dx,320
	call	DrawLineHeng0fH

        mov	ax,198      
	mov	bx,0
	mov	cx,320
	mov	dx,320
	call	DrawLineHeng0fH  

        mov	ax,199        
	mov	bx,0
	mov	cx,320
	mov	dx,320
	call	DrawLineHeng0fH           
;*************************************竖线************************************************

	
	mov	ax,30
	mov	bx,75
	mov	cx,106
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,120
	mov	cx,151
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,150
	mov	cx,181
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,190
	mov	cx,221
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,220
	mov	cx,251
	mov	dx,320
	call	DrawLineShu0fH


	mov	ax,30
	mov	bx,240
	mov	cx,271
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,255
	mov	cx,286
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,270
	mov	cx,301
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,290
	mov	cx,321
	mov	dx,320
	call	DrawLineShu0fH



        mov	ax,1
	mov	bx,0
	mov	cx,197
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,30
	mov	cx,61
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,45
	mov	cx,76
	mov	dx,320
	call	DrawLineShu0fH

	mov	ax,30
	mov	bx,60
	mov	cx,91
	mov	dx,320
	call	DrawLineShu0fH






	jmp	display_key

int_key:
	push	ax
	push	bx
	push	cx
	push	ds
	mov	cx,0
	mov	ax,0
	mov	ds,ax
	
	mov	dx,0x60	;采集扫描码
	in	al,dx

	mov	[ds:key_buf+bx],al  
	inc	bx
	
	inc	byte[ds:key_buf+bx]	;input编码个数

	mov	dx,0x20	;键盘中断结束
	mov	al,0x61
	out	dx,al

	pop	ds
	pop	cx
	pop	bx
	pop	ax
	iret

;*******************************************************************横线分函数*********************************
DrawLineHeng0fH:
	push	ax
	push	bx
	push	cx
	push	dx

	mul	dx         ;默认为ax=dx*ax=320*x  乘法
	sub	cx,bx
	add	bx,ax    
	mov	dl,1

y4:	mov	[es:bx],dl
	inc	bx
	dec	cx
	jnz	y4


	pop	dx
	pop	cx
	pop	bx
	pop	ax
ret

;*************************************************************************竖线******************************************
DrawLineShu0fH:
	push	ax
	push	bx
	push	cx
	push	dx

	mul	dx  
	sub	cx,bx	  
	add	bx,ax
	mov	dl,1

y2:	mov	[es:bx],dl
	add	bx,320
	dec	cx	
	jnz	y2

	pop	dx
	pop	cx
	pop	bx
	pop	ax

ret
;*****************************************************************************************************************