org	0x8400
jmp	start

num db 0
key_buf times 100 db 0

xlabel	dw 11
rgb	db 100, 100, 100
	db 100, 0, 100
	db 100, 0, 0
	db 0, 100, 100

Wgm      	db 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1   
	db 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1
	db 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1
	db 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1
	db 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0
	db 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0
	db 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0
	db 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0

Egm      	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1   
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
	db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1   
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

Lgm      	db 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0   
	db 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1
	db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 

Cgm      	db 0, 0, 0, 1, 0, 1, 1, 1,1, 1, 1    
	db 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
	db 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
	db 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1 

Ogm      	db 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0   
	db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
	db 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0
	db 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1
	db 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1
	db 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1
	db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
	db 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 

Mgm      	db 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0   
	db 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0
	db 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0
	db 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0
	db 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1
	db 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1
	db 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1
	db 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1 

I1gm      	db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0   
	db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
	db 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0
	db 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0
	db 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0
	db 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 

start:
	sti

	MOV 	AL, 0x13		;VGA320x200x8bit显存
	MOV 	AH, 0x00
	INT 	0x10

	mov 	ax, 0x0a000	;往显存(0xa000开始)
	mov 	es, ax
	mov	ax, 0
	mov	ds, ax

	mov	si, 0
	mov	bp, 400

	call	Color
	call	Color1
	call	Color3
	call	Color4

	call 	DrawLineOfH
	call	DrawLineOfH1
	call	DrawLineOfV
	call	DrawLineOfV1		;窗口

	call	WGMM
	call	EGMM
	call	LGMM
	call	CGMM
	call	OGMM
	call	MGMM
	call	EGMM1
	call	I1GMM			;欢迎词

	mov	word [ds : 0x24], int_key1
	mov	word [ds : 0x26], 0

	jmp	$

DrawLineOfH:
;************************	
	;横线
	;ax : y1
	;bx : x1				
	;cx : x2
	;dx : 320
;************************
	push	ax
	push	bx
	push	cx
	push	dx

	mov 	ax, 18
	mov 	bx, 38
	mov 	cx, 280
	mov 	dx, 320

	sub 	cx, bx
	mul 	dx			
	add 	bx, ax
		
	mov 	dl, 1
x1:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx
	jnz 	x1

	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret     

DrawLineOfH1:
;************************
	;横线	
	;ax : y2
	;bx : x1				
	;cx : x2
	;dx : 320
;************************
	push	ax
	push	bx
	push	cx
	push	dx

	mov 	ax, 180
	mov 	bx, 38
	mov 	cx, 280
	mov 	dx, 320
	
	sub 	cx, bx
	mul 	dx			
	add 	bx, ax
		
		
	mov 	dl, 1
x2:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx
	jnz 	x2

	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret     

DrawLineOfV:
;************************
	;竖线	
	;ax : y1
	;bx : x1
	;cx : y2
	;dx : 320
;************************
	push	ax
	push	bx
	push	cx
	push	dx

	mov 	ax, 18
	mov 	bx, 38
	mov 	cx, 180
	mov 	dx, 320
	
	sub 	cx, ax
	mul 	dx			
	add 	bx, ax	
		
	mov 	dl, 1
x3:	mov 	[es : bx], dl
	add 	bx, 320
	dec 	cx
	jnz 	x3

	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret     

DrawLineOfV1:
;************************
	;竖线	
	;ax : y1
	;bx : x2
	;cx : y2
	;dx : 320
;************************
	push	ax
	push	bx
	push	cx
	push	dx

	mov 	ax, 18
	mov 	bx, 280
	mov 	cx, 180
	mov 	dx, 320

	sub 	cx, ax	
	mul 	dx			
	add 	bx, ax	
		
	mov 	dl, 1
x4:	mov 	[es : bx], dl
	add 	bx, 320
	dec 	cx
	jnz 	x4

	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret     

WGMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : ;y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 41
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Wgm
x22:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	x20
	
	mov	dl, 2		
x21:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	x22
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	x22

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	
	ret     

x20:	mov	dl, 1
	jmp	x21

EGMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 53
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Egm
y2:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	y0
	
	mov	dl, 2		
y1:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	y2
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	y2

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 
    
y0:	mov	dl, 1
	jmp	y1

LGMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 65
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Lgm
z2:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	z0
	
	mov	dl, 2		
z1:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	z2
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	z2

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 
    
z0:	mov	dl, 1
	jmp	z1

CGMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 77
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Cgm
a2:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	a0
	
	mov	dl, 2		
