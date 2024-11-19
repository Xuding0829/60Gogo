org 0x8400
jmp uboot

;--------------------------------------------------------------data segment--------------------------------------------------
rex_start			db	00000000b,00000000b,01111111b,11111100b		;37*32
			db	00000000b,00000000b,01111111b,11111100b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11100111b,11111111b
			db	00000000b,00000001b,11100111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111110b,00000000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11100000b,00000001b,11111000b,00000000b
			db	11100000b,00000111b,11111000b,00000000b
			db	11110000b,00000111b,11111000b,00000000b
			db	11110000b,00011111b,11111111b,11000000b
			db	11111000b,01111111b,11111111b,11000000b
			db	11111000b,01111111b,11111000b,11000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	01111111b,11111111b,11100000b,00000000b
			db	00111111b,11111111b,11100000b,00000000b
			db	00011111b,11111111b,11100000b,00000000b
			db	00001111b,11111111b,10000000b,00000000b
			db	00000111b,11111111b,10000000b,00000000b
			db	00000111b,11111110b,00000000b,00000000b
			db	00000111b,10011110b,00000000b,00000000b
			db	00000111b,10011110b,00000000b,00000000b
			db	00000110b,00000110b,00000000b,00000000b
			db	00000110b,00000110b,00000000b,00000000b
			db	00000111b,10000111b,10000000b,00000000b
			db	00000111b,10000111b,10000000b,00000000b

rex_runl			db	00000000b,00000000b,01111111b,11111100b		
			db	00000000b,00000000b,01111111b,11111100b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11100111b,11111111b
			db	00000000b,00000001b,11100111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111110b,00000000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11100000b,00000001b,11111000b,00000000b
			db	11100000b,00000111b,11111000b,00000000b
			db	11110000b,00000111b,11111000b,00000000b
			db	11110000b,00011111b,11111111b,11000000b
			db	11111000b,01111111b,11111111b,11000000b
			db	11111000b,01111111b,11111000b,11000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	01111111b,11111111b,11100000b,00000000b
			db	00111111b,11111111b,11100000b,00000000b
			db	00011111b,11111111b,11100000b,00000000b
			db	00001111b,11111111b,10000000b,00000000b
			db	00000111b,11111111b,10000000b,00000000b
			db	00000011b,11111110b,00000000b,00000000b
			db	00000011b,00011110b,00000000b,00000000b
			db	00000011b,10011110b,00000000b,00000000b
			db	00000011b,10000110b,00000000b,00000000b
			db	00000000b,00000110b,00000000b,00000000b
			db	00000000b,00000111b,10000000b,00000000b
			db	00000000b,00000111b,10000000b,00000000b

rex_runr			db	00000000b,00000000b,01111111b,11111100b		
			db	00000000b,00000000b,01111111b,11111100b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11100111b,11111111b
			db	00000000b,00000001b,11100111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111110b,00000000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11100000b,00000001b,11111000b,00000000b
			db	11100000b,00000111b,11111000b,00000000b
			db	11110000b,00000111b,11111000b,00000000b
			db	11110000b,00011111b,11111111b,11000000b
			db	11111000b,01111111b,11111111b,11000000b
			db	11111000b,01111111b,11111000b,11000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	01111111b,11111111b,11100000b,00000000b
			db	00111111b,11111111b,11100000b,00000000b
			db	00011111b,11111111b,11100000b,00000000b
			db	00001111b,11111111b,10000000b,00000000b
			db	00000111b,11111111b,10000000b,00000000b
			db	00000111b,11111110b,00000000b,00000000b
			db	00000111b,10001110b,00000000b,00000000b
			db	00000111b,10001111b,10000000b,00000000b
			db	00000110b,00000000b,00000000b,00000000b
			db	00000110b,00000000b,00000000b,00000000b
			db	00000111b,10000000b,00000000b,00000000b
			db	00000111b,10000000b,00000000b,00000000b

