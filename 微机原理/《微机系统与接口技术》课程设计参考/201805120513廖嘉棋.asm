org 0x8400
jmp start

string  db 0

start:
	mov al,0x13
	mov ah,0x00	 
	INT 0x10
	mov ax,0x0a000             		;(往显存0xa0000开始)	
	mov ds,ax
			
	mov ax,0		
	mov es,ax

	mov word[es:0x24],int_key
	mov word[es:0x26],0
	mov si,30				;改变颜色	
	sti	


;主界面
space:	
                cmp byte[string],0xB9 	;此处响应空格键进入主界面并播放两只老虎
	je h1
	jmp space
h1:	;两只老虎
	call display
	mov bx,4571        ;1do
	call music
	mov bx,4058        ;2re
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4571
	call music
	call musicdelay
	mov bx,4571
	call music
	mov bx,4058
	call music
	mov bx,3615
	call music
	mov bx,4571
	call music
	call musicdelay
	mov bx,3615       
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3043        ;5sol
	call music
	call musicdelay
	mov bx,3615       
	call music
	mov bx,3418
	call music
	mov bx,3043
	call music
	call musicdelay
	mov bx,3043
	call music
	mov bx,2711        ;6la
	call music
	mov bx,3043
	call music
	mov bx,3418
	call music
	mov bx,3615
	call music
	mov bx,4571
	call music
	call musicdelay
	mov bx,3043
	call music
	mov bx,2711
	call music
	mov bx,3043
	call music
	mov bx,3418
	call music
	mov bx,3615
	call music
	mov bx,4571
	call music
	call musicdelay
	mov bx,4058
	call music
	mov bx,3043
	call music
	mov bx,4571
	call music
	call musicdelay
	mov bx,4058
	call music
	mov bx,3043
	call music
	mov bx,4571
	call music
	;mov bx,2415        ;7xi
	;call music
	jmp next
	
next:	;响应各种键盘输入
	cmp byte[string],0xa4
	je h2
	cmp byte[string],0xa5 ;设置注意为break处
	je h3
                cmp byte[string],0x1e	
	je k1
	cmp byte[string],0x1f
	je k2
	cmp byte[string],0x11
	je k3
	cmp byte[string],0x20
	je k4
                cmp byte[string],0x02	
	je do
	cmp byte[string],0x03
	je re
	cmp byte[string],0x04
	je mi
	cmp byte[string],0x05
	je fa
                cmp byte[string],0x06	
	je so
	cmp byte[string],0x07
	je la
	cmp byte[string],0x08
	je xi
	cmp byte[string],0x01
	je clc
	jmp next	
h2:	mov byte[string],0     ;将按键置数0，此时只能切换一次颜色按1单个切换颜色
	call display
	jmp next
h3:	call display  ;一直变色，按2变色
	jmp next	
		
;自由输入歌曲
do:          	mov bx,4571
	call music
                jmp next
re:          	mov bx,4508
	call music
                jmp next
mi:          	mov bx,3615
	call music
                jmp next
fa:          	mov bx,3418
	call music
                jmp next
so:          	mov bx,3043
	call music
                jmp next
la:          	mov bx,2711
	call music
                jmp next
xi:          	mov bx,2415
	call music
                jmp next


;播放已有歌曲
k1:	
	call display
                ;a键 播放摇啊摇
                mov bx,4571        ;1do
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	call musicdelay
                mov bx,4571        ;1do
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	call musicdelay
                mov bx,4571        ;1do
	call music
                mov bx,4571        ;1do
	call music
	mov bx,4058        ;2re
	call music
	mov bx,4058        ;2re
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
                mov bx,4571        ;1do
	call music
	call musicdelay
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,4058        ;2re
	call music
	call sdelay
                mov bx,4571        ;1do
	call music
	jmp next
	
k2:	
	call display
                ;s键 播放粉刷匠
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
                mov bx,4571        ;1do
	call music
	call musicdelay
	mov bx,4058        ;2re
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	mov bx,3043        ;5sol
	call music
	call musicdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
                mov bx,4571        ;1do
	call music
	call musicdelay
	mov bx,4058        ;2re
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
                mov bx,4571        ;1do
	call music
	call musicdelay
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	call musicdelay
	mov bx,4058        ;2re
	call music
	mov bx,4058        ;2re
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
                mov bx,4571        ;1do
	call music
	mov bx,3043        ;5sol
	call music
	call musicdelay
	mov bx,4058        ;2re
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	mov bx,3043        ;5sol
	call music
	call musicdelay
                mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
                mov bx,4571        ;1do
	call music
	call musicdelay
	mov bx,4058        ;2re
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
                mov bx,4571        ;1do
	call music   
	jmp next
	
