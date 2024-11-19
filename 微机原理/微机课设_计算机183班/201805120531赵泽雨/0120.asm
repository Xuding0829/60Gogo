org 0x8400
jmp start
	tip  db 'Password:'
	str1  db 'Wrong password! ' 
	str2  db 'abc'
start:
	mov 	ax,0b800h          ;文本模式起始地址
	mov 	es,ax
	mov 	ax,cs
	mov 	ds,ax
	mov 	di,0
	call	 	clear                     ;清屏
	mov  	di,1920               ;八个字符放在第13行开始位置
	mov  	bx,tip
	call  	print
	mov  	bx,str2	;偏移地址寄存器：使用bx,bp,si,di寄存
	mov  	cx,0
	jmp  	bijiao

clear:
	mov  	al,' '
	mov  	ah,21H
	mov  	[es:di],al
	mov  	[es:di+1],ah
	add  	di,2
	cmp  	di,4000               ;文本模式显示25行，80字   共80*25*2 = 4000字节
	jbe  	clear	
	ret

print:
	mov  	al,[ds:bx]
	mov  	ah,0EH
	mov  	[es:di],al
	mov  	[es:di+1],ah
	add  	di,2
	inc  	bx
	cmp  	di,1938                ;共九个字符增加18个字节，1920+18=1938
	jb  	 	print                       ;九个字符输入完了就跳出循环
       ret

bijiao:
	mov  	ah,10h
	int  	 	16h        
	cmp  	al,[ds:bx]              ;比较输入和密码是否相同
	jnz  	 	key
	mov  	al,'*'                      ;输入的密码显示为'*' 
	mov  	ah,46h
	mov  	[es:di],al
	mov  	[es:di+1],ah
	add  	di,2
	add  	bx,1                       ;比较下一个
	add  	cx,1                        ;记录是第几位密码
	cmp  	cx,3                       ;一共是三位，比较是否输完
	jae  	right                        ;三位都正确即表示密码全部正确
	jmp  	bijiao
       ret

key:
	mov  	al,'*'                       ;输入的密码显示为'*' 
	mov  	ah,46h
	mov  	[es:di],al
	mov  	[es:di+1],ah
	add  	di,2
	mov  	ah,10h
	int  	 	16h
	mov  	di,0
	call  	clear                         ;清屏
	mov  	ax,cs
	mov  	ds,ax
	mov  	bx,str1	
	mov  	di,1958                   ;将出错提示放在第十三行中间
	jmp 	 error
       ret

error:
	mov  	al,[ds:bx]
	mov  	dx,25h
	mov  	[es:di],al
	mov  	[es:di+1],dx
	add  	di,2
	inc  	bx
	cmp  	di,1990                   ;共16个字符增加32个字节,1958+32=1990
	jb  	 	error
	mov  	ah,10h
	int  	 	16h
	jmp 	start

right:
	mov  	ah,10h
	int  	 	16h
       mov  	di,0
	call  	clear  
	jmp  	0x8600
       ret
       
       
       
       
       


;准备切换至图像模式，开始播放开机声音


 wd0	db '0000110000000000'
 		db '0000110000001100'
 		db '0111111110001100'
 		db '0111111111001100'
 		db '0000110001101100'
 		db '0000110000111000'
 		db '1111111110011000'
 		db '1111111110111000'
 		db '0000110000111000'
 		db '0110111101101100'
 		db '0110111111001100'
 		db '0111110010000100'
 		db '0111110000000000'
 		db '1100111111111110'
 		db '1000011111111110'
 		db '0000000000000000'


jv1	dw	1,1,319,199
jv2	dw	284,1,294,8
jv3	dw	294,1,304,8
jv4	dw	304,1,314,8
jv5	dw	11,43,55,55
jv6	dw	11,58,55,66
jv7	dw	11,69,55,77
jv8	dw	11,80,55,88
jv9	dw	90,77,301,87

X	dw 0
Y	dw 0	
flag db 0


line1  	dw	7,40,313,40
line2  	dw	6,169,60,169
line3  	dw	90,53,301,53
line4	dw	60,40,60,169

pallete 	db 	1,10,10,5
		db 	2,5,10,10
	
	;电子琴开始
	mov	ax,0xb800				;往显存（0xa0000开始）中放入点数据
	mov	es,ax
	mov	ax,0
	mov	dx,ax

	cli;	--->IF=0
	mov word [ds:0x24],int_key  ;写入键盘中断9号服务程序地址
	mov word [ds:0x26],0


