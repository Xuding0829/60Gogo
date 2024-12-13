org 0x8400
    jmp start

str_welcome db "Strangers welcome you, please press [Enter] to enter the main interface."
pos dw 28925    ; 90*320+125
hello_pos dw 58170
start_pos dw 58243
flag_num db 0
flag db 0
mycolor db 1,242,24,16      ; red
        db 2,35,186,15      ; green
        db 3,16,38,242      ; blue
        db 4,241,207,107    ; 图标背景色
        db 5,112,113,116    ; 主页字体颜色
        db 6,0,0,0
        db 7,255,255,255
		db 8,221,223,19		

a	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,1,1,1,0,0,0,0
	db	0,0,0,1,1,1,0,0,1,1,1,0,0,0
	db	0,0,0,1,1,1,0,0,1,1,1,0,0,0
	db	0,0,0,0,0,0,1,1,1,1,1,0,0,0
	db	0,0,0,1,1,1,1,1,1,1,1,0,0,0
	db	0,0,1,1,1,0,0,0,1,1,1,0,0,0
	db	0,0,1,1,1,0,0,0,1,1,1,0,0,0
	db	0,0,1,1,1,0,0,1,1,1,1,1,0,0
	db	0,0,0,1,1,1,1,1,1,1,1,1,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0

l   db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,1,1,1,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,0,0,0,1,1,0,0,0,0,0,0
    db  0,0,0,1,1,1,1,1,1,1,1,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0

p   db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,1,1,1,1,1,1,1,1,0,0,0,0
    db  0,0,0,1,1,1,1,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,0,1,1,1,0,0
    db  0,0,0,1,1,1,0,0,0,1,1,1,0,0
    db  0,0,0,1,1,1,0,0,0,1,1,1,0,0
    db  0,0,0,1,1,1,0,0,0,1,1,1,0,0
    db  0,0,0,1,1,1,0,0,0,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,1,1,1,1,0,0,0,0
    db  0,0,0,1,1,1,0,0,0,0,0,0,0,0
    db  0,0,0,1,1,1,0,0,0,0,0,0,0,0
    db  0,0,1,1,1,1,1,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0

h   db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,1,1,0,0,0,0,0,0,0,0
    db  0,0,1,1,1,1,0,0,0,0,0,0,0,0
    db  0,0,0,1,1,1,0,0,0,0,0,0,0,0
    db  0,0,0,1,1,1,0,0,0,0,0,0,0,0
    db  0,0,0,1,1,1,0,0,0,0,0,0,0,0
    db  0,0,0,1,1,1,1,1,1,1,0,0,0,0
    db  0,0,0,1,1,1,1,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,1,1,1,1,1,1,1,1,1,1,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0

e   db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,1,1,1,1,1,0,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,0,1,1,0,0,0
    db  0,0,0,1,1,0,0,0,0,1,1,0,0,0
    db  0,0,1,1,1,1,1,1,1,1,1,1,0,0
    db  0,0,0,1,1,0,0,0,0,0,0,0,0,0
    db  0,0,0,1,1,0,0,0,0,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,0,1,1,1,1,1,1,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0

o   db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,1,1,1,1,1,1,0,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,1,1,0,0,0,0,1,1,0,0,0
    db  0,0,1,1,1,0,0,0,0,1,1,1,0,0
    db  0,0,1,1,1,0,0,0,0,1,1,1,0,0
    db  0,0,1,1,1,0,0,0,0,1,1,1,0,0
    db  0,0,0,1,1,0,0,0,0,1,1,0,0,0
    db  0,0,0,1,1,1,0,0,1,1,1,0,0,0
    db  0,0,0,0,1,1,1,1,1,1,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0
    db  0,0,0,0,0,0,0,0,0,0,0,0,0,0  

s	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,1,1,1,1,0,0,0
	db	0,0,0,1,1,1,0,0,1,1,1,0,0,0
	db	0,0,0,1,1,1,0,0,0,1,1,0,0,0
	db	0,0,0,0,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,1,1,0,0,0,0
	db	0,0,0,0,0,0,0,0,1,1,1,0,0,0
	db	0,0,0,1,1,0,0,0,0,1,1,0,0,0
	db	0,0,0,1,1,1,0,0,1,1,1,0,0,0
	db	0,0,0,1,1,1,1,1,1,1,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0

