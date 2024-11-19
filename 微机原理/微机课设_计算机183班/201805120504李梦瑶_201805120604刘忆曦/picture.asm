org 0x8600
jmp start

color 	db 0,255,0,0	;背景：红色
	db 1,0,0,255   	 ;蓝色
	db 2,0,0,0		;黑色
	db 3,0,255,0	;红+绿=黄色
	db 4,255,255,255     ;白色 
;----------------------------------------------------
scale  	dw 262		;音阶
    	dw 294
    	dw 330
    	dw 349
    	dw 392
    	dw 440
    	dw 494

fre1 	dw 0		;频率
fre2 	dw 0
;----------------------------------------------------
chun  db '0000000110000000'              ;春
          db '0000001110000000'
          db '0111111111111111'
          db '0001001110010000'
          db '0011111111111110'
          db '0000011100000000'
          db '1111111111111111'
          db '0000111001110000'
          db '0011111111111000'
          db '1111110000111111'
          db '1101110000111110'
          db '0001111111111000'
          db '0001110000111000'
          db '0001110000111000'
          db '0001111111111000'
          db '0000000000000000'

jie      db '0000111001110000'       ;节
          db '0000111001110000'
          db '1111111111111111'
          db '0000111001110000'
          db '0000111001110000'
          db '0000000000000000'
          db '1111111111111111'
          db '0000001110000011'
          db '0000001110000111'
          db '0000001110000111'
          db '0000001110000111'
          db '0000001110011111'
          db '0000001110000000'
          db '0000001110000000'
          db '0000001110000000'
          db '0000001110000000'

kuai   db '0011100011100000'       ;快
          db '0011001011100000'
          db '0011000011000000'
          db '0011111111111100'
          db '1111110011011100'
          db '1111111011011100'
          db '1111000011011100'
          db '1111111111111111'
          db '0011000011100000'
          db '0011000111110000'
          db '0011000111110000'
          db '0011000111110000'
          db '0011001110111000'
          db '0011011100011100'
          db '0011111000001110'
          db '0011100000000111'

le       db '0000000000011100'       ;乐
          db '0001111111111110'
          db '0111111110000011'
          db '0111000111000000'
          db '0111000111000000'
          db '0111000111000000'
          db '0111000111000000'
          db '1111000111000000'
          db '1111111111111111'
          db '0000000111000000'
          db '0011100111001110'
          db '0011100111001110'
          db '0111000111000111'
          db '1110000111000111'
          db '0000011111000000'
          db '0000011111000000'
;-------------------------------------
start:
	mov ah,00h	  ;是用来设定显示模式的服务程序
	mov al,13h	;320*200 256色的图形模式:	
	int 10h
	mov ax,0xa000 ;往显存中放入点数据
   	mov es,ax

	mov si,color
	call dis
	call dis

	call xian1
	call xian2
	call xian3
	call men1
	call men2
	call light
	call tree
;------------画线结束----------------------------
	mov ax,0xb800
	mov es,ax

	mov ax,0
	mov ds,ax

	cli

	mov word [ds:0x24],int_key
	mov word [ds:0x26],0
	sti
	mov si,0
end:	jmp $

;------------画线开始---------------------------
dis:
    	mov dx,0x3c8
    	mov al,[si]
    	out dx,al
    	mov dx,0x3c9
    	mov al,[si+1]
   	out dx,al
   	mov al,[si+2]
    	out dx,al
    	mov al,[si+3]
    	out dx,al
    	add si,4
    	ret

xian1:
   	mov bx,80                  
o1:	mov byte [es:bx],1
    	add bx,320
    	cmp bx,63440
    	jbe o1
    	ret

xian2:
	mov bx,160                    
o2:	mov byte [es:bx],1
    	add bx,320
    	cmp bx,63520
    	jbe o2
    	ret
xian3:
	mov bx,240               
o3:	mov byte [es:bx],1
    	add bx,320
    	cmp bx,63600
    	jbe o3
    	ret

