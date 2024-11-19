org 0x8400

; 进入 13h号 320x200 256色 的 图形模式 
;----
;||||
;----
; VM <- 编号 颜色号 0~255 
; 字符地址  B8000 H
;           |    | 对应偏移地址
; 0a000 同理   
jmp start 

;-----------------------------------------------------
;---------------------函数变量区-----------------------
;-----------------------------------------------------
; bx 通用寄存器 作为中间变量 
;///代码块起始 
    ; TurnXY 
    ; ps : 用到 乘法mul 使用到 ax 寄存器
    ; 接入 x ， 接入 y , 返回变量  
    TurnX dw 0 ; 接入 x
    TurnY dw 0 ; 接入 y
    TurnBK dw 0; 返回 值

    ; 2.0 版本增加 相对坐标，可以在附加到下面的 实用坐标上
    willDrawRelativeX dw 0
    willDrawRelativeY dw 0

    ; 2020.12.26 1.0 版本
    willDrawX dw 0
    willDrawY dw 0
    willDrawXAndY dw 0
    willDrawPen db 2

    ; 声音有关
    ; 过渡变量
    nowUseHz dw 600
    ; hz 转化后的值保存
    nowUseHzTurned dw 0
    index db 0 ; 表示当前的标记数
    dflag db 0 ; 0 小写 ， 1 大写
    table	dw	262			;k1 发 do	的音，261.6HZ
            dw  294			;k2 发 re	的音，293.6HZ
            dw  330			;k3 发 mi	的音，329.6HZ
            dw  349			;k4 发 fa	的音，349.2HZ
            dw  392			;k5 发 sol	的音，392HZ
            dw  440			;k6 发 la	的音，440HZ
            dw  494			;k7 发 si	的音，493.8HZ

    musizGp dw 330 , 294 , 262 , 494 , 262 , 392 , 294 , 262 ,  494 , 262
; ------------------------------------------------
;///代码块结束
; ------------------------------------------------


;-----------------------------------------------------
;--------------------通用变量区------------------------
;-----------------------------------------------------
;///代码块起始
    ;  颜色编号      R     G    B
color    db 0,      0 ,   0,   0 ; 背景色 编号 默认 0
         db 1,      0 ,   0,   0 ; 黑色画笔，清屏用
         db 2,      49 , 64,  100 ; 线条颜色 编号 2 

pen db 2 ; 设置画笔颜色

