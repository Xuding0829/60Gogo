org 0x8400

jmp start    ;跳转

color  db 1,255,0,0        ;红色
       db 2,0,255,0        ;绿色
       db 3,0,0,255        ;蓝色
       db 4,255,255,255        ;白色
       db 5,0,0,0          ;黑色
       db 0,255,255,255    ;背景设置为白色
;颜色

color_2 db 10,255,255,0
;渐变颜色

colornumber db 0,1,2,3,4,5

FSO     dw 3,4,291,8,8   ;缩小框

Paino   dw 400,435,470
;Paino   dw -2800,-2765,-2730

Painocolor dw 1,2,3,4

wjm dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0
	dw	0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,1,1,0,0,0,0,0
    dw 	0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0
	dw	0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,0,1,0,1,1,0,1,1,0,1,1,0,0
	dw	0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,0,1,0,1,1,0,1,1,1,1,0,0,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0,1,1,0,0,1,1,1,0,0,0
	dw	0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,1,1,0,0,0,0
	dw	0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,0,0,0
    dw	0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,1,1,1,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0,0,1,1,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;名字 20

wjx dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


count dw 0,0

nowUseHz dw 900
changeHz dw 0

table	dw	262			;k1 发 do	的音，261.6HZ
		dw  294			;k2 发 re	的音，293.6HZ
		dw  330			;k3 发 mi	的音，329.6HZ
		dw  349			;k4 发 fa	的音，349.2HZ
		dw  392			;k5 发 sol	的音，392HZ
		dw  440			;k6 发 la	的音，440HZ
		dw  494			;k7 发 si	的音，493.8HZ
; ------------------------------------------------

littlestar dw 1,1,5,5,6,6,5,5,4,4,3,3,2,2,1,1,5,5,4,4,3,3,2,2,5,5,4,4,3,3,2,2,1,1,5,5,6,6,5,5,4,4,3,3,2,2,1,1
musiccount dw 0 
musicflag  dw 0
score      dw 0
wjx_site   dw 0

start:
	mov ah,00h
    mov al,13h
    int 10h

    mov ax,0x0a000         
    mov es,ax
    ;初始化

    call colorchange
    ;自定义颜色

    call backcolorwrite
    ;设置背景颜色

    call Drawnamefun
    ;写名字

    call DrawLineOfFso
    ;绘空心框

    call outframe
    ;绘制外部框架

     sti
     mov word [ds:0x20],int_timer0
     mov word [ds:0x22],0

     sti
     mov word [ds:0x24],int_key
     mov word [ds:0x26],0

exit:
    jmp exit
    ;退出



int_key: 
    push dx
    push ax   
    push cx
    push bx

    mov dx,0x60
    in al,dx                  ;读取键盘缓冲区
   
    cmp al,0x9E
    je  change_paino1

    cmp al,0x9F
    je  change_paino2
    
    cmp al,0xA0
    je  change_paino3

    cmp al,0xAC
    je change_stop

    cmp al,0xAD
    je change_continue

change_back:
    jmp key_iret

change_paino3:
    mov bx,[ds:Paino+4]
    cmp bx,39680
    ja  change_paino_color3
    jmp change_back

change_paino_color3:
     mov cx,5
     mov [ds:Painocolor+4],cx
     mov cx,1
     mov [ds:musicflag],cx
     jmp change_back

change_paino2:
    mov bx,[ds:Paino+2]
    cmp bx,39680
    ja  change_paino_color2
    jmp change_back

change_paino_color2:
     mov cx,5
     mov [ds:Painocolor+2],cx
     mov cx,1
     mov [ds:musicflag],cx
     jmp change_back

change_paino1:
    mov bx,[ds:Paino]
    cmp bx,39680
    ja  change_paino_color1
    jmp change_back

change_paino_color1:
     mov cx,5
     mov [ds:Painocolor],cx
     mov cx,1
     mov [ds:musicflag],cx
     jmp change_back

change_stop:
     sti
     mov word [ds:0x20],int_timer5
     mov word [ds:0x22],0     
     jmp key_iret
change_continue:
     sti
     mov word [ds:0x20],int_timer1
     mov word [ds:0x22],0     
     jmp key_iret
