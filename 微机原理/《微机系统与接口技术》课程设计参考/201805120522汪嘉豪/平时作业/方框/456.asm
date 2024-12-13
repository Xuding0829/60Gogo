org 0x8400

start:

	call displayA
	jmp $

displayA:      
	mov	AL,0x13
                mov	AH,0x00 
                INT	0x10
 
                mov	ax,0x0a000
                mov	es,ax

	mov	dl,60

	mov	bx,100
                mov         cx,60
x1:            
	mov	[es:bx],dl
                inc 	bx
                loop	x1

	mov	bx,100
                mov         cx,36
x2:            
	mov	[es:bx],dl
                add 	bx,320
                loop	x2

	mov	bx,159
                mov         cx,36
x3:            
	mov	[es:bx],dl
                add	bx,320
                loop	x3

	mov	bx,11620
                mov         cx,60
x4:            
	mov	[es:bx],dl
                inc 	bx
                loop	x4


	ret