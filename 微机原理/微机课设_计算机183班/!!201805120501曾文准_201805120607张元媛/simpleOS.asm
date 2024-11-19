org 0x8400	; IMG文件刷入起始地址为:400H


jmp 	main

;==================配置颜色===================
color_rgb 		db 0, 0, 0
				db 255, 255, 255	;white
				db 255, 0, 0		;red
				db 0, 255, 0		;green
    			db 0, 0, 255		;blue
				db 0, 136, 136		
				db 199, 199, 199	;gray

color_temp		db 0

;==================输入密码===================
input_msg      	db 'Please input your password'
welcome_msg		db 'Welcome!'
error_msg      	db 'Password error'
passwd         	db '123456'
blank_msg		db '      '
blank_msg2		db '              '

;==================绘制中文字符==================
kai		db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		db 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0


shi3	db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0
		db 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1
		db 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1
		db 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0
		db 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0
		db 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


dian	db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0
		db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0

zi		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0
		db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1
		db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0

qin		db 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1
		db 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0


ji		db 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0
		db 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0
		db 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0
		db 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1
		db 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1
		db 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1
		db 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1


shi4	db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		db 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0


ben		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		db 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1
		db 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0


zhu 	db 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0
		db 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0
		db 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
		db 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		db 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


xiao 	db 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0
		db 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0
		db 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
		db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
		db 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0
		db 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0
		db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0


;==================中文字符结束==================


charBackColor 	db 0
charForeColor 	db 1

;==================计时器中断==================
; 计时器
time_clock		db 0
time_second_3	db 30h 	; '3'
pos_jinDuTiao		dw 0

;==================键盘中断==================
; 桌面键盘中断
KEY_CTRL 		db 0
KEY_ENTER 		db 0
POS_CAIDAN		db 0
; 记事本键盘中断
POS_KEY			dw 0
KEY_SHIFT 		db 0
KEY_EXTEND_E0 	db 0
KEY_ALT 		db 0
KEY_ESC 		db 0


;==================电子琴所需参数==================
;扬声器控制区
;键盘偏移量
output_key dw 0
;键盘数组区
music_sound:
 dw 261
 dw 293
 dw 329
 dw 349
 dw 392
 dw 440
 dw 493
 
output_cycle dd 0Xffffff

;线程控制区
mutex db 0
;主线程的标志位信息保存
flagmain db 0
;中断多线程的标志位信息保存
flagmultitask db 0

;键盘控制区
;是否大写
isCaptilize db 0

;==================主程序开始==================
main:

	call 	@text_pattern_config

task_main:

	mov 	di, 0
	mov     bx, 0
	mov     ah, 00h

;==================输入密码==================
_enter:


clear_screen:

	call 	@clear_screen

print_input:

	mov     ax, 0
	mov     ds, ax
	mov     di, 1334
	mov     bx, input_msg
	mov 	si, 26
	call 	@print_msg

input_password:

	mov     di, 1514
	mov     bx, passwd
	mov 	cx, 6
	mov     bp, 0
	call 	@input_password

judge_welcome_or_error:

	cmp     bp, 1
	jnz     print_welcome
	jmp     print_error

print_welcome:

	mov     bx, blank_msg2
	mov     di, 1986
	mov 	si, 14
	call    @print_msg
	mov 	si, 8
	mov     bx, welcome_msg
	mov     di, 1992
	mov 	si, 8
	call    @print_msg
	mov 	word [ds:0x20], int_clock
	mov 	word [ds:0x22], 0
	sti
	jmp 	_stop

print_error:

	mov     bx, error_msg
	mov     di, 1986
	mov 	si, 14
	call 	@print_msg
	mov     bx, blank_msg
	mov     di, 1514
	mov 	si, 6
	call 	@print_msg
	jmp	input_password

graphic_pattern:

	mov 	byte [ds:KEY_ESC], 0
	mov 	byte [ds:time_second_3], 0x34
	mov 	word [ds:0x24], int_key_desktop
	mov 	word [ds:0x26], 0
	sti

    mov     al, 0x13    ; VGA320 * 200 * 8 bit显示模式
    mov     ah, 0x00    ; 设置显示模式
    int     0x10
	call 	@graphic_pattern_config

configure_color:

    mov 	si, color_rgb
	mov 	cx, 7
	call 	@configure_color

paint_screen:

	mov 	bx, 0
	mov 	cx, 64000 	; 320 * 200次
	mov 	dl, 30
	call 	@paint_screen

paint_rectangle:

	mov 	ax, 0
	mov 	bx, 0
	mov 	cx, 320
	mov 	di, 180
	mov 	dl, 1		;white
	call 	@drawRectangle

