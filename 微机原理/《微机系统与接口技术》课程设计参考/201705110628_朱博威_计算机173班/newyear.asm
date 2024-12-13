org 	0x8400
jmp	start

key	db 0
r 	db 0
g 	db 0
b 	db 0
sehao 	db 0
x 	dw 0
y 	dw 0
string	db 'Let us celebrate the coming of the New Year together',0x21,'/'
pic1	db '111111111101111111111111'
	db '111111111101111111111111'
	db '111000011100000011100000'
	db '111000011100000011100000'
	db '111000011100000011100000'
	db '111000011100000011100000'
	db '111111111101111111111111'
	db '111111111101111111111111'
	db '111000011100000011100000'
	db '111000011100000011100000'
	db '111000011100000011100000'
	db '111000011100000011100000'
	db '111111111101111111111111'
	db '111111111101111111111111'

ph	db '110000001100000110000011111111000111111110001100000011000111100001101111111111011001100110001100000011011111111110000011000001111111100'
	db '110000001100000110000011000001100110000011001100000011000111100001101111111111011001100110001100000011011111111110000011000001100000110'
	db '110000001100001111000011000000110110000001100110000110000110110001101100000000011001100110000110000110011000000000000111100001100000011'
	db '110000001100001111000011000001100110000011000110000110000110110001101100000000011001100110000110000110011000000000000111100001100000110'
	db '111111111100011001100011111111000111111110000011001100000110011001101111111111011001100110000011001100011111111110001100110001111111100'
	db '111111111100011001100011000000000110000000000001111000000110011001101111111111001101101100000001111000011111111110001100110001111100000'
	db '110000001100111111110011000000000110000000000000110000000110001101101100000000001101101100000000110000011000000000011111111001100011000'
	db '110000001100110000110011000000000110000000000000110000000110001101101100000000001101101100000000110000011000000000011000011001100001100'
	db '110000001101100000011011000000000110000000000000110000000110000111101111111111001101101100000000110000011111111110110000001101100000110'
	db '110000001101100000011011000000000110000000000000110000000110000111101111111111000110011100000000110000011111111110110000001101100000011'

	
start:
	mov	ax,0			;数据段的段基址
	mov	ds,ax

	mov	ax,0x0a000		;往显存（0xa0000开始）中放入点数据
	mov	es,ax

	call	welcome

	mov	ax,0xb800      	;指向文本模式的显示缓冲区
    	mov	es,ax
	mov	si,0

	sti
zd: 	mov 	word[ds:0x20],int_time0
    	mov 	word[ds:0x22],0

    	mov 	word[ds:0x20],int_time1
    	mov 	word[ds:0x22],0
	cmp	si,4000
	jae	zdjs
   	jmp 	zd
	
zdjs:	
	mov 	word[ds:0x20],int_time_empty
    	mov 	word[ds:0x22],0
	call	qingping
	mov	si,0
	
	mov	word[ds:0x24],int_key
	mov	word[ds:0x26],0
	
	call	enter

	mov	ax,0			;数据段的段基址
	mov	ds,ax

	mov	ax,0x0a000		;往显存（0xa0000开始）中放入点数据
	mov	es,ax
	mov	al,0x13			;VGA320x200x8bit显示
	mov	ah,0x00
	int	0x10			;选择图形模式

	mov	byte[sehao],1
	mov	byte[r],0
	mov	byte[g],0
	mov	byte[b],0
	call	color

	mov	byte[sehao],2
	mov	byte[r],255
	mov	byte[g],255
	mov	byte[b],255
	call	color

	mov	byte[sehao],3
	mov	byte[r],0
	mov	byte[g],0
	mov	byte[b],255
	call	color
	
	mov	byte[sehao],2
	mov	word[x],148
	mov	word[y],93
	call	write
	
	call	change
	call 	clear

	mov	word[x],92
	mov	word[y],95
	call	write2

	jmp	$
;-------------------------------------------------------
;时间中断
int_time0:
    	mov 	byte[es:si],' '
    	mov 	byte[es:si+1],10
    	add 	si,2

    	mov 	al,0x20
    	mov 	dx,0x20
    	out dx,al           		;EOI=1,中断结束
	
    	iret

