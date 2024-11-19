org 0x8400
jmp start 
	come:   db 'Please enter the password:'       
	str:        db 'Success!'
	str1:      db 'Wrong password! Press any key to continue.' 
	str2:      db '123'
start:

        	mov ax,0b800h           ;文本模式下显存起始地址
	mov es,ax
	mov ax,cs
	mov ds,ax
	mov di,0
	call clear   

	mov di,380           ;文字起始地址
	mov bx,come
	call welcome
	mov bx,str2
	mov cx,0
	jmp key1

clear:                                ;清除
	mov al,' '
	mov [es:di],al
	inc di
	mov ah,16h           ;背景色
	mov [es:di],ah
	inc di
	cmp di,0fa0h
	jbe clear	
ret

welcome:                              ;输出建议
	mov al,[ds:bx]
	mov [es:di],al
	inc di
	mov ah,21h
	mov [es:di],ah
	inc di
	inc bx
	cmp di,432       
	jb welcome
ret

key1:                                    ;检验密码是否正确
	mov ah,10h
	int 16h        
	cmp al,[ds:bx]
	jnz key2
	mov al,'*'
	mov [es:di],al
	inc di
	mov ah,21h
	mov [es:di],ah
	inc di
	add bx,1
	add cx,1
	cmp cx,3
	jae right
	jmp key1
ret

key2:                                                ;检验密码是否错误
	mov al,'*'
	mov [es:di],al
	inc di
	mov ah,41h            ;密码错误后的字体背景色
	mov [es:di],ah
	inc di
	mov ah,10h
	int 16h
	mov di,0
	call clear           
	mov ax,cs
	mov ds,ax
	mov bx,str1	
	mov di,360          
	jmp error
ret

error:
           
               mov al,[ds:bx]
	mov [es:di],al
	add di,1
	mov ax,16h
	mov [es:di],ax
	add di,1
	add bx,1
	cmp di,442      
	jbe error
	mov ah,10h
	int 16h
	jmp start

right:                     ;输入密码正确后
	mov ah,21h
	int 16h
        	mov di,0
	call clear  
	mov ax,cs
	mov ds,ax
	mov bx,str	
	mov di,380         

       	jmp 0x8600           ;转调至下一个
               ret

