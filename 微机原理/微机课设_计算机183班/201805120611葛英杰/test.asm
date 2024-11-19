org 0x8400
jmp main

;变量定义区
sx  dw 77           ;临时变量，用来存储当前任务中矩形的位置
sy  dw 88           ;临时变量，用来存储当前任务中矩形的位置
ex  dw 154          ;临时变量，用来存储当前任务中矩形的位置
ey  dw 88           ;临时变量，用来存储当前任务中矩形的位置
fg  dw 1           
width dw 25        ;宽度
hight dw 25       ;高度

startx1 dw 80        ;1号矩形的位置
starty1 dw 80        

startx2 dw 20        ;二号矩形的位置
starty2 dw 20

colnum db 78       ;颜色相关  
colr db 55
colg db 44
colb db 44

flag db 0   ;是否暂停
combineflag db 0 ;组合键标志
left_1 db 1       ;1号矩形是否左移标志
left_2 db 0       ;2号矩形是否左移标志

i dw 1
j dw 1
f dw 1000   ;频率

timerlow dw 0x30   ;定时器相关
timerhigh dw 0x60

name3    dw 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0
         dw 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0
         dw 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0
         dw 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0
         dw 0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0
         dw 0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0
         dw 0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,0
         dw 0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0
         dw 0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0
         dw 0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0
         dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         dw 0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,

;=========================================================
;                     主函数
;=========================================================
main:
    sti ;中断标志
    mov ah,00h
    mov al,13h
    int 10h

    mov bx,0xa000 ;绘图
    mov es,bx
    
    mov word [ds:0x24], kb  
    mov word [ds:0x26], 0

beg:
    
    cmp byte [flag], 1 ;如果flag为1，直接进入中断结束，死循环，直至重新再按下e
    je stop

    mov word [ds:0x20], task1
    mov word [ds:0x22], 0
   ; call slp

    mov word [ds:0x20], task2
    mov word [ds:0x22], 0
  ;  call slp
    
    mov word[ds:0x20],task_printname
    mov word[ds:0x22],0
  ;  call slp

    jmp beg

stop:
    mov word [ds:0x20], task3
    mov word [ds:0x22], 0
    jmp beg

    jmp $
;========================================
;               任务1，打印第一个矩形
;========================================
task1:
    push ax
    push dx
    ;cmp byte[flag],1
   ; je task1_exit
     mov word[timerhigh],0x60
     mov word[timerlow],0x20
    call timeset
    mov ax, word [startx1]
    mov word [sx], ax

    mov ax, word [starty1]
    mov word [sy], ax 

    mov byte [colnum], 0
    call printsoildrec
    
    cmp word [startx1], 294
    je switchleft1

    cmp word [startx1], 0
    je switchleft0
    
    jmp task1print
;一号矩形方向，打印相关
switchleft0:
    mov byte [left_1], 0
    call output
    jmp task1print

switchleft1:
    mov byte [left_1], 1
    call output
    jmp task1print

task1print:
    mov byte [colnum], 77
    cmp byte [left_1], 1
    je printleft

printright:   ;右移打印
    add word [sx], 1
    add word [startx1], 1
    call printsoildrec
    jmp task1_exit
 
printleft:    ;左移打印
    sub word [sx], 1
    sub word [startx1], 1
    call printsoildrec
    jmp task1_exit



task1_exit:;结束这一次1号矩形的中断
    pop ax
    pop dx
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    iret
;====================================
;         任务2，打印第二个矩形
;====================================
task2:
    push ax
    push dx
   ; cmp byte[flag],1
   ; je task2_exit

    mov byte[timerlow],0x00
    mov byte[timerhigh],0x40
    call timeset
    mov ax, word [startx2]
    mov word [sx], ax

    mov ax, word [starty2]
    mov word [sy], ax 

    mov byte [colnum], 0
    call printsoildrec
  ;  call slp

    cmp word [startx2], 294 ;起始点碰壁
   
    je switchleft1_2

    cmp word [startx2], 0    ;碰撞检测
    je switchleft0_2
    
    jmp task2print

switchleft0_2:
    mov byte [left_2], 0
    call output
    jmp task2print

switchleft1_2:
    mov byte [left_2], 1
    call output
    jmp task2print

task2print:
    mov byte [colnum], 66
    cmp byte [left_2], 1
    je printleft_2

printright_2:
    add word [startx2], 1
    add word [sx], 1
    call printsoildrec
   
    jmp task2_exit

printleft_2:
    sub word [startx2], 1
    sub word [sx], 1
    call printsoildrec
   
    
    jmp task2_exit



task2_exit:
    pop ax
    pop dx
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    iret
;==============
;任务3，死循环
;==============
task3:
    push ax
    push dx


task3_exit:
    pop ax
    pop dx
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    iret
;====================
;   打印名字任务
;====================
task_printname:
     push di
     push bp
     push bx
     push ax
     mov di,name3    
printname:
       cmp word[j],12
       ja end1
       inc word[j]
       mov word[i],1
printword:    
       cmp word[i],20
       ja printname
       mov bp,[di]
       cmp bp,1
       jnz next
       print:
       mov	bx,32140
	   mov	ax,word[j]
	   mov	dx,320
	   mul	dx
	   add	bx,ax
	   add	bx,word[i]
	   add	bx,3200
       mov byte[es:bx],120
      
       add di,2
       inc word[i]
       
       jmp printword
       next:
       
       add di,2
       inc word[i]
       jmp printword