k3:
	call display
                ;w键 播放征服
	mov bx,3043        ;5sol
	call music
                mov bx,4571        ;1do
	call music	
	mov bx,2415        ;7xi
	call music
	mov bx,3043        ;5sol
	call music
	call sdelay
	mov bx,3043        ;5sol
	call music
	mov bx,2711        ;6la
	call music
	mov bx,3043        ;5sol
	call music
	call musicdelay
	mov bx,3043        ;5sol
	call music
                mov bx,4571        ;1do
	call music	
	mov bx,2415        ;7xi
	call music
	mov bx,3043        ;5sol
	call music
	call sdelay
	mov bx,2711        ;6la
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,2711        ;6la
	call music
	call musicdelay
	mov bx,2711        ;6la
	call music
	mov bx,2711        ;6la
	call music
	mov bx,2711        ;6la
	call music
	mov bx,3043        ;5sol
	call music
	mov bx,3615        ;3mi
	call music
	call sdelay
	mov bx,3615        ;3mi
	call music
	mov bx,3418        ;4fa
	call music
	call musicdelay
	mov bx,3418        ;4fa
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
               mov bx,4571        ;1do
	call music
	call sdelay
	mov bx,4058        ;2re
	call music
                mov bx,4571        ;1do
	call music
	jmp next


k4:
                call display
                ;d键 播放小星星
                mov bx,4571        ;1do
	call music	
                mov bx,4571        ;1do
	call music	
	mov bx,3043        ;5sol
	call music
	mov bx,3043        ;5sol
	call music
	mov bx,2711        ;6la
	call music
	mov bx,2711        ;6la
	call music
	mov bx,3043        ;5sol
	call music
	call musicdelay
	mov bx,3418        ;4fa
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	mov bx,4058        ;2re
	call music
                mov bx,4571        ;1do
	call music	
	call musicdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3043        ;5sol
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	call musicdelay
	mov bx,3043        ;5sol
	call music
	mov bx,3043        ;5sol
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3418        ;4fa
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,3615        ;3mi
	call music
	mov bx,4058        ;2re
	call music
	jmp next
	
                