paint_zh_CN:
	;底部菜单栏
	mov 	ax, 180
	mov 	bx, 0
	mov 	cx, 320
	mov 	di, 200
	mov 	dl, 6
	call 	@drawRectangle	;(0,180-320,200)
	
	;仿win10图标
	mov 	ax, 40
	mov 	bx, 130
	mov 	cx, 158
	mov  	di, 68
	mov 	dl, 4			
	call 	@drawRectangle	;(130,40-158,68)

	mov 	ax, 40
	mov 	bx, 160
	mov 	cx, 188
	mov  	di, 68
	mov 	dl, 4			
	call 	@drawRectangle	;(160,40-188,68)

	mov 	ax, 70
	mov 	bx, 160
	mov 	cx, 188
	mov  	di, 98
	mov 	dl, 4			
	call 	@drawRectangle	;(160,70-188,98)

	mov 	ax, 70
	mov 	bx, 130
	mov 	cx, 158
	mov  	di, 98
	mov 	dl, 4			
	call 	@drawRectangle	;(130,70-158,98)

;画开始菜单
draw_start:

	; mov 	ax, 182
	; mov 	bx, 16
	; mov 	cx, 32
	; mov  	di, 189
	; mov 	dl, 1			
	; call 	@drawRectangle	;(16,182-32,189)
	
	; mov 	ax, 182
	; mov 	bx, 34
	; mov 	cx, 50
	; mov  	di, 189
	; mov 	dl, 1			
	; call 	@drawRectangle	;(34,182-50,189)
	
	; mov 	ax, 191
	; mov 	bx, 16
	; mov 	cx, 32
	; mov  	di, 198
	; mov 	dl, 1			
	; call 	@drawRectangle	;(16,191-32,198)
	
	; mov 	ax, 191
	; mov 	bx, 34
	; mov 	cx, 50
	; mov  	di, 198
	; mov 	dl, 1			
	; call 	@drawRectangle	;(34,191-50,198)
	
	mov		ax, 75
	mov 	bx, 180
	mov		cx, 200
	mov 	dl, 1
	call 	@drawLineOfV	;(75,180-200)

	mov		ax, 182
	mov 	bx, 14
	mov 	si, kai
	call 	@drawChar

	mov 	ax, 182
	mov 	bx, 44
	mov 	si, shi3
	call 	@drawChar

	jmp 	_stop

text_pattern:

	;call 	@timerEmpty
	mov     ah, 0x00
    mov     al, 0x03
    int     0x10
	call 	@text_pattern_config
	call 	@clear_screen

task_key:
	mov 	word [ds:0x24], int_key
	mov 	word [ds:0x26], 0
	sti

_stop:

	cmp 	byte [ds:time_second_3], 0x33
	jz 		graphic_pattern
	cmp 	byte [ds:KEY_ESC], 1
	jz 		graphic_pattern
	cmp 	byte [ds:KEY_ENTER], 1
	jnz 	_stop
	mov 	byte [ds:KEY_ENTER], 0
	
	_stop_CAIDAN_0:
		cmp 	byte [ds:POS_CAIDAN], 0
		jz 		text_pattern
		
	_stop_CAIDAN_1:
		cmp 	byte [ds:POS_CAIDAN], 1
		jnz 	_stop_CAIDAN_2
		mov     ah, 0x00
		mov     al, 0x03
		int     0x10
		call 	@text_pattern_config
		jmp 	electronicOrgan
		
	_stop_CAIDAN_2:
		cmp 	byte [ds:POS_CAIDAN], 2
		jz 		text_pattern

		jmp 	_stop

_end:

	jmp 	$
	