int_time1:
    	mov 	byte[es:si],' '
    	mov 	byte[es:si+1],65
    	add 	si,2

    	mov 	al,0x20
    	mov 	dx,0x20
    	out dx,al           		;EOI=1,中断结束

   	iret

int_time_empty:
	push 	ax
	push 	dx
	inc	ax
	mov 	al,0x20
    	mov 	dx,0x20
    	out 	dx,al
	pop 	dx
	pop 	ax
	iret

;-------------------------------------------------------
;响应键盘
int_key:	
	push	ax
	push	dx

	mov	dx,0x60
	in	al,dx

	mov	[key],al

	mov	dx,0x20
	mov	al,0x61
	out	dx,al

	pop	dx
	pop	ax

	iret
;-------------------------------------------------------
enter:	
	cmp	byte[key],0x1c
	jne	enter
	mov	byte[key],0
	ret
;-------------------------------------------------------
change:	
	cmp	byte[key],0x02
	je	one
	cmp	byte[key],0x03
	je	two
	cmp	byte[key],0x04
	je	three
	cmp	byte[key],0x05
	je	four
	cmp	byte[key],0x01
	je	exit
	jmp	change
;-------------------------------------------------------
;功能一：按一下变一次色
one:	push	cx
	mov	byte[key],0
	mov	ch,byte[sehao]
	inc	ch
	mov	byte[sehao],ch
	call	write
	pop	cx
	jmp	change
;-------------------------------------------------------
;功能二：按一下闪烁
two:	push	cx
	mov	ch,byte[sehao]
	jmp	c2
c1:	mov	ch,2
c2:	cmp	ch,10
	jnb	c1
	inc	ch
	mov	byte[sehao],ch
	call	write
	cmp	byte[key],0x01
	je	c3
	call	delay
	jmp	c2
c3:	mov	byte[key],0
	pop	cx
	jmp	change
;-------------------------------------------------------
;功能三：按WASD四个键控制方向移动
three:	push	ax
	push	bx
	mov	ax,word[x]
	mov	bx,word[y]
t1:	cmp	byte[key],0x11
	je	w
	cmp	byte[key],0x1e
	je	a
	cmp	byte[key],0x1f
	je	s
	cmp	byte[key],0x20
	je	d
	cmp	byte[key],0x01
	je	t3
	jmp	t1
w:	call	clear
	cmp	bx,0
	je	t2
	dec	bx
	jmp	t2	
s:	call	clear
	cmp	bx,186
	je	t2
	inc	bx
	jmp	t2
a:	call	clear
	cmp	ax,0
	je	t2
	dec	ax
	jmp	t2
d:	call	clear
	cmp	ax,296
	je	t2
	inc	ax
	jmp	t2
t2:	mov	word[x],ax
	mov	word[y],bx
	call	write
	call	delay
	jmp	t1	
t3:	mov	byte[key],0
	pop	bx
	pop	ax
	jmp	change
;-------------------------------------------------------
;功能四：按顺时针转动
four:	push	ax
	push	bx
	push	cx
	push	dx
	mov	ax,word[x]
	mov	bx,word[y]
f1:	cmp	byte[key],0x91
	je	wm
	cmp	byte[key],0x9e
	je	am
	cmp	byte[key],0x9f
	je	sm
	cmp	byte[key],0xa0
	je	dm
	cmp	byte[key],0x01
	je	f3
	jmp	f1
wm:	mov	byte[key],0x91
	call	clear
	cmp	bx,0
	je	dm
	dec	bx
	jmp	f2
dm:	mov	byte[key],0xa0
	call	clear
	cmp	ax,296
	je	sm
	inc	ax
	jmp	f2
sm:	mov	byte[key],0x9f
	call	clear
	cmp	bx,186
	je	am
	inc	bx
	jmp	f2
am:	mov	byte[key],0x9e
	call	clear
	cmp	ax,0
	je	wm
	dec	ax
	jmp	f2

f2:	mov	word[x],ax
	mov	word[y],bx
	call	write
	call	delay1
	jmp	f1
f3:	mov	byte[key],0
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	jmp	change
exit:	ret

;-------------------------------------------------------
;延迟（较长）
delay:
	push	bx
	push	cx
	mov	cx,0
d1:	mov 	bx,50
d2:	dec	bx
	cmp	bx,0
   	jne 	d2
   	loop	d1
   
   	pop 	cx
       	pop 	bx
	ret
