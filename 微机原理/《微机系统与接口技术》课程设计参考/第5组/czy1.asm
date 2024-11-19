 org 0x8400
jmp start
	tip:db 'Password:'
	str:db 'Success!!!!!'
	str1:db 'Wrong password! Press any key to continue.' 
	str2:db '123'
start:
        	mov ax,0b800h
	mov es,ax
	mov ax,cs
	mov ds,ax
	mov di,0
	call clear
	mov di,1020
	mov bx,tip
	call outtip
	mov bx,str2
	mov cx,0
	jmp pro1

clear:
	mov al,' '
	mov [es:di],al
	inc di
	mov ah,05h
	mov [es:di],ah
	inc di
	cmp di,0fa0h
	jbe clear	
ret

outtip:
	mov al,[ds:bx]
	mov [es:di],al
	inc di
	mov ah,05h
	mov [es:di],ah
	inc di
	inc bx
	cmp di,1038
	jb outtip
ret

pro1:
	mov ah,10h
	int 16h        
	cmp al,[ds:bx]
	jnz key
	mov al,'*'
	mov [es:di],al
	inc di
	mov ah,05h
	mov [es:di],ah
	inc di
	add bx,1
	add cx,1
	cmp cx,3
	jae right
	jmp pro1
ret

key:
	mov al,'*'
	mov [es:di],al
	inc di
	mov ah,05h
	mov [es:di],ah
	inc di
	mov ah,10h
	int 16h
	mov di,0
	call clear           
	mov ax,cs
	mov ds,ax
	mov bx,str1	
	mov di,1000
	jmp errorout
ret

errorout:
	mov al,[ds:bx]
	mov [es:di],al
	add di,1
	mov ax,05h
	mov [es:di],ax
	add di,1
	add bx,1
	cmp di,1081
	jbe errorout
	mov ah,10h
	int 16h
	jmp start

right:
	mov ah,10h
	int 16h
        	mov di,0
	call clear  
	mov ax,cs
	mov ds,ax
	mov bx,str	
	mov di,1020
	jmp 0x8600
ret