points dw 10 , 10 , 11, 10 , 12 ,10 , 13, 10
points2 dw 20 , 20 , 10 , 10 , 30 , 30
fontSize dw 305
; 点数 205个 0 ~ 204
; 点数 306个 0 ~ 305
fontdata dw 4, 0, 10, 0, 23, 0, 28, 0, 38, 0, 39, 0, 40, 0, 41, 0, 42, 0, 43, 0, 44, 0, 51, 0, 59, 0, 4, 1, 10, 1, 12, 1, 17, 1, 18, 1, 19, 1, 20, 1, 21, 1, 22, 1, 23, 1, 24, 1, 25, 1, 26, 1, 27, 1, 28, 1, 29, 1, 33, 1, 43, 1, 52, 1, 59, 1, 60, 1, 1, 2, 2, 2, 3, 2, 4, 2, 5, 2, 6, 2, 7, 2, 8, 2, 9, 2, 10, 2, 11, 2, 12, 2, 13, 2, 23, 2, 34, 2, 35, 2, 40, 2, 42, 2, 53, 2, 58, 2, 4, 3, 10, 3, 18, 3, 19, 3, 20, 3, 21, 3, 22, 3, 23, 3, 24, 3, 25, 3, 26, 3, 27, 3, 28, 3, 35, 3, 41, 3, 44, 3, 53, 3, 57, 3, 60, 3, 4, 4, 10, 4, 13, 4, 38, 4, 39, 4, 40, 4, 41, 4, 42, 4, 43, 4, 44, 4, 45, 4, 49, 4, 50, 4, 51, 4, 52, 4, 53, 4, 54, 4, 55, 4, 56, 4, 57, 4, 58, 4, 59, 4, 60, 4, 61, 4, 0, 5, 1, 5, 2, 5, 3, 5, 4, 5, 5, 5, 6, 5, 7, 5, 8, 5, 9, 5, 10, 5, 11, 5, 12, 5, 13, 5, 14, 5, 19, 5, 20, 5, 21, 5, 22, 5, 23, 5, 24, 5, 25, 5, 26, 5, 27, 5, 38, 5, 41, 5, 44, 5, 55, 5, 5, 6, 9, 6, 19, 6, 27, 6, 32, 6, 33, 6, 34, 6, 35, 6, 38, 6, 41, 6, 44, 6, 55, 6, 4, 7, 7, 7, 10, 7, 19, 7, 20, 7, 21, 7, 22, 7, 23, 7, 24, 7, 25, 7, 26, 7, 27, 7, 35, 7, 38, 7, 39, 7, 40, 7, 41, 7, 42, 7, 43, 7, 44, 7, 55, 7, 61, 7, 3, 8, 7, 8, 11, 8, 21, 8, 25, 8, 29, 8, 35, 8, 38, 8, 41, 8, 44, 8, 48, 8, 49, 8, 50, 8, 51, 8, 52, 8, 53, 8, 54, 8, 55, 8, 56, 8, 57, 8, 58, 8, 59, 8, 60, 8, 61, 8, 62, 8, 2, 9, 7, 9, 12, 9, 13, 9, 14, 9, 16, 9, 17, 9, 18, 9, 19, 9, 20, 9, 21, 9, 22, 9, 23, 9, 24, 9, 25, 9, 26, 9, 27, 9, 28, 9, 29, 9, 30, 9, 35, 9, 38, 9, 41, 9, 44, 9, 55, 9, 0, 10, 1, 10, 4, 10, 7, 10, 10, 10, 13, 10, 27, 10, 35, 10, 38, 10, 39, 10, 40, 10, 41, 10, 42, 10, 43, 10, 44, 10, 54, 10, 56, 10, 4, 11, 7, 11, 8, 11, 11, 11, 19, 11, 20, 11, 21, 11, 22, 11, 23, 11, 24, 11, 25, 11, 26, 11, 27, 11, 28, 11, 35, 11, 38, 11, 41, 11, 44, 11, 54, 11, 56, 11, 3, 12, 7, 12, 9, 12, 12, 12, 19, 12, 27, 12, 35, 12, 38, 12, 41, 12, 42, 12, 44, 12, 53, 12, 57, 12, 2, 13, 7, 13, 12, 13, 19, 13, 27, 13, 34, 13, 36, 13, 38, 13, 41, 13, 43, 13, 52, 13, 58, 13, 59, 13, 5, 14, 7, 14, 19, 14, 20, 14, 21, 14, 22, 14, 23, 14, 24, 14, 25, 14, 26, 14, 27, 14, 33, 14, 37, 14, 45, 14, 46, 14, 50, 14, 51, 14, 60, 14, 61, 14, 62, 14, 6, 15, 19, 15, 27, 15, 38, 15, 39, 15, 40, 15, 41, 15, 42, 15, 43, 15, 44, 15, 45, 15, 48, 15, 49, 15, 61, 15
    ; 0 墙 
    ; 1 路 普通
    ; 2 箱子
    ; 3 终点 
    gameMap dw 0,0,0,0,0,0,0,0,0,0 
            dw 0,0,0,0,3,0,0,0,0,0 
            dw 0,0,0,0,1,0,0,0,0,0 
            dw 0,0,0,0,1,0,0,0,0,0 
            dw 0,0,0,0,2,2,1,1,3,0 
            dw 0,3,1,1,2,1,0,0,0,0 
            dw 0,0,0,0,0,2,0,0,0,0 
            dw 0,0,0,0,0,1,0,0,0,0 
            dw 0,0,0,0,0,3,0,0,0,0 
            dw 0,0,0,0,0,0,0,0,0,0 

    gameEr dw 0,0,0,0,0,0,0,0,0,0  
           dw 0,0,0,1,1,1,0,0,0,0  
           dw 0,0,0,1,1,1,0,0,0,0 
           dw 0,0,1,0,1,0,1,0,0,0 
           dw 0,1,0,1,1,1,0,1,0,0 
           dw 0,0,0,0,1,0,0,0,0,0 
           dw 0,0,0,1,0,1,0,0,0,0 
           dw 0,0,1,0,0,0,1,0,0,0 
           dw 0,0,1,0,0,0,1,0,0,0 
           dw 0,0,0,0,0,0,0,0,0,0 

    boxGp  dw 1,1,1,1,1,1,1,1,1,1  
           dw 1,1,0,1,0,0,0,0,1,1  
           dw 1,0,1,0,0,1,0,1,0,1 
           dw 1,0,0,1,0,0,1,0,0,1 
           dw 1,0,1,0,1,1,0,1,0,1 
           dw 1,0,0,0,1,1,1,0,0,1 
           dw 1,0,0,1,0,0,1,0,0,1 
           dw 1,0,1,0,0,1,0,1,0,1 
           dw 1,1,0,1,0,0,0,0,1,1 
           dw 1,1,1,1,1,1,1,1,1,1 

    endGp  dw 0,0,0,0,0,0,0,0,0,0   
           dw 0,0,0,1,1,1,0,0,0,0  
           dw 0,0,1,0,0,0,1,0,0,0 
           dw 0,1,1,0,0,0,0,1,0,0 
           dw 0,1,1,0,1,1,0,1,0,0 
           dw 0,1,1,0,1,1,0,1,0,0 
           dw 0,1,1,0,1,1,0,1,0,0 
           dw 0,1,1,0,0,0,0,1,0,0 
           dw 0,0,1,1,1,1,1,0,0,0 
           dw 0,0,0,0,0,0,0,0,0,0 
    
    wallGp dw 1,1,1,1,1,1,1,1,1,1
           dw 1,0,0,1,0,0,0,0,0,1
           dw 1,0,0,1,0,0,0,0,0,1
           dw 1,0,0,1,1,1,1,1,1,1
           dw 1,0,0,1,0,0,0,0,0,1
           dw 1,0,0,1,0,0,0,0,0,1
           dw 1,1,1,1,1,1,1,1,1,1
           dw 1,0,0,0,0,1,0,0,0,1
           dw 1,0,0,0,0,1,0,0,0,1
           dw 1,1,1,1,1,1,1,1,1,1
   
   welcofontX dw 89
   welcofontY dw 29

   welcofont dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,1,0,0,1,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,1,0,0,0,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,1,1,1,1,0,0,1,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,1,0,1,0,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,0,0,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,1,1,1,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