;延迟（较短）
delay1:
	push	bx
	push	cx
	mov	cx,0
d11:	mov 	bx,10
d12:	dec	bx
	cmp	bx,0
   	jne 	d12
   	loop	d11
   
   	pop 	cx
       	pop 	bx
	ret
;-------------------------------------------------------
;欢迎
welcome:
	push	ax
	push	es
	push	bx
	push	dx
	push	si

	mov	ax,0xb800		;指向文本模式的显示缓冲区
	mov	es,ax

	lea	si,[0000h]

x2:	mov	byte[es:si],' '
	add	si,2h
	cmp	si,4000
	jnz	x2

	lea	si,[1950]

	mov	bx,0h
	mov	ds,bx

	mov	bx,string

x3:	mov	al,[ds:bx]
	cmp	al,'/'
	je	x1

	mov	byte[es:si],al
	add	si,2h
	inc	bx
	jmp	x3

x1:	pop	si
	pop	dx
	pop	bx
	pop	es
	pop	ax
	ret
;-------------------------------------------------------	
;清屏
qingping:	
	push	bx
	mov	bx,0
qingping_loop:
	mov	byte[es:bx],' '
	inc	bx
	mov	byte[es:bx],0
	inc	bx
	cmp	bx,4000
	jnz	qingping_loop

	pop	bx
	ret
;-------------------------------------------------------
;设置自己的颜色函数
color:
	push	dx
	push	ax

	mov	al,byte[sehao]	;颜色号
	mov	dx,0x3c8
	out	dx,al

	mov	al,byte[r]		;设置R
	mov	dx,0x3c9
	out	dx,al
	
	mov	al,byte[g]		;设置G
	mov	dx,0x3c9
	out	dx,al

	mov	al,byte[b]		;设置B
	mov	dx,0x3c9
	out	dx,al

	pop	ax
	pop	dx
	ret
;-------------------------------------------------------
;描点画字符
;bx:x
;si:y
;dl:sehao
write:
	push	ax
	push	bx
	push	cx
	push	dx
	push 	si

	mov	ax,320
	mov	si,[y]
	mul	si
	mov	bx,[x]
	add	bx,ax
	mov	ax,bx

	mov	si,1
	mov	ch,1
	mov	dl,[sehao]
	mov	di,pic1

wx1:	mov	cl,[di]
	cmp	cl,'0'
	jnz	wx2
	mov	byte[es:bx],1
	jmp	wx3

wx2:	mov	byte[es:bx],dl

wx3:	cmp	ch,14
	ja	wx4
	inc	bx
	inc	di
	inc	si
	cmp	si,24
	jng	wx1
	inc	ch
	mov	si,1
	add	ax,320
	mov	bx,ax
	jmp	wx1

wx4:	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret
;-------------------------------------------------------
;描点画字符
;bx:x
;si:y
;dl:sehao
write2:
	push	ax
	push	bx
	push	cx
	push	dx
	push 	si

	mov	ax,320
	mov	si,[y]
	mul	si
	mov	bx,[x]
	add	bx,ax
	mov	ax,bx

	mov	si,1
	mov	ch,1
	mov	dl,[sehao]
	mov	di,ph

wx12:	mov	cl,[di]
	cmp	cl,'0'
	jnz	wx22
	mov	byte[es:bx],1
	jmp	wx32

wx22:	mov	byte[es:bx],dl

wx32:	cmp	ch,10
	ja	wx42
	inc	bx
	inc	di
	inc	si
	cmp	si,135
	jng	wx12
	inc	ch
	mov	si,1
	add	ax,320
	mov	bx,ax
	jmp	wx12

wx42:	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret
;-------------------------------------------------------
;清除画图
clear:
	push	ax
	push	bx
	push	cx
	push 	si

	mov	ax,320
	mov	si,[y]
	mul	si
	mov	bx,[x]
	add	bx,ax
	mov	ax,bx

	mov	si,1
	mov	ch,1
cx1:	mov	byte[es:bx],1
	cmp	ch,14
	ja	cx2
	inc	bx
	inc	si
	cmp	si,24
	jng	cx1
	inc	ch
	mov	si,1
	add	ax,320
	mov	bx,ax
	jmp	cx1

cx2:	pop	si
	pop	cx
	pop	bx
	pop	ax
	ret