end1:
   
     mov al,0x20
     mov dx,0x20
     out dx,al
       pop ax
     pop dx
     pop di
     pop bp
     iret
;============================
;        键盘输入任务
;============================
kb:   ;键盘输入
    push dx
    push ax
   
    
    mov dx, 0x60
    in al, dx
    cmp al,0x1d
    je combinebeg
    cmp al,0x1e
    je combinekey
    
    cmp al, 0x12   ;判断输入是否为小写的e
    je kb1
    cmp al,0x02
    je kb2
    cmp al,0x03
    je kb3
    cmp al,0x04
    je kb4
    cmp al,0x05
    je kb5
   
    
    
    jmp k_exit

kb1:
    mov byte [combineflag],0
    cmp byte [flag], 1
    je switch0
    cmp byte [flag], 0
    je switch1

    jmp k_exit

kb2:
    mov byte [combineflag],0
    mov word [colnum],77
    mov word [colr],0
    mov word [colg],100
    mov word [colb],100
    call setcol
    jmp k_exit

kb3:
 mov byte [combineflag],0
   mov word [colnum],77
   mov word [colr],95
   mov word [colg],100
   mov word [colb],50
   call setcol
   jmp k_exit

kb4:
   mov byte [combineflag],0
   mov word [colnum],66
   mov word [colr],50
   mov word [colg],40
   mov word [colb],66
   call setcol
   jmp k_exit

kb5:
   mov byte [combineflag],0
   mov word [colnum],66
   mov word [colr],10
   mov word [colg],8
   mov word [colb],9
   call setcol
   jmp k_exit

combinebeg:    ;组合键判定
   cmp byte[combineflag],0
   jnz setflag
   mov byte[combineflag],1
   jmp k_exit
setflag:
   mov byte[combineflag],0
   jmp k_exit
   

combinekey:
   cmp byte[combineflag],0
   je unmatchedkey
   mov byte[combineflag],0
   mov word[colnum],120
   mov word[colr],23
   mov word[colg],33
   mov word[colb],44
   call setcol
   jmp k_exit

switch0:
    mov byte [flag], 0
    jmp k_exit

switch1:
    mov byte [flag], 1
    jmp k_exit

unmatchedkey:
    mov byte [combineflag],0

k_exit: ;键盘中断结束
    mov dx, 0x20
    mov al, 0x61
    out dx, al

    pop ax
    pop dx

    iret
;=========================
;      打印矩形
;=========================
printsoildrec: ;绘制正方形
    push cx    ;总体思路：每次循环都会打印一行像素点，然后返回到psrbeg，使ey,sy+1，打印下一行，如果cx大于hight表示已经打印完毕，把ey和sy还原到初始值结束
    push ax    ;cx表示已经打印的行数,终点的位置放于ax

    mov cx,0
    mov ax,[sx]
    add ax,[width]
    mov [ex],ax
    mov ax,[sy]
    mov [ey],ax
    mov word [fg],1

printrecbeg:   ;纵坐标是否+1的判断
    cmp cx,[hight]
    ja psrexit
    call printline
    add word [ey],1
    add word [sy],1
    add cx,1
    jmp printrecbeg

psrexit:
    
    mov cx, [hight]
    add cx, 1
    sub word [ey], cx
    sub word [sy], cx
    pop ax
    pop cx
    ret

printline:
    push bx
    push ax
    push bp

    mov bx,[sy]   ;计算目标打印起始点的在屏幕中的位置，存于bx中
    mov ax,320
    mul bx

    add ax,[sx]
    mov bx,ax

    mov bp,[ey]    ;计算目标打印终点在屏幕中的位置，存于bp中
    mov ax,320
    mul bp
    add ax,[ex]
    mov bp,ax  

    mov al,[colnum]

printlineswitch:
    cmp bx,bp   ;如果起点坐标大于终点坐标直接结束
    ja plexit
    mov byte [es:bx],al   ;打印像素点
    add bx,[fg]
    jmp printlineswitch

plexit:
    pop bp
    pop ax
    pop bx
    
    ret

setcol:  ;颜色设置
    push dx
    push ax

    mov dx,0x3c8
    mov al,[colnum]
    out dx,al

    mov dx,0x3c9
    mov al,[colr]
    out dx,al

    mov al,[colg]
    out dx,al

    mov al,[colb]
    out dx,al

    pop dx
    pop ax

    ret

slp:
    push di
    mov  di, 0

begslp:
    inc di
    cmp di,0x10
    ja begslp

    pop di
    ret




;============================
;    扬声器
;===========================
;dive:
  ; mov dx,12h
  ; mov ax,34deh
  ; div di
  ; ret

output:
  push ax
  push dx
  push di
  mov di,[f]
  ;call dive
   mov dx,12h
   mov ax,34deh
   div di

  mov al,10110110b
  out 43h,al
  out 42h,al
  mov al,ah
  out 42h,al
  ;call open
  in al,61h
  or al,00000011b
  out 61h,al
  ;call delay
    mov dx,5h
    mov ax,0
   s: sub ax,1
    sbb dx,0
    cmp ax,0
    jne s
    cmp dx,0
    jne s

  ;call close
  in al,61h
  and al,11111101b
  out 61h,al

  pop ax
  pop dx
  pop di
  ret
;=========================
;      定时器
;=========================
timeset:
   push ax
   push dx
  
   
   mov dx,0x43
   mov al,0x34
   out dx,al

   mov dx,0x40
   mov al,[timerlow]
   out dx,al

   mov dx,0x40
   mov al,[timerhigh]
   out dx,al
   
   pop ax
   pop dx
   ret