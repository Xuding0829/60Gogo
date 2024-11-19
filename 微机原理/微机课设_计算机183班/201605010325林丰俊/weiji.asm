ORG 8400H
               ;字符串声明
	jmp    _start
	INPUT_MSG     db 'Please input your password'
	WELCOME_MSG	db 'Welcome!'
	ERROR_MSG      db 'Password error'
	PASSWD         db '000000'

;字符矩阵		
wenzi:
db 1,0,0,0,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1
db 1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0
db 1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0
db 1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,0,0,0
db 1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0
db 1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0
db 1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0
db 1,1,1,1,1,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0

;矩形位置
location:
dw 16100,16220,54500,54620

switch:
dw 0

;-----------------------------
;初始化
_start:
    mov     ax, 0b800h	; 显示地址：B8000H
	mov     es, ax
	mov     bx, 0        ; 地址
	mov     ah, 00h	    ; 背景

clear_screen:
	cmp     bx, 4000
	JG      print_input_ready
	mov     al, ' '
	mov     [es:bx], ax
	inc     bx
	inc     bx
	jmp     clear_screen

print_input_ready:
	mov     ax, 0
	mov     ds, ax
	mov     di, 0
	mov     bx, INPUT_MSG

print_input:
	mov     ah, 0ch
	cmp     di, 50
	JG      input_ready  ;有符号的大于
	mov     al, [ds:bx]
	mov     [es:di], ax
	inc     di
	inc     di
	inc     bx
	jmp     print_input

input_ready:
	mov     di, 160
	mov     bx, PASSWD
	mov     bp, 0
	jmp     input

input:
	cmp     di, 170
	JG      judge_welcome_or_error
	mov     ah, 0x00			;从键盘读入字符送AL寄存器。执行时，等待键盘输入，一旦输入，字符的ASCII码放入AL中。
					;若AL＝0，则AH为输入的扩展码。 
	int     0x16
	mov     ah, 0x0e
	int     0x10
	cmp     al, [ds:bx]
	JNZ     judge_passwd_error
	mov     [es:di], ax
	inc     di
	inc     di
	inc     bx
	jmp     input

; bp为判断是否输入错误flag
judge_passwd_error:
	mov     bp, 1
	mov     [es:di], ax
	inc     di
	inc     di
	inc     bx
	jmp     input

judge_welcome_or_error:
	cmp     bp, 1
	JNZ     print_welcome_ready
	jmp     print_error_ready

print_welcome_ready:
	mov     bx, WELCOME_MSG
	mov     di, 320
	jmp     print_welcome

print_welcome:
	cmp     di, 334
	JG      clear_screen1			;有符号大于跳转
	mov     al, [ds:bx]
	mov     [es:di], ax
	inc     di
	inc     di
	inc     bx
	jmp     print_welcome

print_error_ready:
	mov     bx, ERROR_MSG
	mov     di, 320
	jmp     print_error

print_error:
	cmp     di, 346
	JG      _end
	mov     al,[ds:bx]
	mov     [es:di],ax
	inc     di
	inc     di
	inc     bx
	jmp     print_error
	
_end:
	jmp $
;-------------------------

clear_screen1:      				;进入主界面前的清屏
	mov     ah, 0x00
    	mov     al, 0x03
    	int     0x10
	
;-------------进入主界面-------------
start0:
	sti				;开中断
	mov ax, 0
	mov si, 0
	mov ds, ax			;ds寄存器
	mov al, 48			;像素值
					;必须先指定ah寄存器为以下显示服务编号之一
	mov ah, 0ch			;以指定需要调用的功用。0CH： 写图形象素
int_time0:
	mov bx, 0b800h			;显存段基址
	mov ds, bx			;内存单元的段地址要放在ds中,供后面字符使用
	mov [ds:si], ax

	inc al				;'a'开始 所有ASCII码字符输出 到ASCII  122 
	add si,8				;每次位置加8 
	
	cmp si, 3200
	jbe out1
	mov si, 0

out1:	cmp al, 122
	jbe out2
	mov al, 48
	
out2:	push ax
	mov al, 0x20			;横坐标
	mov dx, 0x20			;纵坐标
	out dx, al
	pop ax