;界面设计
display:
	call huamiandelay
	inc si
	;画框
	mov ax,15
	mov bx,10   ;完整性
	mov cx,310
	call DrawLineHeng
	mov bx,10
	mov ax,15
	mov cx,180
	call DrawLineShu
	mov ax,180
	mov bx,10
	mov cx,310
	call DrawLineHeng
	mov bx,310
	mov ax,15
	mov cx,180
	call DrawLineShu

	;缩小
	mov ax,20
	mov bx,278   
	mov cx,284
	call DrawLineHeng
                ;放大
	mov ax,18
	mov bx,287   
	mov cx,293
	call DrawLineHeng
	mov bx,287
	mov ax,18
	mov cx,24
	call DrawLineShu
	mov ax,24
	mov bx,287
	mov cx,293
	call DrawLineHeng
	mov bx,293
	mov ax,18
	mov cx,24
	call DrawLineShu
	mov ax,28
	mov bx,10
	mov cx,310
	call DrawLineHeng
                ;关闭
	mov ax,18
	mov bx,296   
	mov cx,297
	call DrawLineHeng
	mov bx,297
	mov ax,18
	mov cx,19
	call DrawLineShu
	mov ax,19
	mov bx,297
	mov cx,298
	call DrawLineHeng
	mov bx,298
	mov ax,19
	mov cx,20
	call DrawLineShu
	mov ax,20
	mov bx,298
	mov cx,299
	call DrawLineHeng
                mov bx,299
	mov ax,20
	mov cx,21
	call DrawLineShu
	mov ax,21
	mov bx,299
	mov cx,300
	call DrawLineHeng
	mov bx,300
	mov ax,21
	mov cx,22
	call DrawLineShu
                mov ax,22
	mov bx,300
	mov cx,301
	call DrawLineHeng
	mov bx,301
	mov ax,22
	mov cx,23
	call DrawLineShu
                mov ax,23
	mov bx,301
	mov cx,302
	call DrawLineHeng
	mov bx,302
	mov ax,23
	mov cx,24
	call DrawLineShu
                mov ax,24
	mov bx,302
	mov cx,303
	call DrawLineHeng
	mov bx,303
	mov ax,24
	mov cx,25
	call DrawLineShu
                mov ax,25
	mov bx,303
	mov cx,304
	call DrawLineHeng


                mov ax,18
	mov bx,303   
	mov cx,304
	call DrawLineHeng
	mov bx,303
	mov ax,18
	mov cx,19
	call DrawLineShu
	mov ax,19
	mov bx,302
	mov cx,303
	call DrawLineHeng
	mov bx,302
	mov ax,19
	mov cx,20
	call DrawLineShu
	mov ax,20
	mov bx,301
	mov cx,302
	call DrawLineHeng
                mov bx,301
	mov ax,20
	mov cx,21
	call DrawLineShu
	mov ax,21
	mov bx,300
	mov cx,301
	call DrawLineHeng
	mov bx,300
	mov ax,21
	mov cx,22
	call DrawLineShu
                mov ax,22
	mov bx,299
	mov cx,300
	call DrawLineHeng
	mov bx,299
	mov ax,22
	mov cx,23
	call DrawLineShu
                mov ax,23
	mov bx,298
	mov cx,299
	call DrawLineHeng
	mov bx,298
	mov ax,23
	mov cx,24
	call DrawLineShu
                mov ax,24
	mov bx,297
	mov cx,298
	call DrawLineHeng
	mov bx,297
	mov ax,24
	mov cx,25
	call DrawLineShu
                mov ax,25
	mov bx,296
	mov cx,297
	call DrawLineHeng


                ;内部框架
	mov ax,35
	mov bx,15   
	mov cx,165
	call DrawLineHeng
	mov bx,15
	mov ax,35
	mov cx,165
	call DrawLineShu
	mov ax,165
	mov bx,15   
	mov cx,165
	call DrawLineHeng
	mov bx,140
	mov ax,35
	mov cx,165
	call DrawLineShu

                ;播放键
	mov bx,125
	mov ax,90
	mov cx,100
	call DrawLineShu
	mov bx,130
	mov ax,93
	mov cx,97
	call DrawLineShu

	mov ax,35
	mov bx,280   
	mov cx,305
	call DrawLineHeng
	mov ax,165
	mov bx,280 
	mov cx,305
	call DrawLineHeng
	mov bx,305
	mov ax,35
	mov cx,165
	call DrawLineShu

                ;画S
	mov ax,80
	mov bx,25
	mov cx,40	
	call DrawLineHeng
	mov bx,25
	mov ax,80
	mov cx,95
	call DrawLineShu
	mov ax,95
	mov bx,25
	mov cx,40
	call DrawLineHeng
	mov bx,40
	mov ax,95
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,25
	mov cx,40
	call DrawLineHeng
	;画O
	mov ax,80
	mov bx,50
	mov cx,65	
	call DrawLineHeng
	mov bx,50
	mov ax,80
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,50
	mov cx,65
	call DrawLineHeng
	mov bx,65
	mov ax,80
	mov cx,110
	call DrawLineShu
	;画N
	mov bx,75
	mov ax,80
	mov cx,110
	call DrawLineShu
	mov ax,80
	mov bx,75
	mov cx,76
	call DrawLineHeng
	mov bx,76
	mov ax,80
	mov cx,82
	call DrawLineShu
	mov ax,82
	mov bx,76
	mov cx,77
	call DrawLineHeng
	mov bx,77
	mov ax,82
	mov cx,84
	call DrawLineShu
	mov ax,84
	mov bx,77
	mov cx,78
	call DrawLineHeng
	mov bx,78
	mov ax,84
	mov cx,86
	call DrawLineShu
	mov ax,86
	mov bx,78
	mov cx,79
	call DrawLineHeng
	mov bx,79
	mov ax,86
	mov cx,88
	call DrawLineShu
	mov ax,88
	mov bx,79
	mov cx,80
	call DrawLineHeng
	mov bx,80
	mov ax,88
	mov cx,90
	call DrawLineShu
	mov ax,90
	mov bx,80
	mov cx,81
	call DrawLineHeng
	mov bx,81
	mov ax,90
	mov cx,92
	call DrawLineShu
	mov ax,92
	mov bx,81
	mov cx,82
	call DrawLineHeng
	mov bx,82
	mov ax,92
	mov cx,94
	call DrawLineShu
	mov ax,94
	mov bx,82
	mov cx,83
	call DrawLineHeng
	mov bx,83
	mov ax,94
	mov cx,96
	call DrawLineShu
	mov ax,96
	mov bx,83
	mov cx,84
	call DrawLineHeng
	mov bx,84
	mov ax,96
	mov cx,98
	call DrawLineShu
	mov ax,98
	mov bx,84
	mov cx,85
	call DrawLineHeng
	mov bx,85
	mov ax,98
	mov cx,100
	call DrawLineShu
	mov ax,100
	mov bx,85
	mov cx,86
	call DrawLineHeng
	mov bx,86
	mov ax,100
	mov cx,102
	call DrawLineShu
	mov ax,102
	mov bx,86
	mov cx,87
	call DrawLineHeng
	mov bx,87
	mov ax,102
	mov cx,104
	call DrawLineShu
	mov ax,104
	mov bx,87
	mov cx,88
	call DrawLineHeng
	mov bx,88
	mov ax,104
	mov cx,106
	call DrawLineShu
	mov ax,106
	mov bx,88
	mov cx,89
	call DrawLineHeng
	mov bx,89
	mov ax,106
	mov cx,108
	call DrawLineShu
	mov ax,108
	mov bx,89
	mov cx,90
	call DrawLineHeng
	mov bx,90
	mov ax,80
	mov cx,110
	call DrawLineShu
	;画G
	mov ax,80
	mov bx,100
	mov cx,115	
	call DrawLineHeng
	mov bx,100
	mov ax,80
	mov cx,95
	call DrawLineShu
	mov ax,95
	mov bx,100
	mov cx,115
	call DrawLineHeng
	mov bx,115
	mov ax,80
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,100
	mov cx,115
	call DrawLineHeng
	mov bx,100
	mov ax,103
	mov cx,110
	call DrawLineShu
	mov ax,103
	mov bx,100
	mov cx,105
	call DrawLineHeng

                ;画2
	mov ax,70
	mov bx,170
	mov cx,190	
	call DrawLineHeng
	mov bx,190
	mov ax,70
	mov cx,90
	call DrawLineShu
	mov ax,90
	mov bx,170
	mov cx,190
	call DrawLineHeng
	mov bx,170
	mov ax,90
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,170
	mov cx,190
	call DrawLineHeng
	;画0
	mov ax,70
	mov bx,200
	mov cx,220
	call DrawLineHeng
	mov bx,200
	mov ax,70
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,200
	mov cx,220
	call DrawLineHeng
	mov bx,220
	mov ax,70
	mov cx,110
	call DrawLineShu
	;画2
	mov ax,70
	mov bx,230
	mov cx,250	
	call DrawLineHeng
	mov bx,250
	mov ax,70
	mov cx,90
	call DrawLineShu
	mov ax,90
	mov bx,230
	mov cx,250
	call DrawLineHeng
	mov bx,230
	mov ax,90
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,230
	mov cx,250
	call DrawLineHeng
	;画1
	mov ax,70
	mov bx,260
	mov cx,270
	call DrawLineHeng
	mov bx,270
	mov ax,70
	mov cx,110
	call DrawLineShu
	mov ax,110
	mov bx,260
	mov cx,280
	call DrawLineHeng
	
