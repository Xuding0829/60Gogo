org 0x8400
jmp start
my db   0,0,0,0,0,0,0,0,0,0,0,0,0	
      db   0,1,1,0,1,1,1,1,1,1,1,0,0
      db   0,0,1,1,0,0,0,1,0,0,0,0,0
      db   0,0,0,0,0,0,0,1,0,0,0,0,0
      db   0,1,1,1,0,1,1,1,1,1,0,0,0
      db   0,0,0,0,0,0,0,1,0,0,0,0,0
      db   0,0,0,1,0,0,0,1,0,0,0,0,0
      db   0,0,1,0,1,1,1,1,1,1,1,1,0
      db   0,1,0,0,0,0,0,0,0,0,0,0,0


color db 0

start:

	mov	AL,0x13
                mov	AH,0x00 
                INT	0x10

                mov	ax,0x0a000
                mov	es,ax

	mov	cx,0
	mov	bx,0
	mov	si,0
	call xq

	jmp $

xq:
	push	cx
	push	bx
	push	si

x3:
	mov	al,[ds:my+bx]
	inc	cx
	inc	bx
	inc	si
	cmp	al,1
	jz	x2
	cmp	cx,13
	jz	x4
n:
	cmp	bx,117
	jb	x3

	pop	bx
	pop	cx
	pop	si
	ret

x2:
	mov	byte[ds:color],60
	mov	dl,byte[ds:color]
	mov	[es:si],dl
	jmp	x3



x4:
	add	si,307
	mov	cx,0
	jmp	n