;==================电子琴==================
electronicOrgan:
	;sti:IF标志位置1,clf:IF标志位置0--用来置于可屏蔽中断
	sti
	
	
	mov ax,0xb800
	mov es,ax
	
	mov ax,0
	mov ds,ax
	
	cli
	
	mov bx,0
	
	;键盘中断偏移地址
	mov word[ds:0x24],int_electronic_key
	;键盘中断起始地址
	mov word[ds:0x26],0
	
	sti
	
	call frequency_setting
	call timer_frequency_setting
	call sound_close
	
	jmp $
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;声音延时
	sound_delay:
		mov dword[ds:output_cycle],0x6ffff
	sound_delay_loop:
		cmp dword[ds:output_cycle],0
		je sound_delay_exit
		dec dword[ds:output_cycle]
		jmp sound_delay_loop
	sound_delay_exit:
		ret
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;设置频率
	frequency_setting:
		MOV  DX,12H
		MOV  AX,34DEH
		mov si,[ds:output_key]
		MOV  DI,word[ds:music_sound+si]
		DIV DI
		mov word[ds:output_key],ax
	frequency_setting_exit:
		ret
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;给扬声器定时器频率
	timer_frequency_setting:
		mov al,10110110B
		out 43h,al
		mov ax,word[ds:output_key]
		out 42h,al
		mov al,ah
		out 42h,al
	timer_frequency_setting_exit:
		ret
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;扬声器端口打开
	sound_open:
		in al,61h
		or al,00000011B
		out 61h,al
	sound_play_exit:
		ret
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	;扬声器端口关闭
	sound_close:
		in al,61h
		and al,11111101B
		out 61h,al
	sound_close_exit:
		ret
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	;键盘中断	
	int_electronic_key:
		mov dx, 0x20 	; 中断芯片
		mov al, 0x61 	; 键盘编码放入AL
		out dx, al
		mov dx, 0x60	; 键盘管理器
		in 	al, dx		; 读键盘编码

	judgeCaptilizeDown:	
		cmp al,0x3A
		jne judgeCaptilizeUp

	judgeCaptilizeUp:
		cmp al,0xBA
		;如果大小切换键的按下和释放都不满足，则输入正常的键盘值
		jne key_output
		
		
		;确定之前状态的大小键盘是开启还是关闭
		cmp byte[ds:isCaptilize],1
		jne openCaptilization
	closeCaptilization:
		;之前的大写模式开启，现在关闭大写
		mov byte[ds:isCaptilize],0
		
		jmp key_output
	openCaptilization:
		;之前的大写模式没开启，现在开启大写
		mov byte[ds:isCaptilize],1
		
		
		
		jmp key_output
		
	key_output:

		cmp byte[ds:isCaptilize],1
		jnz noncaptilize_output
	;声音播放输出区
	captilize_output:
		;1
		cmp al,0x02
		jne nexts2
		
		mov word[ds:output_key],0

		jmp key_op
	nexts2:
		;2
		cmp al,0x03
		jne nexts3
		mov word[ds:output_key],2

		jmp key_op
	nexts3:
		;3
		cmp al,0x04
		jne nexts4
		mov word[ds:output_key],4

		jmp key_op
	nexts4:
		;4
		cmp al,0x05
		jne nexts5
		mov word[ds:output_key],6

		jmp key_op
	nexts5:
		;5
		cmp al,0x06
		jne nexts6
		mov word[ds:output_key],8

		jmp key_op
	nexts6:
		;6
		cmp al,0x07
		jne nexts7
		mov word[ds:output_key],10

		jmp key_op	
	nexts7:
		;7
		cmp al,0x08
		jne exitEsc
		mov word[ds:output_key],12

		jmp key_op			
	exitEsc:
		cmp al,0x01
		jne k1
		mov byte [ds:KEY_ESC], 1
		jmp _stop
	
	;大写键盘未开不输出声音
	noncaptilize_output:	
			
		jmp next_output	

	key_op:
		call frequency_setting
		call timer_frequency_setting
		;打开扬声器并延时一段时间后关闭
		call sound_close
		call sound_open
		call sound_delay
		call sound_close
		jmp next_output
		
	;下一次输出区的屏幕位置
	next_output:
		add si,2
		
	k1:	
		iret
;==================电子琴end==================


; @text_pattern_config
; 文本模式配置
@text_pattern_config:
	mov 	ax, 0xb800  ; 指向文本模式的显示缓冲区
	mov 	es, ax

	mov 	ax, 0
	mov 	ds, ax

	ret

; @graphic_pattern_config
; 图形模式配置
@graphic_pattern_config:
	mov     ax, 0x0a000 ; VGA模式显存地址
	mov 	es, ax
	ret

; @clear_screen
; 文本模式清屏
@clear_screen:

	push 	ax
	push 	bx
	push 	cx

	mov		bx, 0
	mov 	cx, 2000
	clear_screen_loop:

		cmp     bx, 4000
		mov     al, ' '
		;mov 	ah, 0xf0
		mov     [es:bx], ax
		inc     bx
		inc     bx
		dec 	cx
		jnz     clear_screen_loop

	pop 	cx
	pop 	bx
	pop 	ax

	ret


; @print_msg
; 文本模式打印信息
; 参数:
; BX:要打印的字符串
; DI:当前字符位置
; SI:打印的字符长度
@print_msg:

	mov     ah, 0ch
	mov     al, [ds:bx]
	mov     [es:di], ax
	inc     di
	inc     di
	inc     bx
	dec 	si
	jnz     @print_msg

	ret

; @input_password
; 输入密码并判断是否正确
; 参数:
; DI:输入位置
; BX:密码
; CX:密码位数
; BP:密码对错flag,默认应为0
@input_password:

	input_password_loop:
		mov     ah, 0x00
		int     0x16
		mov     ah, 0x0e
		int     0x10
		cmp     al, [ds:bx]
		jnz     judge_passwd_error
		mov     [es:di], ax
		inc     di
		inc     di
		inc     bx
		dec 	cx
		jnz     input_password_loop
		jmp 	input_password_end
	; bp为判断是否输入错误flag
	judge_passwd_error:
		mov     bp, 1
		mov     [es:di], ax
		inc     di
		inc     di
		inc     bx
		dec 	cx
		jnz     input_password_loop
		jmp 	input_password_end

input_password_end:

	ret

; @input_test
; 文本模式输入并打印
; 参数:
; DI:打印的位置
; BX:输入的字符个数
@input_test:

	mov     ah, 0x00
	int     0x16
	mov     ah, 0x0e
	int     0x10
	mov     [es:di], ax
	inc     di
	inc     di
	dec     bx
	jnz     @input_test

	ret

; @configure_color
; 配置颜色号
; 参数：
; SI:存储RGB值的变量
; CX:配置数目
@configure_color:
	; 起始颜色号
	mov     al, 0		; 储存颜色号
	mov     dx, 0x3c8
	out     dx, al

	configure_color_rgb:
		; 储存RGB分量
		mov     al, [ds:si]
		mov     dx, 0x3c9   ; R
		out     dx, al
		inc 	si

		mov     al, [ds:si] ; G
		out     dx, al
		inc 	si

		mov     al, [ds:si] ; B
		out     dx, al
		inc 	si

	loop	configure_color_rgb

	ret