;画横线,ax为此时y值,bx,cx分别为x的当前和结束值
DrawLineHeng:		
	push ax
	push bx
	push cx
	push dx
	mov dx,320
	mul dx
	add bx,ax
	add cx,ax
x1:	mov [ds:bx],si
	add bx,1
	cmp bx,cx
	jbe x1
	pop dx
	pop cx	
	pop bx
	pop ax
	ret

;画竖线,bx为x值，ax,cx分别为当前值和结束值
DrawLineShu:		
	push ax
	push bx
	push cx
	push dx

	mov di,ax
	mov es,cx
	mov dx,320
	mul dx
	add bx,ax
	mov dx,es

x2:	mov [ds:bx],si
	add bx,320
	inc di
	cmp di,dx
	jbe x2
	pop dx
	pop cx	
	pop bx
	pop ax
	ret


music:
                call musicdelay
	mov al,0xB6
	out 43H,al
	call sdelay
	mov ax,bx
	out 42H,al
	call sdelay
	mov al,ah
	out 42H,al
	call sdelay
	
	in al,61H;打开
	or al,0x03
	out 61H,al
	call sdelay
	call sdelay
	call sdelay
	call sdelay
	call sdelay

	in al,61H;关闭
	and al,0xFD
	out 61H,al
	ret
int_key:				;键盘中断
	push ax
	push bx
	push dx
	push es
	
	
	mov ax,0
	mov es,ax
	

	mov dx,0x60
	in al,dx

	mov [string],al
	
                mov dx,0x20
	mov al,0x61
	out dx,al
	

	pop es
	pop dx
	pop bx
	pop ax
	iret

musicdelay:     ;发出声音的延时函数
	mov cx,300
x6:	cmp cx,0
	je x5                 ;等于跳出
	push cx
	mov cx,60000
x4:	dec cx
	jnz x4               ;结果不为0转
	pop cx
	dec cx
	jmp x6
x5:
	ret
	
sdelay:
	mov cx,0xffff
x0:	dec cx
	jnz x0
	ret

huamiandelay:	;画图的延时函数
	push	cx
	push	bx
	mov	cx,50000
	mov	bx,100
c1:	
	dec	cx
	cmp	cx,0
	ja	c1
	jmp	b1
b1:	
	dec	bx
	cmp	bx,0
	ja	c1
	
	pop	cx
	pop	bx
ret

clc:
              mov ah,15
              int 10h
              mov ah,0
              int 10h
              jmp start