; 游戏人物初始位置
baseGamerX dw 5
baseGamerY dw 5
judgeGamerX dw 0
judgeGamerY dw 0

judgeNextPointX dw 0
judgeNextPointY dw 0


; 基点 
basePointX dw 20 
basePointY dw 20
; 当前基点
nowBasePointX dw 0
nowBasePointY dw 0

; 单位长度
baseLong dw 10

willBoxX dw 0
willBoxY dw 0
newWillBoxXAndYBk dw 1
willBoxXAndYBk dw 1

; 标记取
flagIsWall dw 0
flagIsBox dw 0
flagIsWin dw 0
flagSound dw 0
have3 dw 0
; bodyWall dw
; ///代码块结束
;-----------------------------------------------------

start: 
    ; 进入图形模式
    call GetIntoDrawMode
    ; 记录地址
    mov si , color
    ; 调用调色模块 draw 一次 遍历 4个地址， color 包含两个 db 所以 运行 两次 可以 修改两组数据
    call draw
    call draw
    call draw

    ; mov ax, 0x0a000
    mov ax, 0xa000
    mov es, ax
    ; 往显存 (0xa0000 开始)中放入点数据

    ; call drawGameMap

    call theWelcom
    ; ; 键盘中断部分
    ; mov ax, 0xb800
    ; mov es,ax

    mov ax,0
    mov ds,ax
    
    ; 初始化 si
    mov si, 0

    cli 
    mov word [ds:0x24] , int_key
    mov word [ds:0x26] , 0
    sti
    ; 键盘中断部分结束


exit:
    jmp exit

; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// 键盘中断
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 

; 键盘 9 好中断  
int_key:
        mov dx, 0x60
        in  al, dx ; 利用 in  读入输入信息 al 代表 读取的键盘码
        
        ; j a4
        ; 开始游戏
        cmp al , 0xA4
        je call_j

        ; w 上
        cmp al , 0x91
        je call_w 

        ; s 下
        cmp al , 0x9F
        je call_s
        
        ; a 左
        cmp al , 0x9E
        je call_a
        
        ; d 右
        cmp al , 0xA0
        je call_d
        
        jmp k1

    ; 响应按键
    call_j:        
        call move_j
        jmp k1

    call_w:        
        call move_w
        jmp k1
    call_s:
        call move_s
        jmp k1
    call_a:
        call move_a
        jmp k1
    call_d:
        call move_d
        jmp k1

    k1:
        ; 这里触发一下判断
        ; 这里根据判断进行重绘
        mov dx, 0x20
        mov al, 0x61
        out dx, al ; 写入 cpu 
iret


; 每次移动需要做的判断
; 接下来的位置是不是墙，是就不可以过去 ok judge wall
; 如果是箱子，判断段箱子有无移动空间 judge move box 
; 做一个通关判断，如果数组中没有 3 表示通关 judge is win

move_j:
    call clearWind
    call drawGameMap
ret

; 按下 弹起 w 上
move_w:
    push bx
    push ax
    push dx
    ; 逻辑
    mov ax , [ds:baseGamerX]
    mov bx , [ds:baseGamerY]
    dec bx
    ; 先存到 judge 工具里
    mov [ds:judgeGamerX] , ax
    mov [ds:judgeGamerY] , bx
    
    
    call judgeWall
    ; 判断结束，康康是不是墙，如果是就不做后面的操作
    mov dx , 1
    cmp [ds:flagIsWall] , dx 
    je move_w_exit

    
    ; 保存目标点，以及目标点的对应方向的下一个点 
    ; 用做盒子移动判断
    mov ax , [ds:judgeGamerX]
    mov bx , [ds:judgeGamerY]

    dec bx

    mov [ds:judgeNextPointX] , ax
    mov [ds:judgeNextPointY] , bx

    call judgeNextIsLeagel

    mov dx , 1
    cmp [ds:flagIsBox] , dx
    je move_w_exit

    ; 胜利判断
    call theWinJudge

    ; -----------------------
    mov ax , [ds:judgeGamerX] 
    mov [ds:baseGamerX] , ax
    mov bx , [ds:judgeGamerY]
    mov [ds: baseGamerY] , bx
    call drawGameMap

move_w_exit:
    ; 标记初始化
    mov dx , 0
    mov [ds:flagIsWall] , dx ; 重置标记
    mov [ds:flagIsBox] , dx

    pop dx
    pop ax
    pop bx
    ret

