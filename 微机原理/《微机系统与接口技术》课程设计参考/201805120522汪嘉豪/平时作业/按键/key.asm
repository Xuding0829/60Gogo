org 0x8400
start:
	call	clc
	sti
	mov ax,0xb800
	mov es,ax
	
	mov di,0
	mov cx,1

	mov ax,0
	mov ds,ax
	
	mov word [ds:0x24],int_key
	mov word [ds:0x26],0
	
	jmp $

clc:
	push	ax
	push	bx
	push	cx
	push	dx

	mov	    ax,0xb800
    mov     es,ax
    mov     bx,0
	mov     cx,4000
        
 c1:
    mov   byte[es:bx],' '
    mov   byte[es:bx+1],0
    add    bx,2
    loop   c1
		
	pop		ax
	pop		bx
	pop		cx
	pop		dx

	ret	

int_key:
	push	ax
	push	bx

	mov		dx,0x60
	in		al,dx
	cmp		al,3ah
	je		cap1
	cmp		al,82h
	ja		end
	call	key
	cmp		cx,0
	je		x
	add		al,32

x:
	mov		byte [es:di],al
	mov		byte [es:di+1],0x0d
	add		di,2
	jmp		end

cap1:
	cmp		cx,0
	je		i2
	mov		cx,0
	jmp		end

i2:
	mov	cx,1

end:
	mov		al,0x61
	mov		dx,0x20
	out		dx,al

	pop		bx
	pop		ax

	iret

key:
	cmp		al,1eh
	jne		k1
	mov		al,65
	jmp		k
k1:
	cmp		al,30h
	jne		k2
	mov		al,66
	jmp		k
k2:
	cmp		al,2eh
	jne		k3
	mov		al,67
	jmp		k
k3:
	cmp		al,20h
	jne		k4
	mov		al,68
	jmp		k
k4:
	cmp		al,12h
	jne		k5
	mov		al,69
	jmp		k
k5:
	cmp		al,21h
	jne		k6
	mov		al,70
	jmp		k
k6:
	cmp		al,22h
	jne		k7
	mov		al,71
	jmp		k
k7:
	cmp		al,23h
	jne		k8
	mov		al,72
	jmp		k
k8:
	cmp		al,17h
	jne		k9
	mov		al,73
	jmp		k
k9:
	cmp		al,24h
	jne		k10
	mov		al,74
	jmp		k
k10:
	cmp		al,25h
	jne		k11
	mov		al,75
	jmp		k
k11:
	cmp		al,26h
	jne		k12
	mov		al,76
	jmp		k
k12:
	cmp		al,32h
	jne		k13
	mov		al,77
	jmp		k
k13:
	cmp		al,31h
	jne		k14
	mov		al,78
	jmp		k
k14:
	cmp		al,18h
	jne		k15
	mov		al,79
	jmp		k
k15:
	cmp		al,19h
	jne		k16
	mov		al,80
	jmp		k
k16:
	cmp		al,10h
	jne		k17
	mov		al,81
	jmp		k
k17:
	cmp		al,13h
	jne		k18
	mov		al,82
	jmp		k
k18:
	cmp		al,1fh
	jne		k19
	mov		al,83
	jmp		k
k19:
	cmp		al,14h
	jne		k20
	mov		al,84
	jmp		k
k20:
	cmp		al,16h
	jne		k21
	mov		al,85
	jmp		k
k21:
	cmp		al,2fh
	jne		k22
	mov		al,86
	jmp		k
k22:
	cmp		al,11h
	jne		k23
	mov		al,87
	jmp		k
k23:
	cmp		al,2dh
	jne		k24
	mov		al,88
	jmp		k
k24:
	cmp		al,15h
	jne		k25
	mov		al,89
	jmp		k
k25:
	cmp		al,2ch
	jne		k
	mov		al,90

k:
	ret