key_iret:
    mov dx,0x20               ;键盘中断结束
    mov al,0x61
    out dx,al                 ;中断结束
    
    pop dx
    pop ax
    pop cx 
    pop bx 
iret

music:
   push cx                   ;是否播放音乐
   push bx                   ;获取音乐位数
   push ax                   ;获取音符
   push dx
   push si

   mov cx,[ds:musicflag]
   cmp cx,0
   je  music_ret
   mov bx,[ds:musiccount]
   mov si,bx
   mov ax,[ds:littlestar+bx]
   call score_add
   call wjx_add
music_play:
    cmp ax,1
    je  scale1
    cmp ax,2
    je  scale2
    cmp ax,3
    je  scale3
    cmp ax,4
    je  scale4
    cmp ax,5
    je  scale5
    cmp ax,6
    je  scale6
    cmp ax,7
    je  scale7

music_change:
   mov cx,0
   mov [ds:musicflag],cx
   add si,2
   cmp si,96
   ja  change_music_si
change_music_si_back:
   mov [ds:musiccount],si
   jmp music_ret
change_music_si:
  mov si,0
  jmp change_music_si_back

 music_ret:
   pop cx
   pop bx
   pop ax
   pop dx
   pop si
ret

wjx_add:
pusha
    mov cx,[ds:wjx_site]
    cmp cx,25
    ja  wjx_add_stop
    mov ax,49
    add ax,cx
    mov bx,200
    push cx
    mov cx,45
    mov si,1
    call DrawLineOfH
    pop  cx
    inc cx
    mov [ds:wjx_site],cx
wjx_add_stop:
popa
pusha
call Drawwjxfun
popa
ret


score_add:
pusha
    mov cx,[ds:score]
    cmp cx,100
    ja  score_add_stop
    mov ax,129
    sub ax,cx
    mov bx,16
    push cx
    mov cx,24
    mov si,1
    call DrawLineOfH
    pop  cx
    inc cx
    mov [ds:score],cx
score_add_stop:
popa
ret

outframe:
     push ax
     push bx
     push cx
     push si
     
   
     mov ax,0
     mov bx,0
     mov cx,320
     mov si,1
     call DrawLineOfH

     mov ax,0
     mov bx,0
     mov cx,200
     mov si,1
     call DrawLineOfS
  
     mov ax,0
     mov bx,319
     mov cx,200
     mov si,1
     call DrawLineOfS 
      
     mov ax,0
     mov bx,303
     mov cx,16
     mov si,1
     call DrawLineOfS
 
     mov ax,0
     mov bx,287
     mov cx,16
     mov si,1
     call DrawLineOfS

     mov ax,0
     mov bx,271
     mov cx,16
     mov si,1
     call DrawLineOfS


     mov ax,16
     mov bx,0
     mov cx,320
     mov si,1
     call DrawLineOfH

     mov ax,199
     mov bx,0
     mov cx,320
     mov si,1
     call DrawLineOfH

     mov ax,16
     mov bx,307
     mov cx,184
     mov si,1
     call DrawLineOfS 
     
     mov ax,8
     mov bx,311
     mov cx,5
     mov si,3
     call DrawLineOfx          
     ;关闭按键

     mov ax,8
     mov bx,275
     mov cx,8
     mov si,3
     call DrawLineOfH
    
     mov ax,179
     mov bx,0
     mov cx,320
     mov si,1
     call DrawLineOfH

     mov ax,30
     mov bx,15
     mov cx,25
     mov si,5
     call DrawLineOfH
     
     mov ax,130
     mov bx,15
     mov cx,25
     mov si,5
     call DrawLineOfH

     mov ax,30
     mov bx,15
     mov cx,100
     mov si,5
     call DrawLineOfS

     mov ax,30
     mov bx,40
     mov cx,100
     mov si,5
     call DrawLineOfS
     ;上面四个积分框

     pop ax
     pop bx
     pop cx
     pop si
ret
;外部框绘制

back_s:
     pusha
     mov ax,16
     mov bx,0
     mov cx,320
     mov si,1
     call DrawLineOfH
     popa
ret
int_timer0:
    push bx
    push ax
    push si
    push bp
    push cx

    mov bx,[ds:Paino]
    mov al,[ds:Painocolor]
    mov si,bx
    push si
    call DrawPianeframe
    pop si
    mov bx,si
    push si
    call clearfrist
    ;绘制钢琴块
    pop si
