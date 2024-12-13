org	0x8400
jmp	start

string 	db 'Everyone, welcome to the system!'              
string1	db 'ZH'

num 	db 0
key_buf times 100 	db 0

start:
	sti			;IF=0 中断响应

	mov	ax, 0xb800	;文本模式，往0xb800显存
	mov	es, ax

	mov	ax, 0
	mov	ds, ax		;ds作为数据的段地址

	mov	bp, 0		
	mov	si, 100

	call	WTMM			;显存句子
	
	mov	word [ds : 0x24], int_key1		;按键中断1触发
	mov	word [ds : 0x26], 0

	jmp	$

WTMM:	
;******************************************************
	;文本模式，显存“Everyone, welcome to the system!”
;******************************************************
	push	ax
	push	di
	push	bx

	mov	di, 180
	mov 	bx, 0	
wtm:	mov	al, [ds : string+bx]
	mov	byte [es : di], al
	mov	byte [es : di+1], 0x0c
	inc	bx
	add	di, 2
	cmp 	bx,32
	jnz 	wtm	

	pop	bx
	pop	di
	pop	ax

	ret

clear:	
;************************	
	;清平
;************************
	push	bx

	mov 	bx, 0
x:	mov 	byte [es : bx], ''
	mov 	byte [es : bx+1], 0x0c
	add 	bx, 2
	cmp 	bx, 4000
	jnz 	x

	pop	bx

	ret

display_key1:	
;************************
	;按键中断1显示	
;************************
	push	ax
	push	cx

	call	clear

	mov	al, [ds : key_buf]
	cmp	al, 0xb0		;B
	jnz	key1	

	mov	byte [es : 0x100], 'B'
	mov	byte [es : 0x101], 0x0c

	mov	cl, [ds : num]		;显示中断次数

	add	cl, 30h	

	mov	byte [es : 0x110], cl
	mov	byte [es : 0x111], 0x0c

	mov	word [ds : 0x20], int_time0
	mov	word [ds : 0x22], 0

key1:	pop	cx
	pop	ax

	ret

int_time0:
;************************
	;定时器中断0	
;************************
	push	ax
	push	bx
	push	dx	
	
	mov	byte [es : bp], 'Z'
	mov 	byte [es : bp+1], 0x0a

	add	bp, 2

	cmp	bp, 4000
	jae	t0
	
t1:	mov	al, 0x20
	mov	dx, 0x20
	out	dx, al		;EOI=1,中断结束
	
	mov	byte [es : si], 'H'
	mov 	byte [es : si+1], 0x0b

	add	si, 2

	cmp	si, 4000
	jae	t2
	
	pop	dx
	pop	bx
	pop	ax

	iret

t0:	mov	bp, 0
	call	clear
	jmp	t1

t2:	mov	si, 0
	call	clear
	jmp	t1

int_key1:
;************************
	;按键中断1
;************************
	push	ax
	push	dx

	mov	dx, 0x60
	in	al, dx			;采集扫描码

	mov	[ds : key_buf], al

	inc	byte[ds : num]		;input编码的个数

	call	display_key1

	mov	al, 0x61
	mov	dx, 0x20
	out	dx, al		;键盘中断结束
	
	pop	dx
	pop	ax

	iret