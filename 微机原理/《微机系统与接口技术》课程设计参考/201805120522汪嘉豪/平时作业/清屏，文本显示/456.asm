org 0x8400
jmp start

string        db 'qwer12345678'

start:
                mov  bx,0xb800
	mov  es,bx

	mov bx,0
	mov cx,4000		;文本模式显示25行，80字   即80*25*2 = 4000字节
           s:
                mov dl,0		                ;清屏
	mov dh,0
	mov [es:bx],dx
	add bx,2
	loop s
	
	
	mov ax,0
	mov ds,ax
	mov bx,0
	mov di,0
	mov cx,12
          g:
                mov  al,[ds:string+bx]                                    ;源字符
	mov byte [es:di],al                                          ;显示目标字符
	mov byte [es:di+1],60h                                  ;设置目标字符颜色
	inc bx                                                              ;db 一个字符一个字节
	add di,2                                                          ;显存 一个字符两个字节:字符，字符颜色
	loop g
	
	
	jmp $