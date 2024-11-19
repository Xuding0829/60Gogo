org 0x8400
	jmp	go
go:
	sti

	mov	ax,0xb800
	mov	es,ax
	
	mov	ax,0
	mov	ds,ax
	
	call	frame	;绘制窗口
	call	print	;在图形模式下打印字符串

	cli
	mov	word[ds:0x24],int_key	;键盘中断
	mov	word[ds:0x26],0
	sti
	jmp	$

;键盘驱动
int_key:
	mov	dx,0x60
	in	al,dx
	cmp	al,0x9c
	je	enter
	cmp	al,0x82
	je	key1
	cmp	al,0x83
	je	key2
	cmp	al,0x84
	je	key3
	cmp	al,0x85
	je	key4
	cmp	al,0x86
	je	key5
	cmp	al,0x87
	je	key6
	cmp	al,0x88
	je	key7
	cmp	al,0x89
	je	key8
	cmp	al,0x8a
	je	key9
	cmp	al,0x8b
	je	key0
	
next:	mov	dx,0x20
	mov	al,0x61
	out	dx,al

	call	delay
	in	al,61h
	and	al,0fch
	out	61h,al

	iret

key1:	mov	bx,word[ds:frequency]
	jmp	play
key2:	mov	bx,word[ds:frequency+2]
	jmp	play
key3:	mov	bx,word[ds:frequency+4]
	jmp	play
key4:	mov	bx,word[ds:frequency+6]
	jmp	play
key5:	mov	bx,word[ds:frequency+8]
	jmp	play
key6:	mov	bx,word[ds:frequency+10]
	jmp	play
key7:	mov	bx,word[ds:frequency+12]
	jmp	play
key8:	mov	bx,word[ds:frequency+14]
	jmp	play
key9:	mov	bx,word[ds:frequency+16]
	jmp	play
key0:	mov	bx,word[ds:frequency+18]
	jmp	play

;电子琴
play:
	call	sound
	call	delay
	jmp	next

;第二模块	
enter:
	mov	word[ds:0x20],int_time0
	mov	word[ds:0x22],0

	mov	ah,00h
	mov	al,13h
	int	10h

	mov	ax,0xb800
	mov	es,ax
	
	mov	ax,0
	mov	ds,ax
	
	call	frame

;多线程姓名，通过flag1控制进入的线程，通过flag2控制颜色
int_time0:
	push	si
	push	bx
	push	cx
	cmp	byte[ds:flag1],2
	je	i1
	cmp	byte[ds:flag1],3
	je	i2

	mov	bx,11900
	mov	cx,0
	mov	si,0
	mov	bp,he
	call	zone
	inc	byte[ds:flag1]
	jmp	exit3

i1:	mov	bx,11980
	mov	cx,0
	mov	si,0
	mov	bp,run
	call	zone
	inc	byte[ds:flag1]
	jmp	exit3

i2:	mov	bx,12060
	mov	cx,0
	mov	si,0
	mov	bp,ze
	call	zone
	mov	byte[ds:flag1],1
exit3:	
	inc	byte[ds:flag2]
	pop	cx
	pop	bx
	pop	si

	mov	al,0x20
	out	0x20,al
	iret

;发声	
sound:	
	mov	al,10110110b
	out	43h,al
	mov	dx,0012h
	mov	ax,348ch
	mov	di,bx
	div	di
	out	42h,al
	mov	al,ah
	out	42h,al

	in	al,61h
	or	al,03h
	out	61h,al
	ret

;延时
delay:
	mov	ax,0fffh
d1:	mov	cx,100
d2:	loop	d2
	dec	ax
	jnz	d1
	ret

;名字处理
zone:
z0:	
	cmp	byte[bp+si],0
	je	z1
	mov	al,byte[ds:flag2]
	mov	byte[es:bx],al
z1:	
	inc	si
	inc	cx
	cmp	cx,25
	ja	z2
	inc	bx
	jmp	z0
z2:	
	cmp	si,625
	ja	exit
	mov	cx,0
	add	bx,295
	jmp	z0
exit:	ret	

;打印字符串
print:	
	mov	dh,5
	mov	dl,5	
	call	setcursor
	mov	si,0

p1:	cmp	si,8
	je	s1
	mov	al,byte[ds:text1+si]
	call	write
	inc	si
	jmp	p1

s1:	mov	dh,9
	mov	dl,5	
	call	setcursor
	mov	si,0