a1:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	a2
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	a2

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 
    
a0:	mov	dl, 1
	jmp	a1

OGMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 89
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Ogm
a5:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	a3
	
	mov	dl, 2		
a4:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	a5
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	a5

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 

a3:	mov	dl, 1
	jmp	a1

    
MGMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 101
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Mgm
a8:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	a6
	
	mov	dl, 2		
a7:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	a8
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	a8

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 

a6:	mov	dl, 1
	jmp	a7

EGMM1:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 113
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, Egm
y5:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	y3
	
	mov	dl, 2		
y4:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	y5
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	y5

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 
    
y3:	mov	dl, 1
	jmp	y4

I1GMM:
;************************
	;图形模式显示	
	;ax : y1
	;bx : x1				
	;cx : x2-x1+1
	;dx : 320
	;dl : 颜色号
	;bp : y2-y1+1
;************************
	push	ax
	push	bx
	push	cx
	push	dx
	push	bp
	push	si

	mov 	ax, 21	
	mov 	bx, 125
	mov 	dx, 320
	mov 	cx, [ds : xlabel]
	mov	bp, 8

	mul 	dx			
	add 	bx, ax
		
	mov	si, I1gm
a11:	mov	al, [ds : si]
	inc 	si
	cmp	al, 1
	jnz	a9
	
	mov	dl, 2		
a10:	mov 	[es : bx], dl
	inc 	bx
	dec 	cx	;11
	jnz 	a11
	
	add	bx, 309		;bx'=bx-(x2-x1)+320
	mov 	cx, [ds : xlabel]

	dec	bp	
	jnz	a11

	pop	si
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ax

	ret 

a9:	mov	dl, 1
	jmp	a10

Color:
;************************
	;白色
;************************
	push	ax
	push	bx

	mov 	dx, 0x3c8
	mov 	al, 1
	out	dx, al		;颜色号

	mov 	dx, 0x3c9
	mov 	al, 100
	out	dx, al		;R/4

	mov 	al, 100
	out	dx, al		;G/4

	mov 	al, 100
	out	dx, al		;B/4

	pop	bx
	pop	ax

	ret

Color1:
;************************
	;紫红色
;************************

	push	ax
	push	bx

	mov 	dx, 0x3c8
	mov 	al, 2
	out	dx, al		;颜色号

	mov 	dx, 0x3c9
	mov 	al, 100
	out	dx, al		;R/4

	mov 	al, 0
	out	dx, al		;G/4

	mov 	al, 100
	out	dx, al		;B/4

	pop	bx
	pop	ax

	ret

Color3:
;************************
	;红色
;************************
	push	ax
	push	bx

	mov 	dx, 0x3c8
	mov 	al, 3
	out	dx, al		;颜色号

	mov 	dx, 0x3c9
	mov 	al, 100
	out	dx, al		;R/4

	mov 	al, 0
	out	dx, al		;G/4

	mov 	al, 0
	out	dx, al		;B/4

	pop	bx
	pop	ax

	ret

Color4:
;************************
	;蓝绿色
;************************

	push	ax
	push	bx

	mov 	dx, 0x3c8
	mov 	al, 4
	out	dx, al		;颜色号

	mov 	dx, 0x3c9
	mov 	al, 100
	out	dx, al		;R/4

	mov 	al, 100
	out	dx, al		;G/4

	mov 	al, 100
	out	dx, al		;B/4

	pop	bx
	pop	ax

	ret

display_key1:	
	push	ax
	push	cx

	mov	al, [ds : key_buf]
	cmp	al, 0x9e		;A
	jnz	key1	

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
		
	mov	dl, 3
	mov	byte [es : bp], dl

	inc	bp

	cmp	bp, 64000
	je	t0
	
t1:	mov	al, 0x20
	mov	dx, 0x20
	out	dx, al		;EOI=1,中断结束
	
	mov	dl, 4
	mov	byte [es : si], dl

	inc	si

	cmp	si, 64000
	jae	t2
	
	pop	dx
	pop	bx
	pop	ax

	iret

t0:	mov	bp, 0
	jmp	t1

t2:	mov	si, 0
	jmp	t1

int_key1:
	push	ax
	push	dx

	mov	dx, 0x60
	in	al, dx			;采集扫描码

	mov	[ds : key_buf], al

	call	display_key1

	mov	al, 0x61
	mov	dx, 0x20
	out	dx, al		;键盘中断结束
	
	pop	dx
	pop	ax

	iret