men1:
	mov bx,35346	;146，110      
	mov cx,35346	;146，110     
	call oo1
	mov bx,35665	;145，111      
	mov cx,35667	;147，111     
	call oo1
	mov bx,35984	;144，112      
	mov cx,35988	;148，112     
	call oo1
	mov bx,36303	;143，113      
	mov cx,36309	;149，113     
	call oo1

	mov bx,36622	;142，114      
	mov cx,36630	;150，114     
	call oo1
	
	mov bx,36943	;143，115      
	mov cx,36949	;149，115     
	call oo1
	mov bx,37264	;144，116      
	mov cx,37268	;148，116     
	call oo1
	mov bx,37585	;145，117      
	mov cx,37587	;147，117     
	call oo1
	mov bx,37906	;146，118      
	mov cx,37906	;146，118     
	call oo1

men2:
	mov bx,35374	;174，110      
	mov cx,35374	;174，110     
	call oo1
	mov bx,35693	;173，111      
	mov cx,35695	;175，111     
	call oo1
	mov bx,36012	;172，112      
	mov cx,36016	;176，112     
	call oo1
	mov bx,36331	;171，113      
	mov cx,36337	;177，113     
	call oo1

	mov bx,36650	;170，114      
	mov cx,36658	;178，114     
	call oo1
	
	mov bx,36971	;171，115      
	mov cx,36977	;177，115     
	call oo1
	mov bx,37292	;172，116      
	mov cx,37296	;176，116     
	call oo1
	mov bx,37613	;173，117      
	mov cx,37615	;175，117     
	call oo1
	mov bx,37934	;174，118      
	mov cx,37934	;174，118     
	call oo1

oo1:	mov byte [es:bx],1
    	add bx,1
    	cmp bx,cx
    	jbe oo1
    	ret
;-----------门把结束----------------------------------
light:
	mov bx,280	;280，0      
	mov cx,5080	;280，15     
	call ooo2
;-------灯笼  |   吊线------------------------------------	
	mov bx,5072	;272，15      
	mov cx,5088	;288，15     
	call ooo1
	mov bx,5072	;272，15      
	mov cx,8272	;272，25     
	call ooo2
	mov bx,5088	;288，15     
	mov cx,8288	;288，25     
	call ooo2
;---------灯笼  口   上框---------------------------------	
	mov bx,15952	;272，49      
	mov cx,15968	;288，49     
	call ooo1
	mov bx,12752	;272，39     
	mov cx,15952	;272，49     
	call ooo2
	mov bx,12768	;288，39     
	mov cx,15968	;288，49     
	call ooo2
;---------灯笼  口   下框--------------------------------	
;------------换色---------------------------
	mov bx,8267	;267，25      
	mov cx,8293	;293，25     
	call ooo3
	mov bx,8586	;266，26      
	mov cx,8614	;294，26     
	call ooo3
	mov bx,8905	;265，27     
	mov cx,8935	;295，27     
	call ooo3
	mov bx,9224	;264，28     
	mov cx,9256	;296，28     
	call ooo3
	mov bx,9543	;263，29     
	mov cx,9577	;297，29     
	call ooo3
	mov bx,9862	;262，30     
	mov cx,9898	;298，30     
	call ooo3
	mov bx,10181	;261，31     
	mov cx,10219	;299，31    
	call ooo3
	mov bx,10500	;260，32     
	mov cx,10540	;300，32     
	call ooo3

	mov bx,10821	;261，33     
	mov cx,10859	;299，33     
	call ooo3
	mov bx,11142	;262，34    
	mov cx,11178	;298，34    
	call ooo3
	mov bx,11463	;263，35    
	mov cx,11497	;297，35    
	call ooo3
	mov bx,11784	;264，36    
	mov cx,11816	;296，36    
	call ooo3
	mov bx,12105	;265，37    
	mov cx,12135	;295，37    
	call ooo3
	mov bx,12426	;266，38    
	mov cx,12454	;294，38    
	call ooo3
	mov bx,12747	;267，39    
	mov cx,12773	;293，39    
	call ooo3