t	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,1,1,1,1,1,1,1,1,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,1,1,1,0,1,1,0,0,0
	db	0,0,0,0,0,1,1,1,0,1,1,0,0,0
	db	0,0,0,0,0,0,1,1,1,1,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0

r	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,1,1,1,1,1,1,1,1,1,1,0,0
	db	0,0,0,0,1,1,1,1,1,1,1,1,0,0
	db	0,0,0,0,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,1,1,1,0,0,0,0,0,0,0
	db	0,0,1,1,1,1,1,1,1,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0

number1	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

number2	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0
	db	0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0
	db	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

start:

    mov ax,0xb800
	mov es,ax
	mov ax,0
	mov ds,ax
	
	call clear_screen	; 清屏
	call welcome	; 欢迎界面

    sti
	mov word[ds:0x24],int_key	; 键盘中断，是否进入主界面
	mov word[ds:0x26],0

enter_to_main:
	cmp byte[ds:flag_num],0x1c  ; 回车
	jne enter_to_main

main:
    mov ah,00h
	mov al,13h
	int 10h

	mov ax,0xa000
	mov es,ax

	mov ax,0
	mov ds,ax

    mov si,mycolor
    call editcolor
    call draw_num
	call taskbar
	mov ah,7
	call draw_start

    mov word[ds:0x20],int_time	; 时钟中断
	mov word[ds:0x22],0

    mov word[ds:0x24],int_key	; 键盘中断，是否进入主界面
	mov word[ds:0x26],0

work:
	cmp byte[ds:flag_num],0x82		; 1，work1
	je work1
	cmp byte[ds:flag_num],0x83		; 2，work2
	je work2
    jne work

work1:
    mov ah,00h
	mov al,13h
	int 10h

	mov ax,0xa000
	mov es,ax

	mov ax,0
	mov ds,ax

	mov si,mycolor
    call editcolor
	call taskbar
	mov ah,7
	call draw_start

sound:
    cmp byte[ds:flag_num],0x9e  ; 字母a
    je key_a
    cmp byte[ds:flag_num],0x9f  ; 字母s
    je key_s
    cmp byte[ds:flag_num],0xa0  ; 字母d
    je key_d
    cmp byte[ds:flag_num],0xa1  ; 字母f
    je key_f
    cmp byte[ds:flag_num],0xa2  ; 字母g
    je key_g
    cmp byte[ds:flag_num],0xa3  ; 字母h
    je key_h
    cmp byte[ds:flag_num],0xa4  ; 字母j
    je key_j
    cmp byte[ds:flag_num],0xa5  ; 字母k
    je key_k
    cmp byte[ds:flag_num],0xa6  ; 字母l
    je key_l
    cmp byte[ds:flag_num],0x81  ; esc
    je main
    jne sound

    jmp $

key_a:
	mov bx,110
	jmp play
key_s:
	mov bx,220
	jmp play
key_d:
	mov bx,440
	jmp play
key_f:
	mov bx,880
	jmp play
key_g:
	mov bx,1760
	jmp play
key_h:
	mov bx,1864
	jmp play
key_j:
	mov bx,1975
	jmp play
key_k:
	mov bx,3951
    jmp play
key_l:
    mov bx,3520
play:
	call change_sound
	call play_sound
    call clear_flagnum
    jmp sound


work2:
    mov ah,00h
	mov al,13h
	int 10h

	mov ax,0xa000
	mov es,ax

	mov ax,0
	mov ds,ax

	mov si,mycolor
    call editcolor
	call taskbar
	mov ah,7
	call draw_start

    mov ah,6
    call draw_alpha

change_color:
    cmp byte[ds:flag_num],0x93  ; 字母r
    je red
    cmp byte[ds:flag_num],0xa2  ; 字母g
    je green
    cmp byte[ds:flag_num],0xb0  ; 字母b
    je blue
	cmp byte[ds:flag_num],0x95	; 字母y
	je yellow
    cmp byte[ds:flag_num],0x81  ; esc
    je main
    jne change_color

    jmp $

red:
    mov ah,1
    call draw_alpha
    jmp change_color

green:
    mov ah,2
    call draw_alpha
    jmp change_color

blue:
    mov ah,3
    call draw_alpha
    jmp change_color