; 按下 弹起 s 下
move_s:
    push bx
    push ax
    push dx
    mov ax , [ds:baseGamerX]
    mov bx , [ds:baseGamerY]
    inc bx
    mov [ds:judgeGamerX] , ax
    mov [ds:judgeGamerY] , bx
    
    call judgeWall
    ; 判断结束，康康是不是墙，如果是就不做后面的操作
    mov dx , 1
    cmp [ds:flagIsWall] , dx 
    je move_s_exit
    ; call judgeIsBoxS

    ; 保存目标点，以及目标点的对应方向的下一个点 
    ; 用做盒子移动判断
    mov ax , [ds:judgeGamerX]
    mov bx , [ds:judgeGamerY]

    inc bx

    mov [ds:judgeNextPointX] , ax
    mov [ds:judgeNextPointY] , bx

    call judgeNextIsLeagel

    mov dx , 1
    cmp [ds:flagIsBox] , dx
    je move_s_exit

    ; 胜利判断
    call theWinJudge

    ; ----------------------
    mov ax , [ds:judgeGamerX] 
    mov [ds:baseGamerX] , ax
    mov bx , [ds:judgeGamerY]
    mov [ds: baseGamerY] , bx
    call drawGameMap

move_s_exit:
    ; 标记初始化
    mov dx , 0
    mov [ds:flagIsWall] , dx ; 重置标记
    mov [ds:flagIsBox] , dx

    pop dx
    pop ax
    pop bx
    ret

; 按下 弹起 a 左
move_a:
    push bx
    push ax
    push dx
    mov ax , [ds:baseGamerY]
    mov bx , [ds:baseGamerX]
    dec bx
    mov [ds:judgeGamerY] , ax
    mov [ds:judgeGamerX] , bx
   
    call judgeWall  
    ; 判断结束，康康是不是墙，如果是就不做后面的操作
    mov dx , 1
    cmp [ds:flagIsWall] , dx 
    je move_a_exit


    ; 保存目标点，以及目标点的对应方向的下一个点 
    ; 用做盒子移动判断
    mov ax , [ds:judgeGamerX]
    mov bx , [ds:judgeGamerY]

    dec ax

    mov [ds:judgeNextPointX] , ax
    mov [ds:judgeNextPointY] , bx

    call judgeNextIsLeagel

    mov dx , 1
    cmp [ds:flagIsBox] , dx
    je move_a_exit

    ; 胜利判断
    call theWinJudge

    ; -------------------------
    mov ax , [ds:judgeGamerX] 
    mov [ds:baseGamerX] , ax
    mov bx , [ds:judgeGamerY]
    mov [ds: baseGamerY] , bx
    call drawGameMap

move_a_exit:
    
    ; 标记初始化
    mov dx , 0
    mov [ds:flagIsWall] , dx ; 重置标记
    mov [ds:flagIsBox] , dx

    pop dx
    pop ax
    pop bx
    ret


; 按下 d
move_d:
    push bx
    push ax
    push dx
    mov ax , [ds:baseGamerY]
    mov bx , [ds:baseGamerX]
    inc bx
    mov [ds:judgeGamerY] , ax
    mov [ds:judgeGamerX] , bx
    
    call judgeWall
    ; 判断结束，康康是不是墙，如果是就不做后面的操作
    mov dx , 1
    cmp [ds:flagIsWall] , dx 
    je move_d_exit

    ; 保存目标点，以及目标点的对应方向的下一个点 
    ; 用做盒子移动判断
    mov ax , [ds:judgeGamerX]
    mov bx , [ds:judgeGamerY]

    inc ax

    mov [ds:judgeNextPointX] , ax
    mov [ds:judgeNextPointY] , bx

    call judgeNextIsLeagel

    mov dx , 1
    cmp [ds:flagIsBox] , dx
    je move_d_exit

    ; 胜利判断
    call theWinJudge

    ; ---------------------------
    mov ax , [ds:judgeGamerX] 
    mov [ds:baseGamerX] , ax
    mov bx , [ds:judgeGamerY]
    mov [ds: baseGamerY] , bx
    call drawGameMap

move_d_exit:
    
    ; 标记初始化
    mov dx , 0
    mov [ds:flagIsWall] , dx ; 重置标记
    mov [ds:flagIsBox] , dx

    pop dx
    pop ax
    pop bx
    ret


; 下一跳的判断
; 流程
; 先判断当前 judgeGamerX and Y 是不是 箱子
; 如果是箱子就判断邻位是否是墙
judgeNextIsLeagel:
    push ax
    push bx
    push dx
    push cx
    ;stsp 判断是不是箱子
    mov ax, [ds:judgeGamerX]
    mov bx, [ds:judgeGamerY]
    mov [ds:willBoxX] , ax
    mov [ds:willBoxY] , bx
    call getGameMapByXAndY
    ; 获取到下一跳的类型
    mov cx , [ds:willBoxXAndYBk]
    mov dx , 2
    cmp cx , dx 
    jne notIsBox
    ; 到这里就知道他是一个盒子
    ; 获取下一跳的情况
    mov ax , [ds:judgeNextPointX]
    mov bx , [ds:judgeNextPointY]
    mov [ds:willBoxX] , ax
    mov [ds:willBoxY] , bx
    call getGameMapByXAndY
    ; 获取到下一跳的类型
    mov cx , [ds:willBoxXAndYBk]
    
    ; 等于零 表示下一跳是 墙，标记为 1 接下来不跳转
    mov dx , 0
    cmp cx , 0
    jne movTheBoxToNext
    mov dx , 1
    mov [ds:flagIsBox] , dx
    jmp notIsBox