check:
	push ax
	push bx
	push es
	

	call int_key0
	mov ax, cs
	mov es, ax
	mov bx, switch
	mov ax, [es:bx]
	cmp ax, 1
	je start

	pop es
	pop bx
	pop ax

 	jmp int_time0

int_key0:
	push es
	push dx
	push ax
	push bx

	mov ah, 01h			;设置光标形状
	int 16h	    			;中断

	cmp al, ' '
	jne ignore			;不等于' '
	
	mov ax, cs
	mov es, ax
	mov bx, switch
	mov ax, 1				;显存变为1 画图
	mov [es:bx], ax
ignore:
	pop bx
	pop ax
	pop dx
	pop es
	ret 



start:					
	pop es
	pop bx
	pop ax

	mov cx,13
	mov si,0
	mov ah, 00h			;设置显示器模式
	mov al, 13h			;640X480 256色
	int 10h				;中断 

	mov ax, cs
	mov ds, ax

star:					;每次循环接受输入
	mov ah, 0
	int 16h				;从键盘接受一个字符

	cmp al, 'c'
	jz clear



	cmp al, 'a'
	jz cha
	cmp al, 'd'
	jz chd
	
	cmp al, 'w'
	jz chw
	cmp al, 's'
	jz chs

	cmp al, 'k'
	jz huawenzi

	
	jmp star


chp:
	mov cx,56
	jmp paint

cho:
	mov cx,28
	jmp paint


cha:
	sub si,10
	jmp paint

chd:
	add si,10
	jmp paint

chw:
	sub si,640
	jmp paint

chs:
	add si,640
	jmp paint

paint:
	mov al,0x13
	mov ah,0x00
	int 0x10

	mov ax,0a000h
	mov es,ax
	mov di,0

x:
s4:
	cmp di, 64000
	ja rect
	mov al,0
	mov [es:di],al
	add di,1
	jmp s4

rect:
	push ax
	push cx
	push di

	mov di,location
	mov cx,[ds:di]
	mov bx, cx
	add di,2
	mov cx,[ds:di]
	mov dx, cx

	pop di
	pop cx
	pop ax	
	mov ax, cx
	add bx, si
	add dx, si


loop3:	mov [es:bx], ax
	inc bx
	cmp bx, dx
	jb loop3 



	push ax
	push cx
	push di

	mov di,location
	mov cx,[ds:di]
	mov bx, cx
	add di,4
	mov cx,[ds:di]
	mov dx, cx

	pop di
	pop cx
	pop ax
	
		
	;mov bx, 16100
	;mov dx, 54500
	add bx, si
	add dx, si

loop4:	mov [es:bx], ax
	add bx, 320
	cmp bx, dx
	jb loop4


	push ax
	push cx
	push di

	mov di,location
	add di,2
 	mov cx,[ds:di]
	mov bx, cx
	add di,4
	mov cx,[ds:di]
	mov dx, cx
	pop di
	pop cx
	pop ax
	
	;mov bx, 16220
	;mov dx, 54620
	add bx, si
	add dx, si
	
loop5: 	mov [es:bx], ax
	add bx, 320
	cmp bx, dx
	jb loop5


	push ax
	push cx
	push di
	mov di,location
	add di,4
 	mov cx,[ds:di]
	mov bx, cx
	add di,2
	mov cx,[ds:di]
	mov dx, cx
	pop di
	pop cx
	pop ax
		
	;mov bx, 54500
	;mov dx, 54620
	add bx, si
	add dx, si
loop6: 	
	mov [es:bx], ax
	inc bx
	cmp bx, dx
	jb loop6

	jmp star

huawenzi:
	push cx
	mov ax,150
	mov bx,350

	push ax
	push bx

	mov ax,cs
	mov ds,ax

	mov ax,0a000h
	mov es,ax

	pop bx
	pop ax
	mov di,ax
	mov cx,bx

	drawTextMul:
	cmp cx,0
	je drawTextMain
	add di,320
	dec cx
	jmp drawTextMul

drawTextMain:
        	push ax
        	push bx
        	mov cx,8
        	mov bx,wenzi

drawTextRow:
	push cx
	mov cx,20

drawTextCol:
	mov al,[ds:bx]
	mov [es:di],al
 	inc di
	inc bx
	loop drawTextCol
	add di,300
	pop cx
	loop drawTextRow

	pop ax
	pop bx
	pop cx
	jmp star

clear:
	mov di,0




	
	