;电子琴输出
	sti	;if=1;标志寄存器，控制CPU cli则不执行
	
	call t1
	call delay1;长延时
	call t2
	call delay1
	call t3
	call delay1
	call t4
	call delay1
	call t5
	call delay1
	call t5
	call delay1
	call t5
	call delay3;短延时
	call t4
	call delay3
	call t3
	call delay1
	call t4
	call delay1
	call t4
	call delay1
	call t4
	call delay3
	call t3
	call delay3
	call t2
	call delay1
	call t1
	call delay1
	call t3
	call delay1
	call t5
	call delay1

	mov	si,500
;电子琴结束

	
	mov	al,0x13				;320x200x8bit显示模式
	mov	AH,0x00
	int	0x10


	mov	ax,0x0a000			;往显存（0xa0000开始）中放入点数据
	mov	ds,ax
	mov	cx,0x0000
	mov	es,cx

	mov	si,pallete
	call		col

	mov	di,jv1
	call	fang
	mov	di,jv2
	call	fang	
	mov	di,jv3
	call	fang
	mov	di,jv4
	call	fang

	mov	di,jv5
	call	fang
	mov	di,jv6
	call	fang	
	mov	di,jv7
	call	fang
	mov	di,jv8
	call	fang
	mov	di,jv9
	call	fang
	
	mov	di,line1
	call	dizhi
	call 	heng
	mov	di,line2
	call	dizhi
	call 	heng
	mov	di,line3
	call	dizhi
	call 	heng
	mov	di,line4
	call	dizhi
	call 	shu
	
	call	color1
	mov	word[ds:X],10	;汉字起点x坐标
	mov	word[ds:Y],10	;汉字起点y坐标
	call	write


exit:	jmp	$

;电子琴开始

int_key:
	mov 	dx,0x60		;读取键盘
	in 	al,dx

f0:	cmp	al,0x1e		;输出1
	jne	f1
	call	t1

f1:	cmp	al,0x1f		;输出2
	jne	f2
	call	t2

f2:	cmp	al,0x20		;输出3
	jne	f3
	call	t3

f3:	cmp	al,0x21		;输出4
	jne	f4
	call	t4

f4:	cmp	al,0x22		;输出5
	jne	f5
	call	t5

f5:	cmp	al,0x23		;输出6
	jne	f6
	call	t6

f6:	cmp	al,0x24		;输出7
	jne	k1
	call	t7

k1:	mov	dx,0x20		;;中断芯片内的清零,键盘中断结束
	mov	al,0x61
	out		dx,al		;EOI=1，中断结束
	iret

t1:
	;设置频率
	mov  dx,12H
	mov  ax,34DEH
	mov  di,262
	div di		;计算初值
	call	sound		;调用发音子程序
	call	delay	;调用延时
	in		al,61H			
	and		al,11111100B	;PB1=PB0=0,关闭扬声器
	out		61H,al
	ret
t2:
	;设置频率
	mov  dx,12H
	mov  ax,34DEH
	mov  di,294
	div di
	call	sound		
	call	delay			
	in		al,61H			
	and		al,11111100B
	out		61H,al	
	ret

t3:
	;设置频率
	mov  dx,12H
	mov  ax,34DEH
	mov  di,330
	div di
	call	sound		
	call	delay	
	in		al,61H			
	and		al,11111100B
	out		61H,al
	ret


t4:
	;设置频率
	mov  dx,12H
	mov  ax,34DEH
	mov  di,349
	div di
	call	sound		
	call	delay		
	in		al,61H			
	and		al,11111100B
	out		61H,al
	ret


t5:
	;设置频率
	mov  dx,12H
	mov  ax,34DEH
	mov  di,392
	div di
	call	sound		
	call	delay		
	in		al,61H			
	and		al,11111100B
	out		61H,al	
	ret


t6:
	;设置频率
	mov  dx,0012H
	mov  ax,34DEH
	mov  di,440
	div di
	call	sound				
	call	delay		
	in		al,61H			
	and		al,11111100B
	out		61H,al	
	ret

t7:

	;设置频率
	mov  dx,12H
	mov  ax,34DEH
	mov  di,494
	div di
	call	sound      
	call	delay      
	in	al,61H      
	and	al,11111100B
	out	61H,al
	ret


sound:
	push	ax
	mov	al,10110110B  	  	;设定时器工作方式，方式3
	out	43H,al           ;送8253的控制端口43H
	pop	ax             
	out	42H,al            ;计数初值送低8位定时器2，即送42H端口
	mov	al,AH          
	out	42H,al		   	;计数初值送高8位定时器2，即送42H端口
	in	al,61H
	OR	al,00000011B	   	;打开扬声器，PB1=PB0=1
	out	61H,al
	ret