movTheBoxToNext:
    ; 这里要把下一跳的矩阵值进行修改
    ; 具体内容
    ; judgeNextPointX and Y set 2
    ; judgeGamerX 1
    
    mov ax , [ds:judgeGamerX]
    mov bx , [ds:judgeGamerY]    
    mov [ds:willBoxX] , ax
    mov [ds:willBoxY] , bx
    mov dx , 1
    mov [ds:newWillBoxXAndYBk] , dx
    call setGameMapByXAndY

    mov ax , [ds:judgeNextPointX]
    mov bx , [ds:judgeNextPointY]
    mov [ds:willBoxX] , ax
    mov [ds:willBoxY] , bx
    mov dx , 2 
    mov [ds:newWillBoxXAndYBk] , dx
    call setGameMapByXAndY

notIsBox:
    pop cx
    pop dx
    pop bx
    pop ax
ret

; 判断墙壁判断函数先写这里
judgeWall:
    push ax
    push bx
    push si
    push dx
    push cx

    mov si , gameMap
    mov ax , [ds:judgeGamerY] ; 目标 y
    mov bx , [ds:judgeGamerX] ; 目标 x
    
    mov [ds:willBoxY] , ax
    mov [ds:willBoxX] , bx 
    
    call getGameMapByXAndY


    mov cx , [ds:willBoxXAndYBk] ; 转完之后的结果

    ; 如果不是墙就移动
    mov ax , 0
    cmp cx , ax
    jne judgeWallNext
    
    mov dx , 1 
    mov [ds:flagIsWall] , dx ; 如果不是 0 表示是墙 标记记为 1
    ; mov bx , [ds:judgeGamerX]
    ; mov ax , [ds:judgeGamerY] ; 目标 y

    ; 第二阶段，这个东西不可以直接放进去
    ; mov [ds:baseGamerX] , bx
    ; mov [ds:baseGamerY] , ax
    

judgeWallNext:
    pop cx
    pop dx 
    pop si
    pop bx
    pop ax
ret


getGameMapByXAndY:
    push ax
    push bx
    push si
    push cx
    push dx
    mov ax , 0 ; y
    mov bx , 0 ; x
    mov si , gameMap
getGameMapY:
    cmp ax , 9
    ja getGameMapYEnd
getGameMapX:
    cmp bx , 9
    ja getGameMapXEnd

judgeBoxsX:
    cmp bx , [ds:willBoxX]
    je judgeBoxsY
    jmp judgeBoxsNext
judgeBoxsY:
    cmp ax , [ds:willBoxY]
    je saveBoxXAndY
    jmp judgeBoxsNext
saveBoxXAndY:
    mov dx , [si]
    mov [ds:willBoxXAndYBk] , dx
judgeBoxsNext:

    inc si
    inc si
    inc bx 
    jmp getGameMapX
getGameMapXEnd:

    mov bx , 0
    inc ax
    jmp getGameMapY
getGameMapYEnd:
    
    pop dx
    pop cx
    pop si
    pop bx
    pop ax
ret



setGameMapByXAndY:
    push ax
    push bx
    push si
    push cx
    push dx
    mov ax , 0 ; y
    mov bx , 0 ; x
    mov si , gameMap
setGameMapY:
    cmp ax , 9
    ja setGameMapYEnd
setGameMapX:
    cmp bx , 9
    ja setGameMapXEnd


judgeSetBoxsX:
    cmp bx , [ds:willBoxX]
    je judgeSetBoxsY
    jmp judgeSetBoxsNext
judgeSetBoxsY:
    cmp ax , [ds:willBoxY]
    je saveSetBoxXAndY
    jmp judgeSetBoxsNext

saveSetBoxXAndY:
    mov dx , [ds:newWillBoxXAndYBk]
    mov [si] , dx

judgeSetBoxsNext:

    inc si
    inc si
    inc bx 
    jmp setGameMapX
setGameMapXEnd:

    mov bx , 0
    inc ax
    jmp setGameMapY
setGameMapYEnd:
    
    pop dx
    pop cx
    pop si
    pop bx
    pop ax
ret

; 判断游戏胜利
theWinJudge:
    push ax
    push bx
    push dx
    push si
    
    mov dx , 0
    mov [ds:have3] , dx ; 置零
    mov ax , 0 ; x
    mov bx , 0 ; y
    mov si , gameMap
theWinY:
    cmp bx , 9 
    ja theWinYEnd
theWinX:
    cmp ax , 9 
    ja theWinXEnd

    mov dx , 3
    cmp [si] , dx
    jne theWinXNext
    mov dx , 1
    mov [ds:have3] , dx
theWinXNext:
    inc si
    inc si
    inc ax
    jmp theWinX
theWinXEnd:
    mov dx , 0
    mov ax , 0
    inc bx
    jmp theWinY
theWinYEnd:

    mov dx , 1
    cmp [ds:have3] , dx
    jne gotWin
    mov dx , 0 
    mov [ds:flagIsWin] , dx

    jmp theWinJudgeEnd