; @paint_screen
; 图形模式绘制屏幕(清屏)
; 参数:
; BX:显存偏移地址
; CX:loop循环次数（画点个数）
; DL:颜色
@paint_screen:


	mov     [es:bx], dl
	inc     bx
	loop    @paint_screen

	ret

; @drawLineOfH
; 画横线
; 参数:
; AX:横线的y值
; BX:横线的x0值
; CX:横线的x1值
; DL:线条颜色
@drawLineOfH:

	push 	ax
	push 	bx
	push 	cx

	mov 	[ds:color_temp], dl
	mov     si, 320
	mul     si 			; 与预先存储好值相乘 本实例中为AX = y 相乘后 AX = AX * DX = y * 320
	sub     cx, bx 		; 画点的次数 = CX - BX
	add     bx, ax		; 将AX = 320 * y的值加给BX使BX的地址偏移到某一行
	mov 	dl, [ds:color_temp]
	paint_line_h:
	    mov     [es:bx], dl
	    inc     bx
	    dec     cx
	    jnz     paint_line_h

	pop 	cx
	pop 	bx
	pop 	ax

    ret

; @DrawLineOfV
; 画竖线
; 参数：
; AX:竖线的x值
; BX:竖线的y0值
; CX:竖线的y1值
; DL:线条颜色
@drawLineOfV:

	push 	ax
	push 	bx
	push 	cx

	mov 	[ds:color_temp], dl
	mov 	si, ax 		; si寄存器暂存ax的值
	mov 	ax, bx
	mov     di, 320
	mul     di
	sub 	cx, bx 		; 画点的次数
	mov     bx, ax
	add 	bx, si
	mov 	dl, [ds:color_temp]
	paint_line_v:
		mov     [es:bx], dl
		add     bx, 320
		dec     cx
		jnz     paint_line_v

		pop 	cx
		pop 	bx
		pop 	ax

	ret


; @drawRectangle
; 画矩形
; 参数：
; AX:矩形的y值
; BX:矩形的x0值
; CX:矩形的x1值
; DI:矩形的y1值
; DL:线条颜色
@drawRectangle:

	sub 	di, ax
	mov 	byte[ds:color_temp], dl
	paint_rectangle_loop:
		inc 	ax
		call 	@drawLineOfH
		dec 	di
		jnz 	paint_rectangle_loop

	ret

; @drawChar
; 画中文字符
; 参数：
; AX:16 * 16中文字符矩阵左上角起始点的y值
; BX:16 * 16中文字符矩阵左上角起始点的x值
; SI:存储的中文字符矩阵
@drawChar:
	mov 	dx, 320
	mul 	dx
	add 	bx, ax

	drawChar_col_init:
		mov 	dx, 16 ; 一列16个点
	; 绘制一行
	drawChar_row_init:
		mov 	cx, 16 ; 一行16个点
	drawChar_row:
		; 矩阵背景
		mov 	al, [ds:charBackColor]
		mov 	[es:bx], al
		cmp 	byte[ds:si], 0
		jz 		drawChar_row_end
		; 矩阵前景
		mov 	al, [ds:charForeColor]
		mov 	[es:bx], al
	drawChar_row_end:
		inc 	si
		inc 	bx
		dec 	cx
		jnz 	drawChar_row 		; 一行的点没画完时
		inc 	ax
		add 	bx, 304
		dec 	dx
		jnz 	drawChar_row_init 	; 矩阵的点没画完时

	ret

; @ZHUOMIAN
; 绘制桌面
@ZHUOMIAN:

	push 	ax
	push 	bx
	push 	cx
	push 	di
	push 	si

	mov 	ax, 0
	mov 	bx, 0
	mov 	cx, 320
	mov 	di, 180
	mov 	dl, 1		
	call 	@drawRectangle	;(0,20-320,180)

	mov 	ax, 180
	mov 	bx, 0
	mov 	cx, 320
	mov 	di, 200
	mov 	dl, 6
	call 	@drawRectangle	;(0,180-320,200)

	mov		ax, 75
	mov 	bx, 180
	mov		cx, 200
	mov 	dl, 1
	call 	@drawLineOfV	;(75,180) len: 20

	mov		ax, 182
	mov 	bx, 14
	mov 	si, kai
	call 	@drawChar	;(14,182)

	mov 	ax, 182
	mov 	bx, 44
	mov 	si, shi3
	call 	@drawChar	;(44,182)

	mov 	ax, 40
	mov 	bx, 130
	mov 	cx, 158
	mov  	di, 68
	mov 	dl, 4
	call 	@drawRectangle	;(130,40-158,68)

	mov 	ax, 40
	mov 	bx, 160
	mov 	cx, 188
	mov  	di, 68
	mov 	dl, 4
	call 	@drawRectangle	;(160,40-188,68)

	mov 	ax, 70
	mov 	bx, 160
	mov 	cx, 188
	mov  	di, 98
	mov 	dl, 4
	call 	@drawRectangle	;(160,70-188,98)

	mov 	ax, 70
	mov 	bx, 130
	mov 	cx, 158
	mov  	di, 98
	mov 	dl, 4
	call 	@drawRectangle	;(130,70-158,98)

	pop 	si
	pop 	di
	pop 	cx
	pop 	bx
	pop 	ax

	ret