p2:	cmp	si,31
	je	s2
	mov	al,byte[ds:text2+si]
	call	write
	inc	si
	jmp	p2	

s2:	mov	dh,11
	mov	dl,5	
	call	setcursor
	mov	si,0

p3:	cmp	si,30
	je	exit1
	mov	al,byte[ds:text3+si]
	call	write
	inc	si
	jmp	p3
exit1:	ret

;设置光标位置
setcursor:
	mov	ah,02h
	mov	bh,0
	int	10h
	ret

;打印单个字符
write:	
	mov	ah,0eh
	mov	bl,1
	int	10h
	ret

;画出窗口
frame:	mov	ah,00h
	mov	al,13h
	int	10h
	mov	ax,0x0a000
	mov	es,ax
	mov	si,color
	call	dis
	call	box	
	call	guide
	ret

;导航栏
guide:
	mov	bx,10
	mov	ax,20
	mov	cx,300
	call	lineh

	;绘制最小化按钮
	mov	bx,282
	mov	ax,15
	mov	cx,6
	call	lineh

	;绘制最大化按钮
	mov	bx,292
	mov	ax,12
	mov	cx,6
	call	lineh
	mov	bx,292
	mov	ax,18
	mov	cx,6
	call	lineh
	mov	bx,292
	mov	ax,12
	mov	cx,6
	call	linev
	mov	bx,298
	mov	ax,12
	mov	cx,7
	call	linev

	;绘制关闭按钮
	mov	bx,302
	mov	ax,12
	mov	cx,7
	call	slashl
	mov	bx,308
	mov	ax,12
	mov	cx,7
	call	slashr
	ret

;窗口框
box:
	mov	bx,10
	mov	ax,10
	mov	cx,300
	call	lineh

	mov	bx,10
	mov	ax,10
	mov	cx,180
	call	linev

	mov	bx,10
	mov	ax,190
	mov	cx,300
	call	lineh

	mov	bx,310
	mov	ax,10
	mov	cx,181
	call	linev
	ret
	
;竖线
linev:	
	mov	dx,320d
	mul	dx
	add	bx,ax
x1:	mov	byte[es:bx],1
	add	bx,320d
	dec	cx
	cmp	cx,0
	jne	x1
	ret	

;横线
lineh:
	mov	dx,320d
	mul	dx
	add	bx,ax
x2:	mov	byte[es:bx],1
	inc	bx
	dec	cx
	cmp	cx,0
	jne	x2
	ret

;左上至右下斜线
slashl:
	mov	dx,320d
	mul	dx
	add	bx,ax
x3:	mov	byte[es:bx],1
	add	bx,321
	dec	cx
	cmp	cx,0
	jne	x3
	ret

;右上至左下斜线
slashr:
	mov	dx,320d
	mul	dx
	add	bx,ax
x4:	mov	byte[es:bx],1
	add	bx,319
	dec	cx
	cmp	cx,0
	jne	x4
	ret	

;设置颜色
dis:	mov	dx,0x3c8
	mov	al,[si]
	out	dx,al
	mov	dx,0x3c9
	mov	al,[si+1]
	out	dx,al
	mov	al,[si+2]
	out	dx,al
	mov	al,[si+3]
	out	dx,al
	add	si,4
	ret

flag1	db	1
flag2	db	1

color	db	1,255,255,255	;窗口颜色

text1	db	"WELCOME!"
text2	db	"Press ENTER key to show my name"
text3	db	"Press key 0 to 9 to play piano"

frequency	dw	261,293,329,349,392,440,493,542,585,200
;频率
he	db	0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	db	0,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
	db	0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0
	db	0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0
	db	1,1,1,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0

run	db	0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0
	db	0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,1,1,0,0
	db	0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0
	db	0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0
	db	0,1,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,0,0,1,1,0,0
	db	1,1,1,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,0,0,1,1,0,0
	db	0,1,1,1,1,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,0,0,1,1,0,0
	db	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0
	db	0,0,0,1,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0
	db	0,0,1,1,1,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0
	db	0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0
	db	0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0
	db	0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0
	db	1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0
	db	0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0
	db	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0

ze	db	0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
	db	0,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
	db	0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0
	db	0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0
	db	1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0
	db	1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0
	db	0,0,1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0
	db	0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
	db	0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
	db	0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0
	db	0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0
	db	0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0