timer0_quiter:
    add si,320
    cmp si,57280
    ja  IT0_si
IT0_back:    
    mov [ds:Paino],si
    mov al,0x20
	mov dx,0x20
	out dx,al
    mov bp,[ds:count]
    inc bp
    mov [ds:count],bp
    cmp bp,57
    ja  start_IT1
start_IT1_back:
    jmp IT0_fin
IT0_si:
    mov cx,1
    mov [ds:Painocolor],cx
    mov si,400
    jmp IT0_back
start_IT1:
     sti
     mov word [ds:0x20],int_timer1
     mov word [ds:0x22],0
     jmp start_IT1_back
IT0_fin:
    call back_s
    pop bx
    pop ax
    pop si
    pop bp
    pop cx
iret
;第一个块移动

int_timer1:
    push bx
    push ax
    push si
    push bp
    push cx

    mov bx,[ds:Paino+2]
    mov al,[ds:Painocolor+2]
    mov si,bx
    push si
    call DrawPianeframe
    pop si
    mov bx,si
    push si
    call clearfrist
    ;绘制钢琴块
    pop si
timer1_quiter:
    add si,320
    cmp si,57280
    ja  IT1_si
IT1_back:    
    mov [ds:Paino+2],si
    mov al,0x20
	mov dx,0x20
	out dx,al
    mov bp,[ds:count+2]
    inc bp
    mov [ds:count+2],bp
    cmp bp,57
    ja  start_IT2
    cmp bp,55
    jbe start_IT_0
start_IT2_back:
    jmp IT1_fin
IT1_si:
    mov cx,2
    mov [ds:Painocolor+2],cx
    mov si,435
    jmp IT1_back
start_IT2:
     sti
     mov word [ds:0x20],int_timer2
     mov word [ds:0x22],0
     jmp start_IT2_back
start_IT_0:
     sti
     mov word [ds:0x20],int_timer0
     mov word [ds:0x22],0
     jmp start_IT2_back
IT1_fin:
    call back_s
    pop bx
    pop ax
    pop si
    pop bp
    pop cx
iret
;第二个块移动

int_timer2:
    push bx
    push ax
    push si
    push bp
    push cx

    mov bx,[ds:Paino+4]
    mov al,[ds:Painocolor+4]
    mov si,bx
    push si
    call DrawPianeframe
    pop si
    mov bx,si
    push si
    call clearfrist
    pop si
timer2_quiter:
    add si,320
    cmp si,57280
    ja  IT2_si
IT2_back:    
    mov [ds:Paino+4],si
    mov al,0x20
	mov dx,0x20
	out dx,al
    jmp  start_IT0
start_IT0_back:
    jmp IT2_fin
IT2_si:
    mov cx,3
    mov [ds:Painocolor+4],cx
    mov si,470
    jmp IT2_back
start_IT0:
     sti
     mov word [ds:0x20],int_timer4
     mov word [ds:0x22],0
     jmp start_IT0_back
IT2_fin:
    call back_s
    pop bx
    pop ax
    pop si
    pop bp
    pop cx
iret
;第三个块移动

int_timer4:
   push ax
   push dx
   push di
     call music
     sti
     mov word [ds:0x20],int_timer0
     mov word [ds:0x22],0
    mov al,0x20
	mov dx,0x20
	out dx,al
   pop ax
   pop dx
   pop di
iret

int_timer5:

   push ax
   push dx
   push di

    mov al,0x20
	mov dx,0x20
	out dx,al
   pop ax
   pop dx
   pop di

iret

clearfrist:
       push ax
       push di

       mov al,4
       mov di,35
CF:    
        mov byte [es:bx],al
        inc bx
        dec di
        cmp di,0
        ja  CF
      pop ax
      pop di
ret
;清空前一行

DrawPianeframe:
    push di
    push si

    mov di,35    ;宽
    mov si,55    ;长
   
DPFsi:
       mov bp,di
DPFdi:  
        cmp bx,5120
        jb  DPF_head  