;;	delay:
;		push	cx
;		mov cx,60000  ;延迟
;	for1: dec cx
;	   	jnz for1
;		pop		cx
;		ret
	
	
	
delay:
			push	cx
			push	ax
			mov		ax,0FFFH
	for1:	mov		cx,0FFH
	for2:	loop	for2
			dec		ax
			jnz		for1
			pop		ax
			pop		cx
			ret
			
			
			
delay1:     
		mov bp, 80
		mov si, 80
delay2:
		dec bp
		;nop
		jnz delay2
		dec si
		cmp si,0    
		jnz delay2
            ret

delay3:     
		push bp
		push si
		mov bp, 50
		mov si, 50
delay4:
		dec bp
		;nop
		jnz delay4
		dec si
		cmp si,0    
		jnz delay4
		pop si
		pop bp
            ret
;电子琴结束


;“赵”文字颜色
color1:
	mov	al,48
	mov	dx,0x3c8
	out	dx,al
	mov	al,0
	mov	dx,0x3c9
	out	dx,al
	mov	al,0
	mov	dx,0x3c9
	out	dx,al
	mov	al,0
	mov	dx,0x3c9
	out	dx,al

	mov	al,49
	mov	dx,0x3c8
	out	dx,al
	mov	al,255
	mov	dx,0x3c9
	out	dx,al
	mov	al,255
	mov	dx,0x3c9
	out	dx,al
	mov	al,255
	mov	dx,0x3c9
	out	dx,al
	ret
;“赵”写字
write:
	push	ax
	push	si
	push	bx
	push	bp
	push	cx
	mov	bp,0
	mov	cx,0
	
	mov	ax,[Y]			
	mov	bx,320
	mul		bx
	add		ax,[X]	
	mov	bx,ax
x1:
	add		bx,cx	
	mov	si,0
x0:	cmp	si,15
	ja		x2
	mov	al,[wd0+bp+si]
	mov	[ds:bx+si],al
	inc		si
	jmp		x0

x2:	add		bp,16
	mov	cx,320
	cmp	bp,255
	ja		x3
	jmp		x1

x3:
	pop		cx
	pop		bp
	pop		bx
	pop		si
	pop		ax
	ret	


;计算画线地址
dizhi:					;计算地址
	mov	bx,[es:di]
	mov	ax,[es:di+2]
	mov	dx,320
	mul		dx	
	add		bx,ax	

	mov	bp,[es:di+4]
	mov	ax,[es:di+6]
	mov	dx,320
	mul		dx		
	add		bp,ax	
	ret
dizhi1:					;地址1
	mov	bx,[es:di]
	mov	ax,[es:di+2]
	mov	dx,320
	mul		dx	
	add		bx,ax	

	mov	bp,[es:di+4]
	mov	ax,[es:di+2]
	mov	dx,320
	mul		dx		
	add		bp,ax	
	ret
dizhi2:					;地址2
	mov	bx,[es:di]
	mov	ax,[es:di+2]
	mov	dx,320
	mul		dx	
	add		bx,ax	

	mov	bp,[es:di]
	mov	ax,[es:di+6]
	mov	dx,320
	mul		dx		
	add		bp,ax	
	ret
dizhi3:					;地址3
	mov	bx,[es:di]
	mov	ax,[es:di+6]
	mov	dx,320
	mul		dx	
	add		bx,ax	

	mov	bp,[es:di+4]
	mov	ax,[es:di+6]
	mov	dx,320
	mul		dx		
	add		bp,ax	
	ret
dizhi4:					;地址4
	mov	bx,[es:di+4]
	mov	ax,[es:di+2]
	mov	dx,320
	mul		dx	
	add		bx,ax	

	mov	bp,[es:di+4]
	mov	ax,[es:di+6]
	mov	dx,320
	mul		dx		
	add		bp,ax	
	ret


heng:				;画横线
	cmp	bx,bp
	ja		h1
	mov	byte [ds:bx],1
	add		bx,1
	jmp		heng
h1:	ret
shu:					;画竖线
	cmp	bx,bp
	ja		h2
	mov	byte [ds:bx],1
	add		bx,320
	jmp		shu
h2:	ret

fang:	
	call 		dizhi1
	call 		heng

	call 		dizhi2
	call 		shu

	call 		dizhi3
	call 		heng

	call 		dizhi4
	call		shu
	ret
col:					;画线颜色
	mov	dx,0x3c8
	mov	al,[si]
	out	dx,al

	mov	dx,0x3c9
	mov	al,[si+1]
	out	dx,al

	mov	al,[si+2]
	out	dx,al

	mov	al,[si+3]
	out	dx,al
	add	si,4
	ret