gotWin:
    mov dx , 1 
    mov [ds:flagIsWin] , dx

theWinJudgeEnd:    
    pop si
    pop dx
    pop bx
    pop ax
ret
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 


; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// bit 图标
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 

; 绘制游戏地图
drawGameMap:
    push ax
    push bx
    push dx
    push si
    push cx

    ; call clearWind
    ; call GetIntoDrawMode
    ; mov ax, 0x0a000
    ; mov ax, 0xa000
    ; mov es, ax


    mov ax , 0 ; x
    mov bx , 0 ; y
    mov si ,  gameMap
    ; dx 作为中间变量

    mov dx , [ds:basePointX]
    mov [ds:nowBasePointX] , dx

    mov dx , [ds:basePointY]
    mov [ds:nowBasePointY] , dx


drawGameMapY:
    cmp bx , 9
    ja drawGameMapYEnd

drawGameMapX:
    cmp ax , 9
    ja drawGameMapXEnd
    mov cx , [si]
    
    mov dx , [ds:nowBasePointX]
    add dx , [ds:baseLong]
    mov [ds:nowBasePointX] , dx

    mov [ds:willDrawRelativeX] , dx

    mov dx , [ds:nowBasePointY]
    mov [ds:willDrawRelativeY] , dx
    
    ; 矩阵比较算法
    cmp cx , 0
    je drWall

    cmp cx , 1
    je drRoad

    cmp cx , 2
    je drBox

    cmp cx , 3
    je drEndGrain

    jmp drEd
    ; 绘图的过程，把偏移量移入，保存
    ; 调用绘制墙壁
    drWall:
        call theWall
        call theWallGrain
        jmp drEd
    
    ; 调用绘制路面
    drRoad:
        call theRoad
        jmp drEd

    drBox:
        call theRoad
        call theBox
        jmp drEd
    drEndGrain:
        call theRoad
        call theEndGrain
        jmp drEd
    ; 其他调用
    drEd:

    drawGamer:
    judgeX:
        cmp ax , [ds:baseGamerX]
        je judgeY
        jmp drawGamerEnd
    judgeY:
        cmp bx , [ds:baseGamerY]
        je drawGamerStart
        jmp drawGamerEnd

    drawGamerStart:
        call theHum
    drawGamerEnd:

    inc ax
    inc si;
    inc si;
    jmp drawGameMapX
    drawGameMapXEnd:

    ; x 回到列首部
    mov dx, [ds:basePointX]
    mov [ds:nowBasePointX] , dx

    ; y 去下一个单位
    mov dx , [ds:nowBasePointY]
    add dx , [ds:baseLong]
    mov [ds:nowBasePointY] , dx
    
    mov ax , 0
    inc bx
    jmp drawGameMapY
drawGameMapYEnd:

    ; 判断胜利

    mov dx , 1
    cmp [ds:flagIsWin] , dx
    jne drawEnd

    ; 先绘制一个款框
    ; 先把相对坐标置零

    mov dx , 150 
    mov [ds:willDrawRelativeX] , dx
    mov dx , 100
    mov [ds:willDrawRelativeY] , dx
    call drawFontGp

    ; 播放音频以显示胜利

    call musicFunction


    ; ; 回到基点位置 ， 根据玩家的位置去绘制
drawEnd:
    pop cx
    pop si
    pop dx
    pop bx
    pop ax
ret


; 播放音频
musicFunction:
    push bx
    push ax
    push cx
    push dx
    push si
    ; musizGp
    mov si , musizGp 
    mov cx , 0
musicSt:
    cmp cx , 10
    je musicEd

    mov bx , [si] ; 下面这个 bx 不要用 push pop 屏蔽
    call tosound
    
    inc si
    inc si
    inc cx 
    jmp musicSt
musicEd:
    pop si
    pop dx
    pop cx
    pop ax
    pop bx
ret

startMusic:
    push bx
    mov bx , [ds:table] ; 下面这个 bx 不要用 push pop 屏蔽
    call tosound
    pop bx
ret

startMusic1:
    push bx
    mov bx , [ds:table+4] ; 下面这个 bx 不要用 push pop 屏蔽
    call tosound
    pop bx
ret

drawFontGp:
    push ax
    push bx 
    push dx 
    push si
    mov ax , 0
    mov si , fontdata
drawFontStart:
    cmp ax , [ds:fontSize]
    ja drawFontEnd

    mov bx , [si]
    mov [ds:willDrawX] , bx
    mov bx , [si+2]
    mov [ds:willDrawY] , bx

    call drawPointByXAndY

    inc si 
    inc si
    inc si
    inc si
    inc ax
    jmp drawFontStart
drawFontEnd:
    pop si
    pop dx
    pop bx
    pop ax
ret

; 地面
; 获取基点 每次循环基点
theRoad:
    ; 设置画笔颜色
    push ax
    push bx

    mov ax , 3
    mov [ds:willDrawPen] , ax

    mov ax , 0 ; x
    mov bx , 0 ; y
    mov [ds:willDrawX] , ax
    mov [ds:willDrawY] , bx