rex_die			db	00000000b,00000000b,01111111b,11111100b		
			db	00000000b,00000000b,01111111b,11111100b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11100011b,11111111b
			db	00000000b,00000001b,11101011b,11111111b
			db	00000000b,00000001b,11100011b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	00000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111111b,11111111b
			db	11000000b,00000001b,11111110b,00000000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11000000b,00000001b,11111111b,11111000b
			db	11100000b,00000001b,11111000b,00000000b
			db	11100000b,00000111b,11111000b,00000000b
			db	11110000b,00000111b,11111000b,00000000b
			db	11110000b,00011111b,11111111b,11000000b
			db	11111000b,01111111b,11111111b,11000000b
			db	11111000b,01111111b,11111000b,11000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	11111111b,11111111b,11111000b,00000000b
			db	01111111b,11111111b,11100000b,00000000b
			db	00111111b,11111111b,11100000b,00000000b
			db	00011111b,11111111b,11100000b,00000000b
			db	00001111b,11111111b,10000000b,00000000b
			db	00000111b,11111111b,10000000b,00000000b
			db	00000111b,11111110b,00000000b,00000000b
			db	00000111b,10011110b,00000000b,00000000b
			db	00000111b,10011110b,00000000b,00000000b
			db	00000110b,00000110b,00000000b,00000000b
			db	00000110b,00000110b,00000000b,00000000b
			db	00000111b,10000111b,10000000b,00000000b
			db	00000111b,10000111b,10000000b,00000000b


i16				dw	0h			;一些暂时变量
i8				db	0											
j8				db	0
s8				db	01101110b
n8				db  0h


rex_site		dw	130d,80d			;显示图形时的主要数据
rex_site_before	dw	130d,80d

timer_flag1		dw	0h
timer_flag2		dw	0h
timer_flag3		dw	0h
timer_flag4		dw	0h
timer_flag5		dw	0h

v_init			dw	14d
rex_v			dw	0h
g				dw	1h
co_detection	dw	0h											;控制碰撞检测
queue_O_length	dw	6h											;when you change the roadblock's(queue_O) number this option must been change to fit it
queue_I_length	dw	0h
queue_O			dw		20d,330d,0h,	22d,600d,0h,	24d,1000d,0h,	26d,1500d,0h,		;high,position,flag
				dw		28d,2000d,0h,	20d,2100d,0h,	450d,32d,0h,	470d,34d,0h,
				dw		490d,36d,0h,	510d,38d,0h,	530d,40d,0h,	550d,42d,0h,
			
queue_I			dw		20d,330d,0h,	22d,600d,0h,	24d,1000d,0h,	26d,1500d,0h,		;high,position
				dw		28d,2000d,0h,	20d,2100d,0h,	450d,32d,0h,	470d,34d,0h,
				dw		490d,36d,0h,	510d,38d,0h,	530d,40d,0h,	550d,42d,0h,

newposition		dw	0000h										;新位置，用于传输参数
point1			dw	30d,48d										;保存点1的位置
display_matrix_option	dw	0h,0h,0h,0h
			db	0h


rex_state		db	1h
rex_picture		db	1h											;1:正常图像  2:奔跑图像1  3:奔跑图像2  4:死亡
v_flag			db	0h											;0:rex_v 代表 -   1:rex_v 代表 +
rex_picture_next	db	2h
;-----------------------------------------------------------公用功能-----------------------------------------------------------
%macro add16 2
	mov ax,%1
	add ax,%2
	mov %1,ax
%endmacro

; 背景颜色的设置
%macro setcolor 4
	mov dx,0x3c8
	mov al,%1
	out dx,al
	mov dx,0x3c9
	mov al,%2
	out dx,al
	mov dx,0x3c9
	mov al,%3
	out dx,al
	mov dx,0x3c9
	mov al,%4
	out dx,al	
%endmacro

;AX16位寄存器累加器
%macro assigndw	2
	mov ax,%2
	mov %1,ax
%endmacro

;AL8位寄存器累加器
%macro assigndb	2
	mov al,%2
	mov %1,al
%endmacro


;给点（列、行）返回新位置的地址
%macro find_site 2		
	mov cx,%1
	dec cx
	mov ax,320d					
	mul cx				;ax*cx
	add ax,%2
	dec ax
	mov [newposition],ax
%endmacro
;---------------------------------------------------------------一些为了展示的设置-----------------------------------------------------------
;%1:列数  %2:行数
;%3:矩阵高度		  %4:矩阵宽度		%5:颜色
display_matrix:          ;矩阵
	;local matrixloop1,matrixloop1_in,matrixloop2,matrixloop2_in,matrixoutloop2,matrixoutloop1	
	mov ax,[display_matrix_option]		;检查点的位置是否超出限制
	add ax,[display_matrix_option+4]
	cmp ax,200d
	jbe matrix_noting			;小于或等于时跳转
	mov ax,200d
	sub ax,[display_matrix_option]		;sub减法
	inc ax
	mov [display_matrix_option+4],ax