DPF_head_back:
        cmp bx,57280
        ja  DPF_fin
        mov byte [es:bx],al
        inc bx
        dec di
        cmp di,0
        ja  DPFdi
     mov di,bp
     sub bx,di
     add bx,320
     dec si
     cmp si,0
     ja  DPFsi
     jmp DPF_fin

DPF_head:
     add bx,320
     dec si
     jmp DPFdi
DPF_fin:
    pop di
    pop si
ret


DrawLineOfx:                        ; si: 颜色 ax:行数 bx:列数 cx:大小
     push bp
     mov bp,colornumber
     add bp,si

     mov dx,320
     mul dx
     add bx,ax
        
     mov ax,cx
     mov dx,320
     mul dx
     mov si,ax

     mov al,[bp]
     
     mov byte [es:bx],al
     mov di,bx 
DXe: mov bx,di
     add bx,si
     add bx,cx
     mov byte [es:bx],al
     mov bx,di
     add bx,si
     sub bx,cx
     mov byte [es:bx],al
     mov bx,di
     sub bx,si
     sub bx,cx
     mov byte [es:bx],al
     mov bx,di
     sub bx,si
     add bx,cx
     mov byte [es:bx],al
     dec cx
     sub si,320
     cmp cx,0
     ja  DXe
     pop bp
ret
;画叉

DrawLineOfFso:                        ;si:color  ax bx   cx:长   di:宽    空心框
    push bp
    push si
    push ax
    push bx
    push cx
    push di

    mov  di,1
 
    mov bp,FSO

Dfso: 
     mov si,[bp]
     mov ax,[bp+2]
     mov bx,[bp+4]
     mov cx,[bp+6]
     call DrawLineOfH
     mov si,[bp]
     mov ax,[bp+2]
     mov bx,[bp+4]
     mov cx,[bp+8]
     call DrawLineOfS
     mov si,[bp]
     mov ax,[bp+2]
     mov bx,[bp+4]
     mov cx,[bp+6]
     add bx,cx
     mov cx,[bp+8]
     call DrawLineOfS
     mov si,[bp]
     mov ax,[bp+2]
     mov bx,[bp+4]
     mov cx,[bp+8]
     add ax,cx
     mov cx,[bp+6]
     call DrawLineOfH
  
     dec di
     add bp,10
     cmp di,0
     ja  Dfso

    pop bp
    pop si
    pop ax
    pop bx
    pop cx
    pop di
ret

DrawLineOfH:       ;ax 为x坐标 ，cx为y坐标
     push bp
     mov bp,colornumber
     add bp,si    

     mov dx,320
     mul dx
     add bx,ax
     mov al,[bp]
DHe:   mov byte [es:bx],al
     inc bx
     dec cx
     cmp cx,0
     ja  DHe
     pop bp
ret
;画横线


DrawLineOfS:
     push bp
     mov bp,colornumber
     add bp,si 

     mov dx,320
     mul dx
     add bx,ax
     mov al,[bp]
DSe: mov byte [es:bx],al
     add bx,320
     dec cx
     cmp cx,0
     ja  DSe
     pop bp
ret
;画竖线


backcolorwrite:
    push bx
    push ax

    mov bx,0
    mov al,0
    mov byte [es:bx],al
   
    pop bx
    pop ax
ret
;背景颜色

Drawnamefun:
    push di       ;要写的名字
    push ax       ;al 颜色色号
    push bx       ;起始坐标
    push bp       ;行数
    push si       ;列数

    mov di,wjm		
	mov al,1
	mov bx,57600

    mov bp,0		;行数
	mov si,0		;列数
Dback:	
	cmp si,20
	jae Drawnamefun_close   ;多于列数，结束函数
	cmp bp,48
	jae change_si   ;多余行数，换行
	jmp draw       ;两者都满足，绘图
draw_back:	
    add bp,1   
	jmp Dback        ;循环

change_si:       
	add si,1
	sub bp,48
	add bx,272
	jmp Dback

draw:
d1:	mov cx,0
	cmp [di],cx
	je draw_close
	mov byte[es:bx],al

draw_close:
	add di,2        ;dw+2
	add bx,1
    jmp draw_back

Drawnamefun_close:
    pop di       ;要写的名字
    pop ax       ;al 颜色色号
    pop bx       ;起始坐标
    pop bp       ;行数
    pop si       ;列数