; @KAISHI
; 绘制开始菜单
@KAISHI:

	push	ax
	push 	bx
	push	cx
	push	di

	mov		ax, 75
	mov 	bx, 180
	mov		cx, 200
	mov 	dl, 1
	call 	@drawLineOfV

	mov		ax, 182
	mov 	bx, 14
	mov 	si, kai
	call 	@drawChar

	mov 	ax, 182
	mov 	bx, 44
	mov 	si, shi3
	call 	@drawChar

	mov 	ax, 120
	mov 	bx, 0
	mov 	cx, 75
	mov 	di, 180
	mov 	dl, 6
	call 	@drawRectangle	;(0,100-75,180)
KAISHI_0:
	mov 	ax, 140
	mov 	bx, 0
	mov 	cx, 75
	mov 	dl, 2			;red
	call 	@drawLineOfH	;(0-75,120)

	cmp		byte [ds:POS_CAIDAN], 0
	jnz 	KAISHI_1
KAISHI_0_C:
	mov 	ax, 140
	mov 	bx, 0
	mov 	cx, 75
	mov 	dl, 3			;green
	call 	@drawLineOfH	;(0-75,120)
KAISHI_1:
	mov 	ax, 160
	mov 	bx, 0
	mov 	cx, 75
	mov 	dl, 2
	call 	@drawLineOfH	;(0-75,140)

	cmp		byte [ds:POS_CAIDAN], 1
	jnz 	KAISHI_2
KAISHI_1_C:
	mov 	ax, 160
	mov 	bx, 0
	mov 	cx, 75
	mov 	dl, 3
	call 	@drawLineOfH
KAISHI_2:
	mov 	ax, 180
	mov 	bx, 0
	mov 	cx, 75
	mov 	dl, 2
	call 	@drawLineOfH	;(0-75,160)

	cmp		byte [ds:POS_CAIDAN], 2
	jnz 	KAISHI_O
KAISHI_2_C:
	mov 	ax, 180
	mov 	bx, 0
	mov 	cx, 75
	mov 	dl, 3
	call 	@drawLineOfH

; KAISHI_3:
	; mov 	ax, 180
	; mov 	bx, 0
	; mov 	cx, 75
	; mov 	dl, 2
	; call 	@drawLineOfH	;(0-75,180)

	; cmp		byte [ds:POS_CAIDAN], 3
	; jnz 	KAISHI_O
; KAISHI_3_C:
	; mov 	ax, 180
	; mov 	bx, 0
	; mov 	cx, 75
	; mov 	dl, 3
	; call 	@drawLineOfH
KAISHI_O:
	mov 	ax, 122
	mov 	bx, 6
	mov 	si, ji
	call 	@drawChar	;(6,122)

	mov 	ax, 122
	mov 	bx, 28
	mov 	si, shi4
	call 	@drawChar	;(28,122)

	mov 	ax, 122
	mov 	bx, 50
	mov 	si, ben
	call 	@drawChar	;(50,122)

	mov 	ax, 142
	mov 	bx, 6
	mov 	si, dian
	call 	@drawChar	;(6,142)

	mov 	ax, 142
	mov 	bx, 28
	mov 	si, zi
	call 	@drawChar	;(28,142)

	mov 	ax, 142
	mov 	bx, 50
	mov 	si, qin
	call 	@drawChar	;(50,142)

	mov 	ax, 162
	mov 	bx, 14
	mov 	si, zhu
	call 	@drawChar	;(14,162)


	mov 	ax, 162
	mov 	bx, 44
	mov 	si, xiao
	call 	@drawChar	;(44,162)

	pop 	di
	pop 	cx
	pop 	bx
	pop 	ax

	ret
; @timerEmpty
; 清空计时器中断
@timerEmpty:
	mov 	word [ds:0x20], int_empty
	mov 	word [ds:0x22], 0

	ret

; @timerClock
; 计时器
; 参数:
@timerClock:

	mov 	bx, 0
	mov 	byte [ds:time_clock], 0
	mov 	byte [ds:time_second_3], 0
	mov 	word [ds:0x20], int_clock
	mov 	word [ds:0x22], 0
	sti

	ret

int_empty:

	mov 	al, 0x20
	mov 	dx, 0x20
	out 	dx, al 	; EOI = 1,中断结束

	iret