;-------灯笼体--------------------------------	
	mov bx,16270	;270，50    
	mov cx,21390	;270，66    
	call ooo4
	mov bx,16912	;272，52    
	mov cx,22032	;272，68    
	call ooo4
	mov bx,16274	;274，50    
	mov cx,21394	;274，66    
	call ooo4
	mov bx,16916	;276，52    
	mov cx,22036	;276，68    
	call ooo4
	mov bx,16278	;278，50    
	mov cx,21398	;278，66    
	call ooo4
	mov bx,16920	;280，52    
	mov cx,22040	;280，68    
	call ooo4
	mov bx,16282	;282，50    
	mov cx,21402	;282，66    
	call ooo4
	mov bx,16924	;284，52    
	mov cx,22044	;284，68    
	call ooo4
	mov bx,16286	;286，50    
	mov cx,21406	;286，66    
	call ooo4
	mov bx,16928	;288，52    
	mov cx,22048	;288，68    
	call ooo4
	mov bx,16290	;290，50    
	mov cx,21410	;290，66    
	call ooo4
;----------------流苏------------------------------
;------------黄色部分结束--------------------------

ooo1:	mov byte [es:bx],2	;横线
    	add bx,1
    	cmp bx,cx
    	jbe ooo1
    	ret
ooo2:	mov byte [es:bx],2	;竖线
    	add bx,320
    	cmp bx,cx
    	jbe ooo2
    	ret
;-----------------------------------------
ooo3:	mov byte [es:bx],3	;横线
    	add bx,1
    	cmp bx,cx
    	jbe ooo3
    	ret

ooo4:	mov byte [es:bx],3	;竖线
    	add bx,640
    	cmp bx,cx
    	jbe ooo4
    	ret
;-------------画树开始--------------------
tree:
                mov bx,54409	      
	mov cx,54435	
                call white1

                mov bx,54445	      
	mov cx,54471	
                call white1
        
                mov bx,48013	      
	mov cx,48030	
                call white1

                mov bx,48050	      
	mov cx,48067	
                call white1

                mov bx,41620	      
	mov cx,41635	
                call white1

                mov bx,41645	      
	mov cx,41660	
                call white1

                mov bx,54435	      
	mov cx,64305	;k
                call white2

                mov bx,54445	      
	mov cx,64045	;k
                call white2

                mov bx,48030	      
	mov cx,54405	
                call white3

                mov bx,41635	      
	mov cx,48010	
                call white3

                mov bx,35240	      
	mov cx,41620	
                call white3

                mov bx,48050	      
	mov cx,54471	
                call white4

                mov bx,35240	      
	mov cx,41660	
                call white4

                mov bx,41645	      
	mov cx,48070	
                call white4
             
white1:                                      ;横线
                mov byte [es:bx],3
    	add bx,1
    	cmp bx,cx
    	jbe white1
    	ret

white2:                                  ;竖线
                mov byte [es:bx],3
    	add bx,320
    	cmp bx,cx
    	jbe white2
    	ret

white3:                                  ;左斜线
               mov byte [es:bx],3
    	add bx,319
    	cmp bx,cx
    	jbe white3
    	ret

white4:
               mov byte [es:bx],3     ;右斜线
    	add bx,321
    	cmp bx,cx
    	jbe white4
    	ret
;-----------中断开始---------------------------
int_key:
	mov dx,0x60
	in al,dx	;取走
	
	cmp al,0x1c	;Enter键   显示"春节快乐"
	je  next

	
	cmp al,0x2C	;Z
    	je do
    
    	cmp al,0x2D	;X
    	je re
    
    	cmp al,0x2E	;C
    	je mi

    	cmp al,0x2F	;V
    	je fa

    	cmp al,0x30	;B
    	je sol
	
     	cmp al,0x31	;N
    	je la

    	cmp al,0x32	;M
    	je xi
    	jmp k1

next:
	mov ah,00h	  ;是用来设定显示模式的服务程序
	mov al,13h	;320*200 256色的图形模式:	
	int 10h

	mov dx,0x3c8	;1   '春节快乐'字样为red
	mov al,1
	out dx,al
	mov dx,0x3c9
	mov al,255
	out dx,al
	mov dx,0x3c9
	mov al,0
	out dx,al
	mov dx,0x3c9
	mov al,0
	out dx,al

  	mov ax,0xa000
       	mov es,ax                                 ;初始化
       
       	mov ax,0x0
       	mov ds,ax
  
	mov di,chun                      ;16*16点阵——春
       	mov bx,0
       	mov cx,16
       	mov dx,16                