matrix_noting:
	mov ax,[display_matrix_option+2]
	add ax,[display_matrix_option+6]
	cmp ax,320d
	jbe matrix_noting_
	mov ax,320d
	sub ax,[display_matrix_option+2]
	inc ax
	mov [display_matrix_option+6],ax

matrix_noting_:
	find_site [display_matrix_option],[display_matrix_option+2]	;左上角位置
	mov si,[newposition]		
	mov ax,0
	cmp ax,[display_matrix_option+4]
	je matrixoutloop1
	jmp matrixloop1_in

matrixloop1:
	inc ax
	cmp ax,[display_matrix_option+4]
	je matrixoutloop1

matrixloop1_in:
	mov bx,0
	cmp bx,[display_matrix_option+6]
	je matrixoutloop2
	jmp matrixloop2_in

matrixloop2:
	inc bx
	cmp bx,[display_matrix_option+6]
	je matrixoutloop2
	
matrixloop2_in:
	mov dx,[co_detection]	;碰撞检测
	cmp dx,1
	jne no_detection
	mov dl,[es:si]
	cmp dl,3
	je game_over
	jmp no_detection

no_detection:
	mov cl,byte[display_matrix_option+8]
	mov byte[es:si],cl
	inc si
	jmp matrixloop2

matrixoutloop2:
	add si,320d
	sub si,[display_matrix_option+6]
	jmp matrixloop1

matrixoutloop1:
	ret


;显示矩阵 高，宽，行，列，颜色
%macro display_matrix_  5
	assigndw [display_matrix_option],%1
	assigndw [display_matrix_option+2],%2
	assigndw [display_matrix_option+4],%3
	assigndw [display_matrix_option+6],%4
	assigndb [display_matrix_option+8],%5
	call display_matrix
%endmacro

;清屏
%macro cls 0
	display_matrix_ 1,1,200,320,0
%endmacro

;从字节数据打印8像素
print_byte:			
	mov bl,10000000b
	mov al,0
	dec si

print_byte_start:
	cmp al,8
	je print_byte_end		;等于跳转
	inc al
	mov bh,[s8]
	and bh,bl			;进行与运算
	inc si
	shr bl,1
	cmp bh,0
	je print_byte_start
	;mov cl,3
	mov byte[es:si],cl
	jmp print_byte_start

print_byte_end:
	ret

;展示图形
display_rex:
	assigndb [i8],0
rex_loop1:
	mov al,[i8]
	cmp al,37d
	je rex_loop1_out
	assigndb [j8],0
rex_loop2:
	mov al,[j8]
	cmp al,4d
	je rex_loop2_out
	assigndb [s8],[di]
	mov cl,3		;如果要更改rex的颜色，则应更改cl的值，并且必须更改碰撞检测
	call print_byte
	inc di
	mov al,[j8]
	inc al
	mov [j8],al
	jmp rex_loop2
rex_loop2_out:
	add si,320d
	sub si,28d	
	mov al,[i8]
	inc al
	mov [i8],al
	jmp rex_loop1
rex_loop1_out:
	ret 


%macro display_rex_ 3
	find_site %1,%2
	mov si,[newposition]
	mov di,%3
	call display_rex
%endmacro


show_picture:
	display_matrix_ [rex_site_before],[rex_site_before+2],37,32,0		;删除旧的图片
	mov al,[rex_picture]
	cmp al,1
	jne not_picture1
	display_rex_ [rex_site],[rex_site+2],rex_start				;展示初始动作图片
	ret
not_picture1:
	cmp al,2
	jne not_picture2
	display_rex_ [rex_site],[rex_site+2],rex_runl				;展示奔跑图片1
	ret
not_picture2:
	cmp al,3
	jne not_picture3
	display_rex_ [rex_site],[rex_site+2],rex_runr				;展示奔跑图片2
	ret
not_picture3:
	display_rex_ [rex_site],[rex_site+2],rex_die				;展示死亡图片
	ret

;------------------------------------------------------------控制的算法------------------------------------------------------------
updata_position:	;当人物离开地面时，可以找到人物适合的位置
	mov al,[v_flag]
	cmp al,0
	je v_negative
	mov cx,[g]
	mov bx,[rex_v]
	mov ax,[rex_site]
	add bx,cx
	mov [rex_v],bx
	add ax,bx
	mov [rex_site],ax
	mov ax,[v_init]
	mov bx,[rex_v]
	cmp bx,ax
	jne updata_position_end
	assigndb [rex_state],1
	assigndb [rex_picture],2
	assigndb [rex_picture_next],3
	ret
