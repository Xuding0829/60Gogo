org	0x8400
jmp	start

string 	db 'Everyone, welcome to the system!'              
string1	db 'ZH'

num 	db 0
key_buf times 100 	db 0

start:
	sti			;IF=0 �ж���Ӧ

	mov	ax, 0xb800	;�ı�ģʽ����0xb800�Դ�
	mov	es, ax

	mov	ax, 0
	mov	ds, ax		;ds��Ϊ���ݵĶε�ַ

	mov	bp, 0		
	mov	si, 100

	call	WTMM			;�Դ����
	
	mov	word [ds : 0x24], int_key1		;�����ж�1����
	mov	word [ds : 0x26], 0

	jmp	$

WTMM:	
;******************************************************
	;�ı�ģʽ���Դ桰Everyone, welcome to the system!��
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
	;��ƽ
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
	;�����ж�1��ʾ	
;************************
	push	ax
	push	cx

	call	clear

	mov	al, [ds : key_buf]
	cmp	al, 0xb0		;B
	jnz	key1	

	mov	byte [es : 0x100], 'B'
	mov	byte [es : 0x101], 0x0c

	mov	cl, [ds : num]		;��ʾ�жϴ���

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
	;��ʱ���ж�0	
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
	out	dx, al		;EOI=1,�жϽ���
	
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
	;�����ж�1
;************************
	push	ax
	push	dx

	mov	dx, 0x60
	in	al, dx			;�ɼ�ɨ����

	mov	[ds : key_buf], al

	inc	byte[ds : num]		;input����ĸ���

	call	display_key1

	mov	al, 0x61
	mov	dx, 0x20
	out	dx, al		;�����жϽ���
	
	pop	dx
	pop	ax

	iret