int_clock:

	push 	bx
	push	ax
	push 	dx
	push 	di
	push 	cx

	cmp		byte [ds:time_second_3], 0x33
	ja 		int_clock_finish
	mov 	bx, [ds:time_clock]
	inc 	bx
	cmp 	bx, 18
	jnz		int_clock_end
	mov 	bx, 0
	inc 	byte [ds:time_second_3]
	cmp		byte [ds:time_second_3], 0x33
	ja 		int_clock_finish
	int_clock_end:
	mov		[ds:time_clock], bx
	mov 	ah, 0ch           ; 0AH:黑底红字
	mov		al, byte [ds:time_second_3]
	mov 	[es:2318], ax

	cmp 	word [ds:pos_jinDuTiao], 40
	jz 		int_clock_stop
	cmp 	word [ds:pos_jinDuTiao], 80
	jz 		int_clock_stop
	cmp 	word [ds:pos_jinDuTiao], 120
	jz 		int_clock_stop

	JINDU:
	mov 	ah, 0xf0
	mov		al, ' '
	mov 	di, [ds:pos_jinDuTiao]
	mov 	[es:2410 + di], ax
	inc 	word [ds:pos_jinDuTiao]
	inc 	word [ds:pos_jinDuTiao]

	int_clock_stop:
	cmp 	byte [ds:time_clock], 0
	jnz 	int_clock_finish
	mov 	ah, 0xf0
	mov		al, ' '
	mov 	di, [ds:pos_jinDuTiao]
	mov 	[es:2410 + di], ax
	inc 	word [ds:pos_jinDuTiao]
	inc 	word [ds:pos_jinDuTiao]
	jmp 	int_clock_finish

	int_clock_finish:
	mov		[ds:time_clock], bx
	mov 	al, 0x20
	mov 	dx, 0x20
	out 	dx, al 	; EOI = 1,中断结束

	pop 	cx
	pop 	di
	pop 	dx
	pop 	ax
	pop 	bx

	iret

int_key_desktop:
	push 	dx
	push 	ax
	push 	bx

	mov 	dx, 0x20 	; 中断芯片
	mov 	al, 0x61 	; 键盘编码放入AL
	out 	dx, al

	mov 	dx, 0x60	; 键盘管理器
	in 		al, dx		; 读键盘编码

	cmp 	al, 0x1d		; 左CTRL按下
	jz 		ApressCTRL
	cmp 	al, 0x9d		; 左CTRL弹起
	jz 		UpspringCTRL
	cmp 	al, 0x48			; 上键按下
	jz 		ApressUp
	cmp 	al, 0x50 			; 下键按下
	jz 		ApressDown
	cmp 	al, 0x1c 			; 回车按下
	jz 		ApressEnter_

	int_key_desktop_end:
	pop 	bx
	pop 	ax
	pop 	dx

	iret

ApressCTRL:
	cmp		byte [ds:KEY_CTRL], 0
	jnz 	ApressCTRL_to_0
	mov 	byte [ds:KEY_CTRL], 1
	call 	@KAISHI
	jmp		ApressCTRL_end
	ApressCTRL_to_0:
		mov 	byte [ds:KEY_CTRL], 0
		call 	@ZHUOMIAN
	ApressCTRL_end:
		jmp 	int_key_desktop_end
	UpspringCTRL:
		jmp 	int_key_desktop_end
	ApressUp:
		dec 	byte [ds:POS_CAIDAN]
		call 	@KAISHI
		jmp 	int_key_desktop_end
	ApressDown:
		inc 	byte [ds:POS_CAIDAN],
		call 	@KAISHI
		jmp 	int_key_desktop_end
	ApressEnter_:
		mov 	byte [ds:KEY_ENTER], 1
		jmp 	int_key_desktop_end