yellow:
	mov ah,8
	call draw_alpha
	jmp change_color

int_key:
    push ax
    push dx
    mov dx,0x60
	in al,dx

	mov byte[ds:flag_num],al	; 按键信息存放在flag_num中

	mov dx,0x20
	mov al,0x61
	out dx,al
    pop dx
    pop ax
    iret

int_time:
    push ax
    push dx
    push cx
    mov cl,[ds:flag]
    cmp cl,1
    je hello1
hello0:
    mov ah,6
    call draw_hello
    jmp t1
hello1:
    mov ah,7
    call draw_hello
t1:
    call changeFlag
    mov al,0x20
    mov dx,0x20
    out dx,al
    pop cx
    pop dx
    pop ax
    iret

; 清空flag_num的值
clear_flagnum:
    push cx
	mov cx,[ds:flag_num]
	mov cx,0
	mov [ds:flag_num],cx
    pop cx
	ret

; 修改Flag值
changeFlag:
    push ax
    mov al,[ds:flag]
    cmp al,1
    je change0
    mov al,1
    mov byte[ds:flag],al
    jmp back
change0:
    mov al,0
    mov byte[ds:flag],al
back:
    pop ax
    ret

; bx放需要修改成的频率,计数初值在ax中
change_sound:
    push di
	mov al,10110110b
	out 43h,al
	mov dx,0012h
	mov ax,34deh
	mov di,bx
	div di
	out 42h,al
	mov al,ah
	out 42h,al
    pop di
	ret

play_sound:
    push ax
	; 开启扬声器
	in al,61h
	or al,00000011b
	out 61h,al

	call sleep
	call sleep
	call sleep
	call sleep
	call sleep

	; 关闭扬声器
	in al,61h
	and al,11111101b
	out 61h,al
    pop ax
	ret


; 定时时间修改
changeTime:
	mov al,0x34
 	mov dx,0x43
 	out dx,al	
 	mov al,0x00         ; 高八位
 	mov dx,0x40
 	out dx,al	
 	mov al,0x11	        ; 低八位
 	mov dx,0x40
 	out dx,al
	ret

; 1、2绘制
draw_num:
	push bx
	push si
	mov bx,number1
	mov si,3265
	call draw

	mov bx,number2
	mov si,3395
	call draw
	pop si
	pop bx
	ret

; 29*29
draw:
	push di
	push cx
	push si
	push ax
	mov cx,0
	mov di,0
for:
	mov al,[bx+di]
	inc di
	inc cx
	inc si
	cmp al,1		; 为1则涂色
	je draw_color
	mov byte[es:si],4
	cmp cx,29		; 每行29个像素点
	je nextline
ifendline:		; 判断是否结束一个字符
	cmp di,841	; 29*29个像素点，小于则继续遍历矩阵
	jb for
	pop ax
	pop si
	pop cx
	pop di
	ret
draw_color:
	mov byte[es:si],5
	jmp for
nextline:
	add si,291		; 到下一行的开头，320-29
	mov cx,0
	jmp ifendline

; 清屏模块
clear_screen:
	push cx
	push bx
	mov cx,0x0001
	mov bx,0
clear:
	cmp cx,0x07d0	; 80*25，是否到屏幕末端
	ja jmpclear
	mov byte[es:bx],' '
	inc bx
	mov byte[es:bx],0x0c
	inc bx
	inc cx
	jmp clear
jmpclear:
	pop bx
	pop cx
	ret

; 欢迎界面模块
welcome:
	push bx
	push di
	mov bx,0
	mov di,0
print:
	mov al,[ds:str_welcome+di]
	mov byte[es:bx+1928],al
	mov byte[es:bx+1929],0x0b
	call sleep
	call sleep
	add bx,2
	inc di
	cmp di,72
	jb print
	pop di
	pop bx
	ret

; bx放点阵图，si放起始位置,ah放色号
draw_small:
	push di
	push cx
	push si
	mov cx,0
	mov di,0
for_small:
	mov al,[bx+di]
	inc di
	inc cx
	inc si
	cmp al,1		; 为1则涂色
	je draw_color_small
	cmp cx,14		; 每行14个像素点
	je nextline_small
ifendline_small:		; 判断是否结束一个字符
	cmp di,252	; 14*18个像素点，小于则继续遍历矩阵
	jb for_small
	pop si
	pop cx
	pop di
	ret