v_negative:
	mov cx,[g]
	mov bx,[rex_v]
	mov ax,[rex_site]
	sub ax,bx
	mov [rex_site],ax
	sub bx,cx
	mov [rex_v],bx
	mov bx,[rex_v]
	cmp bx,0
	jne updata_position_end
	assigndb [v_flag],1
updata_position_end:
	ret




updata_queue_O:						;queue_O用于控制路障
	mov di,queue_O+2				;di用于保存地址
	mov cx,[queue_O_length]
	cmp cx,0
	je queue_O_not_show
queue_O_loop1_start:
	cmp cx,0
	je queue_O_loop1_end
	mov bx,[di]
	dec bx
	mov [di],bx
	add di,6
	dec cx
	jmp queue_O_loop1_start
queue_O_loop1_end:					;位置进行递减
	mov ax,word[queue_O+2]			;检查是否超过限制
	cmp ax,320d
	ja queue_O_not_show
	mov cx,[queue_I_length]			;更新长度
	inc cx
	mov [queue_I_length],cx
	mov cx,[queue_O_length]
	dec cx
	mov [queue_O_length],cx
	mov di,queue_O					;取出queue_I的第一个元素
	mov ax,[queue_I_length]
	dec ax
	mov cx,6
	mul cx
	mov si,ax
	assigndw word[queue_I+si],[di]
	assigndw word[queue_I+si+2],[di+2]
	assigndw word[queue_I+si+4],[di+4]
	mov di,queue_O
	mov cx,[queue_O_length]
queue_O_loop2_start:                                                                                                                                                                                                                                                                                                                                                                                                        
	cmp cx,0
	je queue_O_loop2_end
	assigndw [di],[di+6]
	assigndw [di+2],[di+8]
	assigndw [di+4],[di+10]
	add di,6
	dec cx
	jmp queue_O_loop2_start
queue_O_loop2_end:
	queue_O_not_show:
	ret



updata_queue_I:
	mov di,queue_I+2				;di 用来保存地址
	mov cx,[queue_I_length]
	cmp cx,0
	je queue_I_not_show
queue_I_loop1_start:
	cmp cx,0
	je queue_I_loop1_end
	mov bx,[di]
	dec bx
	mov [di],bx
	add di,6
	dec cx
	jmp queue_I_loop1_start
queue_I_loop1_end:				;位置进行递减
	mov ax,word[queue_I+2]			;检查是否超过限制
	cmp ax,0d
	ja queue_I_not_show
	mov cx,[queue_I_length]			;更新长度
	dec cx
	mov [queue_I_length],cx
	mov cx,[queue_O_length]
	inc cx
	mov [queue_O_length],cx
	mov di,queue_I					;取出queue_O的第一个元素
	mov ax,[queue_O_length]
	dec ax
	mov cx,6
	mul cx
	mov si,ax
	assigndw word[queue_O+si],[di]
	assigndw word[queue_O+si+2],2500d			;改变位置
	assigndw word[queue_O+si+4],0d
	mov di,queue_I
	mov cx,[queue_I_length]
queue_I_loop2_start:
	cmp cx,0
	je queue_I_loop2_end
	assigndw [di],[di+6]
	assigndw [di+2],[di+8]
	assigndw [di+4],[di+10]
	add di,6
	dec cx
	jmp queue_I_loop2_start
queue_I_loop2_end:
queue_I_not_show:
	ret


show_roadblock:					; 显示路障
	mov di,queue_I			
	assigndw [i16],[queue_I_length]
show_roadblock_loop1_start:
	mov cx,[i16]
	cmp cx,0
	je show_roadblock_loop1_end
	mov ax,[di+4]
	cmp ax,1
	je not_show_roadblock
	mov ax,167d
	sub ax,[di]
	mov [display_matrix_option],ax
	assigndw [display_matrix_option+2],[di+2]
	assigndw [display_matrix_option+4],[di]
	assigndw [display_matrix_option+6],2d
	assigndb [display_matrix_option+8],[i8]
	call display_matrix
	add di,6
	mov cx,[i16]
	dec cx
	mov [i16],cx
	jmp show_roadblock_loop1_start
	jmp show_roadblock_loop1_end
not_show_roadblock:
show_roadblock_loop1_end:	
	ret			


%macro show_roadblock_ 1
	assigndb [i8],%1
	call show_roadblock
%endmacro

;--------------------------------------------------展示角色-----------------------------------------
display_character:                  
	assigndb [i8],0
	display_character_loop1:
	mov al,[i8]
	cmp al,17d                       ;矩阵行数变换的都是也需要改变
	je display_character_loop1_out
	assigndb [j8],0