theRoadY:
    cmp bx , [ds:baseLong]
    ja tehRoadYend

    theRoadX:
        cmp ax , [ds:baseLong]
        ja theRoadXend
        mov [ds:willDrawX] , ax
        mov [ds:willDrawY] , bx
        call drawPointByXAndY
        inc ax
        jmp theRoadX
    theRoadXend:

    mov ax , 0
    inc bx 
    jmp theRoadY
tehRoadYend:
    pop bx 
    pop ax
ret

; 墙
theWall:
    ; 设置画笔颜色
    push ax
    push bx

    mov ax , 4
    mov [ds:willDrawPen] , ax

    mov ax , 0 ; x
    mov bx , 0 ; y
    mov [ds:willDrawX] , ax
    mov [ds:willDrawY] , bx
theWallY:
    cmp bx , [ds:baseLong]
    ja theWallYend

    theWallX:
        cmp ax , [ds:baseLong]
        ja theWallXend
        mov [ds:willDrawX] , ax
        mov [ds:willDrawY] , bx
        call drawPointByXAndY
        inc ax
        jmp theWallX
    theWallXend:

    mov ax , 0
    inc bx 
    jmp theWallY
theWallYend:
    pop bx 
    pop ax
ret

; 箱子
theBox:
    push ax ; x
    push bx ; y
    push dx 
    push si 
    mov ax , 0
    mov bx , 0
    mov si , boxGp
    mov dx , 7
    mov [ds:willDrawPen] , dx
theBoxY:
    cmp bx , 9
    ja theBoxYEnd

    theBoxX:
    cmp ax , 9
    ja theBoxXEnd

    mov dx , 0
    cmp [si] , dx
    je drawBoxPointEnd
   
    mov [ds:willDrawX] , ax 
    mov [ds:willDrawY] , bx

    call drawPointByXAndY

    drawBoxPointEnd:
    inc si
    inc si
    inc ax
    jmp theBoxX
    theBoxXEnd:


    mov ax , 0
    inc bx
    jmp theBoxY    
theBoxYEnd:

    pop si
    pop dx
    pop bx
    pop ax
ret

; 人物
theHum:
    push ax ; x
    push bx ; y
    push dx 
    push si 
    mov ax , 0
    mov bx , 0
    mov si , gameEr
    mov dx , 6
    mov [ds:willDrawPen] , dx
theHumY:
    cmp bx , 9
    ja theHumYEnd

    theHumX:
    cmp ax , 9
    ja theHumXEnd

    mov dx , 0
    cmp [si] , dx
    je drawHumPointEnd
   
    mov [ds:willDrawX] , ax 
    mov [ds:willDrawY] , bx

    call drawPointByXAndY

    drawHumPointEnd:
    inc si
    inc si
    inc ax
    jmp theHumX
    theHumXEnd:


    mov ax , 0
    inc bx
    jmp theHumY    
theHumYEnd:

    pop si
    pop dx
    pop bx
    pop ax
ret 


; 终点纹路
theEndGrain:
    push ax ; x
    push bx ; y
    push dx 
    push si 
    mov ax , 0
    mov bx , 0
    mov si , endGp
    mov dx , 8
    mov [ds:willDrawPen] , dx
theEndGrainY:
    cmp bx , 9
    ja theEndGrainYEnd

    theEndGrainX:
    cmp ax , 9
    ja theEndGrainXEnd

    mov dx , 0
    cmp [si] , dx
    je drawEndPointEnd
   
    mov [ds:willDrawX] , ax 
    mov [ds:willDrawY] , bx

    call drawPointByXAndY

    drawEndPointEnd:
    inc si
    inc si
    inc ax
    jmp theEndGrainX
    theEndGrainXEnd:


    mov ax , 0
    inc bx
    jmp theEndGrainY    
theEndGrainYEnd:
    pop si
    pop dx
    pop bx
    pop ax
ret


; 墙壁纹路
theWallGrain:
    push ax ; x
    push bx ; y
    push dx 
    push si 
    mov ax , 0
    mov bx , 0
    mov si , wallGp
    mov dx , 8
    mov [ds:willDrawPen] , dx
theWallGrainY:
    cmp bx , 9
    ja theWallGrainYEnd

    theWallGrainX:
    cmp ax , 9
    ja theWallGrainXEnd

    mov dx , 0
    cmp [si] , dx
    je drawWallPointEnd
   
    mov [ds:willDrawX] , ax 
    mov [ds:willDrawY] , bx

    call drawPointByXAndY

    drawWallPointEnd:
    inc si
    inc si
    inc ax
    jmp theWallGrainX
    theWallGrainXEnd:


    mov ax , 0
    inc bx
    jmp theWallGrainY    
theWallGrainYEnd:
    pop si
    pop dx
    pop bx
    pop ax
ret
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 

; 欢迎页
theWelcom:
    push ax ; x
    push bx ; y
    push dx 
    push si 
    mov ax , 0
    mov bx , 0
    mov si , welcofont
    mov dx , 7
    mov [ds:willDrawPen] , dx
    mov dx , 115
    mov [ds:willDrawRelativeX] , dx
    mov dx , 70
    mov [ds:willDrawRelativeY] , dx