ret
;写名字

Drawwjxfun:
    push di       ;要写的名字
    push ax       ;al 颜色色号
    push bx       ;起始坐标
    push bp       ;行数
    push si       ;列数

    mov di,wjx		
	mov al,4
	mov bx,16200

    mov bp,0		;行数
	mov si,0		;列数
Dwjxback:	
	cmp si,20
	jae Drawwjxfun_close   ;多于列数，结束函数
	cmp bp,48
	jae changewjx_si   ;多余行数，换行
	jmp drawwjx       ;两者都满足，绘图
drawwjx_back:	
    add bp,1   
	jmp Dback        ;循环

changewjx_si:       
	add si,1
	sub bp,48
	add bx,272
	jmp Dback

drawwjx:
dwjx1:	mov cx,0
	cmp [di],cx
	je draw_close
	mov byte[es:bx],al

drawwjx_close:
	add di,2        ;dw+2
	add bx,1
    jmp drawwjx_back

Drawwjxfun_close:
    pop di       ;要写的名字
    pop ax       ;al 颜色色号
    pop bx       ;起始坐标
    pop bp       ;行数
    pop si       ;列数
ret
;写wjx

colorchange:
    push dx
    push ax
    push di
    push bp

    mov di,color
    mov bp,0

cc1:
	mov dx,0x3c8
	mov al,[di+bp]
	out dx,al
	mov dx,0x3c9
	mov al,[di+1+bp]
	out dx,al
	mov al,[di+2+bp]
	out dx,al
	mov al,[di+3+bp]
	out dx,al

    add bp,4
    cmp bp,24
    jb cc1

    pop dx
    pop ax
    pop bp
    pop di
ret
;颜色改变

music_part:

    scale1:
        push bx
        push ax
        mov bx , [ds:table]
        call tosound
        pop  bx
        pop  ax
        jmp music_change
    
    scale2:
        push bx
        push ax
        mov bx , [ds:table+2]
        call tosound
        pop  bx
        pop  ax
        jmp music_change

    scale3:
        push bx
        push ax
        mov bx , [ds:table+4]
        call tosound
        pop  bx
        pop  ax
        jmp music_change

    scale4:
        push bx
        push ax
        mov bx , [ds:table+6]
        call tosound
        pop  bx
        pop  ax
        jmp music_change

    scale5:
        push bx
        push ax
        mov bx , [ds:table+8]
        call tosound
        pop  bx
        pop  ax
        jmp music_change

    scale6:
        push bx
        push ax
        mov bx , [ds:table+10]
        call tosound
        pop  bx
        pop  ax
        jmp music_change

    scale7:
        push bx
        push ax
        mov bx , [ds:table+12]
        call tosound
        pop  bx
        pop  ax
        jmp music_change

tosound:
    mov [ds:nowUseHz] , bx
    call initSound
    call delay1
    call TurnOnSoundPort
    call delay2
    call closeSoundPort
ret

initSound:
    mov  al, 10110110B 
    out  43H, al 
    call TurnHzToHex
    mov  ax, [ds:changeHz] 
    out  42H, al 
    mov  al, ah
    out  42H, al 
ret

; 打开扬声器
TurnOnSoundPort:
    push ax
    in al , 61H
    or al , 00000011B 
    out 61H , al
    pop ax
ret

;写一个关闭扬声器
closeSoundPort:
    push ax
    in   al,61H
	and	 al,11111100B	
	out	 61H,al
    pop ax
ret


TurnHzToHex:
    ; ;设置频率
	push dx 
    push ax
    push di
    mov dx,12H
	mov ax,34DEH
	mov di,[ds:nowUseHz]
	div di
    mov [ds:changeHz] , ax
    pop dx 
    pop ax
    pop di
ret

delay1:
    push cx 
    push ax 
    push dx
    mov  cx, 00H
    mov  dx, 4240H
    mov  ah, 86H
    int  15H
    pop dx 
    pop ax 
    pop cx
ret

delay2:
    push cx 
    push ax 
    push dx
    mov  cx, 0FH
    mov  dx, 4240H
    mov  ah, 86H
    int  15H
    pop dx 
    pop ax 
    pop cx
ret