org	0x8400
start:
	sti

	mov	ax,0xb800
	mov	es,ax			
	
	mov	ax,0
	mov	ds,ax
		
	mov	bx,0

	mov	word [ds:0x20],int_time0
	mov	word [ds:0x22],0

	sti		
	jmp  $

int_time0:
	mov	byte  [es:bx],'a'
	mov	byte  [es:bx+1],0x0c
	add	bx,2
	mov	word [ds:0x20],int_time1
	mov	word [ds:0x22],0

	mov  al,0x20
	mov  dx,0x20
	out   dx,al		
    iret

int_time1:
	mov	byte  [es:bx],'B'
	mov	byte  [es:bx+1],0x0d
	add	bx,2
	mov	word [ds:0x20],int_time0
	mov	word [ds:0x22],0

	mov  al,0x20
	mov  dx,0x20
	out   dx,al		
    iret

delay:
	push	cx
	mov	cx,1000
c1:	
	dec	cx
	cmp	cx,0
	ja	c1
	pop	cx

	ret