chun0:  
	cmp byte[ds:di],'0'                 
      	 jz out1
       	mov byte [es:bx],1
out1: 
	inc di
       	inc bx
       	dec cx
       	cmp cx,0
      	jz chun1
       	jmp chun0

chun1:   
	sub bx,16              
       	add bx,320
       	dec dx
       	cmp dx,0
       	jz Wjie
       	mov cx,16
       	jmp chun0
;-------------节------------------
Wjie:   
	mov di,jie                   
       	mov bx,17
       	mov cx,16
       	mov dx,16

jie0:  
	cmp byte[ds:di],'0'
       	jz out2
       	mov byte [es:bx],1
out2: 	inc di
       	inc bx
       	dec cx
       	cmp cx,0
      	jz jie1
      	jmp jie0
jie1:   
	sub bx,16
       	add bx,320
       	dec dx
      	cmp dx,0
       	jz Wkuai
       	mov cx,16
       	jmp jie0
;-------------快-------------
Wkuai:   
	mov di,kuai                 
       	mov bx,33
       	mov cx,16
       	mov dx,16

kuai0:  
	cmp byte[ds:di],'0'
       	jz out3
       	mov byte [es:bx],1
out3: 	inc di
       	inc bx
       	dec cx
       	cmp cx,0
       	jz kuai1
       	jmp kuai0
kuai1:   	
	sub bx,16
       	add bx,320
       	dec dx
       	cmp dx,0
       	jz Wle
       	mov cx,16
       	jmp kuai0
;------------乐--------------
Wle:   
	mov di,le                
       	mov bx,49
       	mov cx,16
       	mov dx,16

le0:  
	cmp byte[ds:di],'0'
       	jz out4
       	mov byte [es:bx],1
out4: 	inc di
       	inc bx
       	dec cx
       	cmp cx,0
       	jz le1
       	jmp le0

le1:   
	sub bx,16
       	add bx,320
       	dec dx
       	cmp dx,0
       	jz k1
       	mov cx,16
       	jmp le0
;---------文字显示结束------------------
;---------扬声器开始------------------
do:
    	mov bx,[scale]
    	call init
    	jmp k1
re:
    	mov bx,[scale+2]
    	call init
    	jmp k1
mi:
    	mov bx,[scale+4];
    	call init
    	jmp k1
fa:
    	mov bx,[scale+6]
    	call init
    	jmp k1
sol:
    	mov bx,[scale+8]
    	call init
    	jmp k1
la:
    	mov bx,[scale+10]
    	call init
    	jmp k1
xi:
    	mov bx,[scale+12]
    	call init
    	jmp k1

k1: 	;键盘中断结束
    	mov dx,0x20
    	mov al,0x61
    	out dx,al
	iret

;初始化扬声器
init:
    	mov [fre1],bx 	;频率
    	mov al,10110110B
    	out 43h,al
    	push ax
    	push dx
    	push di
    	mov dx,12h
    	mov ax,32edh
    	mov di,[fre1]
    	div di
    	mov [fre2],ax
    	pop di
    	pop dx
    	pop ax
    	mov ax, [fre2] ;计数初值=1.19 MHz, 600 Hz=1983
    	out 42H, al ;送计数初值低位字节，8253的计数器2的地址42H
    	mov al, ah
    	out 42H, al ;送计数初值高位字节
    	call sleep
    	call opens
    	call sleep
    	call closes
    	ret

;延迟
sleep:
    	push cx 
    	push ax 
    	push dx
    	mov  cx, 06H ;延时高16位
    	mov  dx, 4000H ;延时低16位
    	mov  ah, 86H ;调用功能号，格式化驱动器定期中断
    	int  15H
    	pop dx 
    	pop ax 
    	pop cx
	ret

;打开扬声器
opens:
    	push ax
    	in al,61h
    	or al,00000011B
    	out 61h,al
    	pop ax
    	ret

;关闭扬声器
closes:
    	push ax
    	in al,61h
    	and al,11111100B
    	out 61h,al
    	pop ax
    	ret