int_key:

	push 	dx
	push 	ax
	push 	bx

	mov 	dx, 0x20 	; 中断芯片
	mov 	al, 0x61 	; 键盘编码放入AL
	out 	dx, al

	mov 	dx, 0x60	; 键盘管理器
	in 		al, dx		; 读键盘编码

	cmp 	al, 2ah		; 左Shift按下
	jz		ApressShift
	cmp 	al, 36h		; 右Shift按下
	jz		ApressShift
	cmp 	al, 0xaa	; 左Shift弹起（aah不行）
	jz		UpspringShift
	cmp 	al, 0xb6	; 右Shift弹起（b6h不行）
	jz		UpspringShift
	cmp 	al, 0x0e	; BKSP按下
	jz		AppressBKSP
	cmp 	al, 0x1c 	; ENTER按下
	jz 		ApressEnter
	cmp 	al, 0x01	; ESC按下
	jz 		ApressESC
	cmp 	al, 0xe0	; 扩展码按下或弹起
	jz 		ApOrUpExtendE0
	cmp 	al, 0x38
	jz 		ApressAlt	; 左Alt或右Alt按下
	cmp 	al, 0xb8
	jz 		UpspringAlt	; 左Alt或右Alt弹起

	cmp 	al, 0x39 	; SPACE按下
	jz 		ApressKey_Space
	cmp 	al, 1eh 	; A按下
	jz 		ApressKey_A
	cmp 	al, 0x30 	; B按下
	jz 		ApressKey_B
	cmp 	al, 0x2e 	; C按下
	jz 		ApressKey_C
	cmp 	al, 0x20 	; D按下
	jz 		ApressKey_D
	cmp 	al, 0x12	; E按下
	jz 		ApressKey_E
	cmp 	al, 0x21 	; F按下
	jz 		ApressKey_F
	cmp 	al, 0x22 	; G按下
	jz 		ApressKey_G
	cmp 	al, 0x23 	; H按下
	jz 		ApressKey_H
	cmp 	al, 0x17 	; I按下
	jz 		ApressKey_I
	cmp 	al, 0x24 	; J按下
	jz 		ApressKey_J
	cmp 	al, 0x25 	; K按下
	jz 		ApressKey_K
	cmp 	al, 0x26 	; L按下
	jz 		ApressKey_L
	cmp 	al, 0x32 	; M按下
	jz 		ApressKey_M
	cmp 	al, 0x31 	; N按下
	jz 		ApressKey_N
	cmp 	al, 0x18 	; O按下
	jz 		ApressKey_O
	cmp 	al, 0x19 	; P按下
	jz 		ApressKey_P
	cmp 	al, 0x10 	; Q按下
	jz 		ApressKey_Q
	cmp 	al, 0x13 	; R按下
	jz 		ApressKey_R
	cmp 	al, 0x1f 	; S按下
	jz 		ApressKey_S
	cmp 	al, 0x14 	; T按下
	jz 		ApressKey_T
	cmp 	al, 0x16 	; U按下
	jz 		ApressKey_U
	cmp 	al, 0x2f 	; V按下
	jz 		ApressKey_V
	cmp 	al, 0x11 	; W按下
	jz 		ApressKey_W
	cmp 	al, 0x2d 	; X按下
	jz 		ApressKey_X
	cmp 	al, 0x15 	; Y按下
	jz 		ApressKey_Y
	cmp 	al, 0x2c 	; Z按下
	jz 		ApressKey_Z
	cmp		al, 0x0b	; 0按下
	jz 		ApressKey_0
	cmp 	al, 0x02 	; 1按下
	jz 		ApressKey_1
	cmp 	al, 0x03 	; 2按下
	jz 		ApressKey_2
	cmp 	al, 0x04 	; 3按下
	jz 		ApressKey_3
	cmp 	al, 0x05 	; 4按下
	jz 		ApressKey_4
	cmp 	al, 0x06 	; 5按下
	jz 		ApressKey_5
	cmp 	al, 0x07 	; 6按下
	jz 		ApressKey_6
	cmp 	al, 0x08 	; 7按下
	jz 		ApressKey_7
	cmp 	al, 0x09 	; 8按下
	jz 		ApressKey_8
	cmp 	al, 0x0A 	; 9按下
	jz 		ApressKey_9
	cmp 	al, 0x29 	; `按下
	jz 		ApressKey_c~
	cmp 	al, 0x0c 	; -按下
	jz 		ApressKey_c_jian
	cmp 	al, 0x0d 	; =按下
	jz 		ApressKey_c_dengyu
	cmp 	al, 0x1a 	; [按下
	jz 		ApressKey_c_fangkuohao
	cmp 	al, 0x1b 	; ]按下
	jz 		ApressKey_c_fanfangkuohao
	cmp 	al, 0x2b 	; \按下
	jz 		ApressKey_c_fanxiegang
	cmp 	al, 0x27 	; ;按下
	jz 		ApressKey_c_fenghao
	cmp 	al, 0x28 	; '按下
	jz 		ApressKey_c_danyinhao
	cmp 	al, 0x33 	; ,按下
	jz 		ApressKey_c_douhao
	cmp 	al, 0x34 	; .按下
	jz 		ApressKey_c_dian
	cmp 	al, 0x35 	; /按下
	jz 		ApressKey_c_zhengxiegang

	int_key_end:
		pop 	bx
		pop 	ax
		pop 	dx

	iret

ApressESC:
	mov 	byte [ds:KEY_ESC], 1
	jmp 	int_key_end
ApressShift:
	mov 	byte [ds:KEY_SHIFT], 1
	jmp 	int_key_end
UpspringShift:
	mov 	byte [ds:KEY_SHIFT], 0
	jmp 	int_key_end
AppressBKSP:
	mov 	al, 0x20
	mov 	bx, [ds:POS_KEY]
	cmp 	bx, 0
	jz 		int_key_end
	dec 	bx
	dec 	bx
	mov 	[ds:POS_KEY], bx
	mov 	byte [es:bx], al
	mov 	byte [es:bx + 1], 0xf0
	mov 	byte [es:bx + 2], al
	mov 	byte [es:bx + 3], 0x00
	jmp 	int_key_end
ApressEnter:
	mov 	al, 0x20
	mov 	bx, [ds:POS_KEY]
	mov 	byte [es:bx], al
	mov 	byte [es:bx + 1], 0x00
	add 	bx, 160
	mov 	[ds:POS_KEY], bx
	mov 	byte [es:bx], al
	mov 	byte [es:bx + 1], 0xf0
	jmp 	int_key_end
ApOrUpExtendE0:
	cmp 	byte [ds:KEY_EXTEND_E0], 1
	jz 		UpspringExtendE0
ApressExtendE0:
	mov 	byte [ds:KEY_EXTEND_E0], 1
	jmp		int_key_end
UpspringExtendE0:
	mov 	byte [ds:KEY_EXTEND_E0], 0
	jmp		int_key_end
ApressAlt:
	mov 	byte [ds:KEY_ALT], 1
	jmp 	int_key_end
UpspringAlt:
	mov 	byte [ds:KEY_ALT], 0
	jmp 	int_key_end

ApressKey_Space:
	mov 	al, 0x20
	mov 	bx, [ds:POS_KEY]
	jmp 	PrintKey
ApressKey_A:
	mov 	al, 0x61
	jmp 	ApressKey
ApressKey_B:
	mov 	al, 0x62
	jmp 	ApressKey
ApressKey_C:
	mov 	al, 0x63
	jmp 	ApressKey
ApressKey_D:
	mov 	al, 0x64
	jmp 	ApressKey
ApressKey_E:
	mov 	al, 0x65
	jmp 	ApressKey
ApressKey_F:
	mov 	al, 0x66
	jmp 	ApressKey
ApressKey_G:
	mov 	al, 0x67
	jmp 	ApressKey
ApressKey_H:
	mov 	al, 0x68
	jmp 	ApressKey
ApressKey_I:
	mov 	al, 0x69
	jmp 	ApressKey
ApressKey_J:
	mov 	al, 0x6A
	jmp 	ApressKey
ApressKey_K:
	mov 	al, 0x6B
	jmp 	ApressKey
ApressKey_L:
	mov 	al, 0x6C
	jmp 	ApressKey
ApressKey_M:
	mov 	al, 0x6D
	jmp 	ApressKey
ApressKey_N:
	mov 	al, 0x6E
	jmp 	ApressKey
ApressKey_O:
	mov 	al, 0x6F
	jmp 	ApressKey
ApressKey_P:
	mov 	al, 0x70
	jmp 	ApressKey
ApressKey_Q:
	mov 	al, 0x71
	jmp 	ApressKey
ApressKey_R:
	mov 	al, 0x72
	jmp 	ApressKey
ApressKey_S:
	mov 	al, 0x73
	jmp 	ApressKey
ApressKey_T:
	mov 	al, 0x74
	jmp 	ApressKey
ApressKey_U:
	mov 	al, 0x75
	jmp 	ApressKey
ApressKey_V:
	mov 	al, 0x76
	jmp 	ApressKey
ApressKey_W:
	mov 	al, 0x77
	jmp 	ApressKey
ApressKey_X:
	mov 	al, 0x78
	jmp 	ApressKey
ApressKey_Y:
	mov 	al, 0x79
	jmp 	ApressKey
ApressKey_Z:
	mov 	al, 0x7A
	jmp 	ApressKey
ApressKey_0:
	mov 	al, 0x30
	jmp 	ApressKey
ApressKey_1:
	cmp 	byte [ds:KEY_SHIFT], 1
	jnz 	ApressKey_1_1
	mov 	al, 0x21
	jmp 	ApressKey
	ApressKey_1_1:
	mov 	al, 0x31
	jmp 	ApressKey
ApressKey_2:
	cmp 	byte [ds:KEY_SHIFT], 1
	jnz 	ApressKey_2_2
	mov 	al, 0x40
	jmp 	ApressKey
	ApressKey_2_2:
	mov 	al, 0x32
	jmp 	ApressKey
ApressKey_3:
	mov 	al, 0x33
	jmp 	ApressKey
ApressKey_4:
	mov 	al, 0x34
	jmp 	ApressKey
ApressKey_5:
	mov 	al, 0x35
	jmp 	ApressKey
ApressKey_6:
	mov 	al, 0x36
	jmp 	ApressKey
ApressKey_7:
	mov 	al, 0x37
	jmp 	ApressKey
ApressKey_8:
	mov 	al, 0x38
	jmp 	ApressKey
ApressKey_9:
	mov 	al, 0x39
	jmp 	ApressKey
ApressKey_c~:
	mov 	al, 0x60
	jmp 	ApressKey
ApressKey_c_jian:
	mov 	al, 0x2d
	jmp 	ApressKey
ApressKey_c_dengyu:
	mov 	al, 0x3d
	jmp 	ApressKey
ApressKey_c_fangkuohao:
	mov 	al, 0x5b
	jmp 	ApressKey
ApressKey_c_fanfangkuohao:
	mov 	al, 0x5d
	jmp 	ApressKey
ApressKey_c_fanxiegang:
	mov 	al, 0x5c
	jmp 	ApressKey
ApressKey_c_fenghao:
	mov 	al, 0x3b
	jmp 	ApressKey
ApressKey_c_danyinhao:
	mov 	al, 0x27
	jmp 	ApressKey
ApressKey_c_douhao:
	mov 	al, 0x2c
	jmp 	ApressKey
ApressKey_c_dian:
	mov 	al, 0x2e
	jmp 	ApressKey
ApressKey_c_zhengxiegang:
	mov 	al, 0x2f
	jmp 	ApressKey

ApressKey:
	mov 	bx, [ds:POS_KEY]
	cmp 	al, 97
	jb 		PrintKey
	cmp 	al, 122
	ja 		PrintKey
	cmp 	byte [ds:KEY_SHIFT], 1
	jnz 	PrintKey
	sub 	al, 32

	PrintKey:
		mov 	byte [es:bx], al
		mov 	byte [es:bx + 1], 0x0a
		mov 	byte [es:bx + 2], 0x20
		mov 	byte [es:bx + 3], 0xf0

	inc 	bx
	inc 	bx
	mov 	[ds:POS_KEY], bx

	jmp 	int_key_end
