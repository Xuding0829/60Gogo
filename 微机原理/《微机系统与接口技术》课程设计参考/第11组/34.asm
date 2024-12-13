org 0x8400
jmp start

num db 0
key_buf	times 100 db 0
mov	[ds:key_buf+bx],al  

start:	
	MOV 	AL, 0x13		;VGA320x200x8bit�Դ�
	MOV 	AH, 0x00
	INT 	0x10

	mov 	ax, 0x0a000
	mov 	es, ax		;es==0

	sti             	;if�Ĵ�����1 ���ж�
	mov	word [ds:0x24],int_key
	mov	word [ds:0x26],0 		;�����ж�

	jmp	x3

display_key:
	mov	al,[ds:key_buf+bx]
	cmp	al,0x1e     ;0x1e
	je	x1
	cmp	al,0x1f
	je	x2	;����������ΪB ��cl��Ϊ100
	jnz	display_key

	jmp	$

x1:	mov 	dx, 0x3c8
	mov 	al, 1
	out	dx, al		;��ɫ��    0,50,50
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
;*************************************����************************************************
	mov	ax,30
	mov	bx,60
	mov	cx,62
	mov	dx,320
qwe:	call	DrawLineShu0fH
	inc	ax
	dec	bx
	dec	cx
	cmp	bx,30
	ja	qwe	;qwe Ϊб��
	
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
	out	dx, al		;��ɫ��  50,100,50
	mov 	dx, 0x3c9
	mov 	al,50
	out	dx, al		;R/4
	mov 	dx, 0x3c9
	mov 	al, 100
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
;*************************************����************************************************
	mov	ax,30
	mov	bx,60
	mov	cx,62
	mov	dx,320
qwew:	call	DrawLineShu0fH
	inc	ax
	dec	bx
	dec	cx
	cmp	bx,30
	ja	qwew	;qwe Ϊб��
	
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


x3:	
	mov 	dx, 0x3c8
	mov 	al, 1
	out	dx, al		;��ɫ��  50,100,50
	mov 	dx, 0x3c9
	mov 	al,100
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
;*************************************����************************************************
	mov	ax,30
	mov	bx,60
	mov	cx,62
	mov	dx,320

qwewe:	call	DrawLineShu0fH
	inc	ax
	dec	bx
	dec	cx
	cmp	bx,30
	ja	qwewe	;qwe Ϊб��
	
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

int_key:
	push	ax
	push	bx
	push	cx
	push	ds
	mov	cx,0
	mov	ax,0
	mov	ds,ax
	
	mov	dx,0x60	;�ɼ�ɨ����
	in	al,dx

	mov	[ds:key_buf+bx],al  
	inc	bx
	
	inc	byte[ds:key_buf+bx]	;input�������

	mov	dx,0x20	;�����жϽ���
	mov	al,0x61
	out	dx,al

	pop	ds
	pop	cx
	pop	bx
	pop	ax
	iret

;*******************************************************************���߷ֺ���*********************************
;*************************************����********************************************************
;���������Ͻ�Ϊ0�� ����Ϊx�� ����ΪY��    	
;����axΪ��x,y����xֵ           bxΪy��ֵ	cxΪy���յ�yֵ
;*******************************************
;*******************
;ax  ::y        ����
;bx  ::x1     ͷ����
;cx  ::x2     β����
;:    y*320+x
;*******************
DrawLineHeng0fH:
	push	ax
	push	bx
	push	cx
	push	dx

	mul	dx         ;Ĭ��Ϊax=dx*ax=320*x  �˷�
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

;*************************************************************************����******************************************
;*************************************����************************************************
;����axΪ��x,y)��xֵ		bxΪy��ֵ	���������ax bx��ͬ��	cxΪ���߳���ֵ+bxֵ+1
;******************************************	
;***********************
	;ax  ::x     ����
	;bx  ::y1   ��
	;cx  ::y2   β
	;:     320*x+y
;***********************
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