draw_color_small:
	mov byte[es:si],ah
	jmp for_small
nextline_small:
	add si,306		; 到下一行的开头，320-14
	mov cx,0
	jmp ifendline_small

; 绘制hello单词
draw_hello:
    push bx
    push si
    mov bx,h
    mov si,[ds:hello_pos]
    call draw_small
    add si,14
    mov bx,e
    call draw_small
    add si,14
    mov bx,l
    call draw_small
    add si,14
    call draw_small
    add si,14
    mov bx,o
    call draw_small
    pop si
    pop bx
    ret

; 绘制start单词
draw_start:
	push bx
    push si
    mov bx,s
    mov si,[ds:start_pos]
    call draw_small
    add si,14
    mov bx,t
    call draw_small
    add si,14
    mov bx,a
    call draw_small
	mov bx,r
    add si,14
    call draw_small
    add si,14
    mov bx,t
    call draw_small
    pop si
    pop bx
    ret

; 绘制alpha单词
draw_alpha:
    push bx
    push si
    mov bx,a
    mov si,[ds:pos]
    call draw_small
    add si,14
    mov bx,l
    call draw_small
    add si,14
    mov bx,p
    call draw_small
    add si,14
    mov bx,h
    call draw_small
    add si,14
    mov bx,a
    call draw_small
    pop si
    pop bx
    ret

;编制自定义颜色，色号+RGB事先放入si中
editcolor:
	push dx
	push ax
	push cx
	mov cx,0
	;设置颜色号接口0x3c8,RGB分量接口0x3c9
set_color:
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
	inc cx
	cmp cx,4
	jb set_color
	pop cx
	pop ax
	pop dx
	ret

; 延迟模块
sleep:
	push ax
	mov ax,0
next:
	inc ax
	cmp ax,0xffff
	jb next
	pop ax
	ret

taskbar:
		mov ax,180 ;起点y
		mov bx,0 ;起点x
		mov cx,320 ;直线 长度
		mov dl,8;
		call draw_0
		mov cx,20		; 重复次数cx
		
taskbar_bg:
		push cx
        inc ax
		mov bx,0 ;起点x
		mov cx,320 ;直线 长度
		mov dl,8;
		call draw_0
		pop cx
		loop taskbar_bg		; 自动-1
taskbar_1:
		mov ax,182 ;起点y
		mov bx,2 ;起点x
		mov cx,70 ;直线 长度
		mov dl,0;
		call draw_0
		mov ax,183 ;起点y
		mov bx,2 ;起点x
		mov cx,15 ;直线 长度
		mov dl,0;
		call draw_1
		mov ax,197 ;起点y
		mov bx,2 ;起点x
		mov cx,70 ;直线 长度
		mov dl,0;
		call draw_0
		mov ax,182 ;起点y
		mov bx,71 ;起点x
		mov cx,15 ;直线 长度
		mov dl,0;
		call draw_1
		
taskbar_2:
		mov ax,182 ;起点y
		mov bx,250 ;起点x
		mov cx,70  ;直线 长度
		mov dl,0
		call draw_0
		mov ax,183 ;起点y
		mov bx,250 ;起点x
		mov cx,15 ;直线 长度
		mov dl,0
		call draw_1
		mov ax,197 ;起点y
		mov bx,250 ;起点x
		mov cx,70 ;直线 长度
		mov dl,0
		call draw_0
		mov ax,183 ;起点y
		mov bx,319 ;起点x
		mov cx,15 ;直线 长度
		mov dl,0
		call draw_1
		ret

; 横线，ax列y，bx行x，cx长度，dl色号
draw_0:	
		push ax
		push bx
		push cx
		push dx
		
		mov dx,320
		mul dx
		add bx,ax
		pop dx
x1: 	mov [es:bx],dl
		inc bx
		dec cx
		jnz x1
		
		pop cx
		pop bx
		pop ax
		
		ret

; 竖线
draw_1: 
		push ax
		push bx
		push cx
		push dx
		
		mov dx,320
		mul dx
		add bx,ax
		pop dx
x2: 	mov [es:bx],dl
		add bx,320
		dec cx
		jnz x2
		pop cx
		pop bx
		pop ax
		ret