theWelcomY:
    cmp bx , [ds:welcofontY]
    ja theWelcomYEnd

    theWelcomX:
    cmp ax , [ds:welcofontX]
    ja theWelcomXEnd

    mov dx , 0
    cmp [si] , dx
    je drawWelcomPointEnd
   
    mov [ds:willDrawX] , ax 
    mov [ds:willDrawY] , bx

    call drawPointByXAndY

    drawWelcomPointEnd:
    inc si
    inc si
    inc ax
    jmp theWelcomX
    theWelcomXEnd:


    mov ax , 0
    inc bx
    jmp theWelcomY    
theWelcomYEnd:

    pop si
    pop dx
    pop bx
    pop ax
ret

; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// 绘图有关接口
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; 进入绘图模式
GetIntoDrawMode:
    ;进入图形模式
    mov ah , 00h
    mov al , 13h
    int 10h
ret

; mov bx, DrawX
; mov ax, DrawY
; TurnXY = (y - 0) * 320 + x
; x y 联合转化， 将 x y 坐标 通过计算保存起来
; 2020.12.25 修改，添加屏蔽
TurnXY:
    push ax 
    push bx

    mov ax , [ds:TurnY]
    mov bx , 320
    ; mov bx , 160
    mul bx 
    mov [ds:TurnBK], ax
    mov bx , [ds:TurnX]
    add [ds:TurnBK],  bx
    mov ax , [ds:TurnBK]

    pop bx
    pop ax
ret



; 配合 color 进行颜色设置
; si 数据地址
draw:
    push ax
    push dx

    ; 颜色编号  0x3c8 color 对应
    mov dx,0x3c8 
    mov al , [si]
    out dx , al
    ; R
    mov dx,0x3c9
    mov al , [si+1]
    out dx , al
    ; G
    ;mov dx,0x3c9
    mov al , [si+2]
    out dx , al
    ; B
    ;mov dx,0x3c9
    mov al , [si+3]
    out dx , al
    add si, 4

    pop dx
    pop ax
ret


drawPoint:
    push bx
    mov bx , bp
    mov byte[es:bx] , cl ; cl 是颜色编码 这里是绘制 语句
    pop bx
ret

clearWind:
    push ax
    push bx
    mov bx,  0
    mov ax, 64000
clearStart: 
    cmp bx , ax 
    ja clearFinish
    mov byte[es:bx] , 1 ; cl 是颜色编码 这里是绘制 语句 
    inc bx
    jmp clearStart
clearFinish:
    pop bx
    pop ax
ret 

; 3.0 增加相对坐标的绘制方法
; (willDrawRelativeX , willDrawRelativeY) 为根节点
; 相对于 这个点进行绘制，上面的点只需要初始化一次
; 原理 在目标点的基础上增加一层
drawPointByXAndY:
    push bp
    push bx 

    mov bx , [ds:willDrawX]
    mov bp , [ds:willDrawRelativeX]
    add bx , bp
    mov [ds:TurnX] , bx

    mov bx , [ds:willDrawY]
    mov bp , [ds:willDrawRelativeY]
    add bx , bp
    mov [ds:TurnY] , bx

    call TurnXY

    mov bx , [ds:TurnBK]
    mov [ds:willDrawXAndY] , bx

    ; 测试代码
    ; mov cl , 2
    mov cl , [ds:willDrawPen]

    mov bp , [ds:willDrawXAndY]
    call drawPoint
    pop bx
    pop bp
ret

; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 


; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// 声音有关的方法
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 

; 这里有个大坑，硬件运行太快，所以要用delay（我自己写的扥等待函数）去延迟一下
; 否则是不会响的
; 实际的过程是，启动扬声器，关闭发出声音，挺离谱的
tosound:
    mov [ds:nowUseHz] , bx
    call initSound
    call delay
    call openSoundPort
    call delay
    call closeSoundPort
ret

initSound:
    mov  al, 10110110B ;初始化，8253计数器2,模式3,初值16位,二进制
    out  43H, al ;Q8253的控制口地址43H
    call TurnHzToHex
    mov  ax, [ds:nowUseHzTurned] ;计数初值=1.19 MHz, 600 Hz=1983
    out  42H, al ;送计数初值低位字节，8253的计数器2的地址42H
    mov  al, ah
    out  42H, al ;送计数初值高位字节
ret


; 打开扬声器
openSoundPort:
    push ax
    in al , 61H
    or al , 00000011B ; 0000 0011 b
    out 61H , al
    pop ax
ret

; todo 写一个关闭扬声器
closeSoundPort:
    push ax
    in   al,61H
	and	 al,11111100B	;并行接口8255，PB1=0,关扬声器
	out	 61H,al
    pop ax
ret


; 将 hz 转化为可以使用值
; mubaio 
TurnHzToHex:
    ; ;设置频率
    push ax
	push dx 

    mov dx,12H
	mov ax,34DEH
	mov di,[ds:nowUseHz]
	div di
    mov [ds:nowUseHzTurned] , ax
    
    pop dx
    pop ax
ret

; 0.1s 的延迟 用就完事了
delay:
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
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
; //////// ; //////// ; //////// ; //////// ; //////// 