display_character_loop2:
	mov al,[j8]
	cmp al,1d                   ;矩阵行/4
	je display_character_loop2_out
	assigndb [s8],[di]
	call print_byte
	inc di
	mov al,[j8]
	inc al
	mov [j8],al
	jmp display_character_loop2
display_character_loop2_out:
	add si,320d
	sub si,7d	     	;矩阵行*7/8
	mov al,[i8]
	inc al
	mov [i8],al
	jmp display_character_loop1
display_character_loop1_out:
	ret 

;%1 %2:位置 %3:颜色 %4:数据
;for example    display_character_ 5,20h,1,character_m
%macro display_character_	4	
	find_site %1,%2
	mov si,[newposition]
	mov di,%4
	mov cl,%3
	call display_character
%endmacro

;-----------------------------------------------------------中断功能-----------------------------------------------------
int_8_timer:
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	push es

	add16 [timer_flag1],1
	add16 [timer_flag2],1
	add16 [timer_flag3],1
	add16 [timer_flag4],1
	add16 [timer_flag5],1

	mov al,0x20			
	mov dx,0x20
	out dx,al

	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	iret

key_put_in:
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	push es

	mov dx,0x20			;中断响应，退出优先级,中断芯片的端口20
	mov al,0x61
	out dx,al
	mov dx,0x60			;键盘地址60
	in al,dx

	cmp al,0x1e			;0x1e
	je A
	jmp key_put_in_end

	A:
	mov al,[rex_state]
	cmp al,0
	je key_put_in_end
	assigndb [rex_state],0
	assigndw [rex_v],[v_init]
	assigndb [v_flag],0d
	assigndb [rex_picture],1
	assigndb [rex_picture_next],1
	jmp key_put_in_end

	key_put_in_end:

	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	iret



;----------------------------------------------------------------主运行-------------------------------------------------------------
uboot:
	;320行 200列
	;start memory: a000h 0xa000
	mov al,0x13
	mov ah,0x00
	int 0x10					;中断，进入显示模式

	mov ax,0xa000	
  	mov es,ax						;es 作为视频存储器扇区地址
	mov ax,0
	mov ds,ax		

	mov word[ds:0x20],int_8_timer			;启用中断							
	mov word[ds:0x22],0
	mov word[ds:0x24],key_put_in
	mov word[ds:0x26],0
	sti

	setcolor 0,255d,255d,255d		;设置背景颜色
	
	;主操作在循环中。timer1和timer2是针对不同时间长度的不同请求设置的。
	mov ax,[rex_site]
	add ax,37d						
	display_matrix_  ax,1,3,320d,2	;道路的显示
	
main_opration:   
	mov al,[rex_state]
	cmp al,1
	je rex_state1
	mov ax,[timer_flag1]
	cmp ax,10d					;用于改变时间长度
	jb out_updata
	assigndw [timer_flag1],0
	assigndb [rex_picture],1
	assigndb [rex_picture_next],1
	call updata_position
	call show_picture
	assigndb [rex_picture],[rex_picture_next]
	assigndw [rex_site_before],[rex_site]
	assigndw [rex_site_before+2],[rex_site+2]
	jmp out_updata

rex_state1:
	mov ax,[timer_flag2]
	cmp ax,15d				;用于改变时间长度
	jb out_updata
	assigndw [timer_flag2],0
	mov al,[rex_picture]
	cmp al,2
	jne rex_picture_next3
	assigndb [rex_picture_next],3
	jmp rex_picture_next_
	rex_picture_next3:
	cmp al,3
	jne rex_picture_next_
	assigndb [rex_picture_next],2
rex_picture_next_:
	call show_picture
	assigndb [rex_picture],[rex_picture_next]
	assigndw [rex_site_before],[rex_site]
	assigndw [rex_site_before+2],[rex_site+2]
out_updata:
	mov ax,[timer_flag3]
	cmp ax,2d				;用于改变时间长度
	jb next_check
	assigndw [timer_flag3],0
	show_roadblock_ 0		                ;clear
	call updata_queue_O
	call updata_queue_I
	assigndw [co_detection],1h		;打开检测功能
	show_roadblock_ 1			;当发生冲突时，游戏结束
	assigndw [co_detection],0h		;关闭检测功能
next_check:
	jmp main_opration

game_over:								;游戏结束，显示人物死亡图片
	assigndw [co_detection],0h
	assigndb [rex_picture],4
	call show_picture
	
jmp $	


	



