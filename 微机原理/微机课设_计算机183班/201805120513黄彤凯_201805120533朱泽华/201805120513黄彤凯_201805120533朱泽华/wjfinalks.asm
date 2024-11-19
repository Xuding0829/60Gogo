; bx bp si di 放偏移地址 段基址：cs ds es ss
org 0x8400
jmp start
;======================设置声音======================

cisound dw 262;1
    dw 294;2
    dw 330;3
    dw 349;4
    dw 392;5
    dw 440;6
    dw 494;7
    ;上面为C大调的do re me fa sol la xi
;c大调 1231 1231 345 345 565431 565431 121 121
liangzhilaohu dw 262,294,330,262,262,294,330,262
              dw 330,349,392,330,349,392
              dw 392,440,392,349,330,262,392,440,392,349,330,262
              dw 262,294,262,262,294,262
;c大调 556517 556521 5553176 443121
shengrikuaile dw 392,392,440,392,262,494
              dw 392,392,440,392,294,262
              dw 392,392,392,330,262,494,440
              dw 349,349,330,262,294,262
;C大调 1155665 4433221 5544332 5544332 1155665 4433221
xiaoxingxing  dw 262,262,392,392,440,440,392
              dw 349,349,330,330,294,294,262
              dw 392,392,349,349,330,330,294
              dw 392,392,349,349,330,330,294
              dw 262,262,392,392,440,440,392
              dw 349,349,330,330,294,294,262
huanyin dw 440,494,262,494,262,330

pl_1 dw 0;设置频率的两个变量
pl_2 dw 0
;======================设置声音======================
;=========================设置画笔===================
;画笔颜色调整，调用col函数，调用前付给 si
 ts db 0,255,255,255;背景色白
    db 1,220,140,160;方框调色紫色
    db 2,255,0,0;红色
    db 3,255,125,0;橙色
    db 4,255,255,0;黄色
    db 5,0,255,0;绿色
    db 6,0,255,255;青色
    db 7,0,0,255;蓝色
    db 8,0,0,0;黑色

;=========================设置画笔===================
purplepen db 1
redpen db 2
bluepen db 3
finpen db 0
rdpen db 2
      db 3
      db 4
      db 5
      db 6
      db 7
      db 1
;========================设置画笔====================
;================用于数据接入和传出===================
x_place dw 0
y_place dw 0
xy_place dw 0
xystart_place dw 0;线条封装
xyend dw 0;线条封装
r1_place dw 0;方框封装左上
r2_place dw 0;方框封装右上
r3_place dw 0;方框封装左下
r4_place dw 0;方框封装右下
;===============用于数据接入和传出====================
;===================数据开始=========================
;************************框和横线数据
x1_place dw 0
y1_place dw 0
xy1_place dw 0;待写入的坐标
x2_place dw 319
y2_place dw 0
xy2_place dw 0
x3_place dw 0
y3_place dw 199
xy3_place dw 0
x4_place dw 319
y4_place dw 199
xy4_place dw 0
x5_place dw 0
y5_place dw 9
xy5_place dw 0
x6_place dw 319
y6_place dw 9
xy6_place dw 0
x7_place dw 0
y7_place dw 80
xy7_place dw 0
x8_place dw 319
y8_place dw 80
xy8_place dw 0
x9_place dw 0
y9_place dw 117
xy9_place dw 0
x10_place dw 319
y10_place dw 117
xy10_place dw 0
;***********************music数据
;***********************m
x11_place dw 50
y11_place dw 30
xy11_place dw 0
x12_place dw 70
y12_place dw 30
xy12_place dw 0
x13_place dw 90
y13_place dw 30
xy13_place dw 0
x14_place dw 50
y14_place dw 60
xy14_place dw 0
x15_place dw 70
y15_place dw 60
xy15_place dw 0
x16_place dw 90
y16_place dw 60
xy16_place dw 0
;***********************u
x17_place dw 102
y17_place dw 30
xy17_place dw 0
x18_place dw 132
y18_place dw 30
xy18_place dw 0
x19_place dw 102
y19_place dw 60
xy19_place dw 0
x20_place dw 132
y20_place dw 60
xy20_place dw 0
;***********************s
x21_place dw 152
y21_place dw 30
xy21_place dw 0
x22_place dw 172
y22_place dw 30
xy22_place dw 0
x23_place dw 152
y23_place dw 45
xy23_place dw 0
x24_place dw 172
y24_place dw 45
xy24_place dw 0
x25_place dw 152
y25_place dw 60
xy25_place dw 0
x26_place dw 172
y26_place dw 60
xy26_place dw 0
;***********************i
x27_place dw 199
y27_place dw 30
xy27_place dw 0
x28_place dw 202
y28_place dw 30
xy28_place dw 0
x29_place dw 205
y29_place dw 30
xy29_place dw 0
x30_place dw 196
y30_place dw 60
xy30_place dw 0
x31_place dw 202
y31_place dw 60
xy31_place dw 0
x32_place dw 208
y32_place dw 60
xy32_place dw 0
;***********************c
x33_place dw 231
y33_place dw 30
xy33_place dw 0
x34_place dw 257
y34_place dw 30
xy34_place dw 0
x35_place dw 231
y35_place dw 60
xy35_place dw 0
x36_place dw 257
y36_place dw 60
xy36_place dw 0
;===================暂停键=========================
x37_place dw 155
y37_place dw 150
xy37_place dw 0
x38_place dw 155
y38_place dw 166
xy38_place dw 0
x39_place dw 165
y39_place dw 150
xy39_place dw 0
x40_place dw 165
y40_place dw 166
xy40_place dw 0
;===================暂停键=========================
;===================数据结束=========================
;=====================设置写字的点位=======================
nameplace dw 0
namelength dw 0
name0 dw 137, 90, 154, 90, 185, 90, 137, 91, 154, 91, 163, 91, 169, 91, 170, 91, 175, 91
dw 185, 91, 137, 92, 146, 92, 147, 92, 148, 92, 149, 92, 150, 92, 151, 92, 154, 92, 164
dw 92, 167, 92, 168, 92, 171, 92, 172, 92, 173, 92, 174, 92, 175, 92, 176, 92, 185, 92
dw 137, 93, 151, 93, 154, 93, 155, 93, 156, 93, 157, 93, 158, 93, 159, 93, 165, 93, 167
dw 93, 171, 93, 175, 93, 185, 93, 137, 94, 147, 94, 151, 94, 153, 94, 159, 94, 167, 94
dw 171, 94, 175, 94, 185, 94, 137, 95, 147, 95, 151, 95, 152, 95, 155, 95, 158, 95, 167
dw 95, 171, 95, 175, 95, 185, 95, 137, 96, 148, 96, 150, 96, 155, 96, 162, 96, 163, 96
dw 164, 96, 165, 96, 167, 96, 171, 96, 175, 96, 185, 96, 137, 97, 148, 97, 150, 97, 155
dw 97, 165, 97, 167, 97, 170, 97, 171, 97, 175, 97, 185, 97, 137, 98, 149, 98, 155, 98
dw 165, 98, 167, 98, 169, 98, 171, 98, 175, 98, 185, 98, 137, 99, 148, 99, 150, 99, 155
dw 99, 165, 99, 167, 99, 168, 99, 171, 99, 173, 99, 175, 99, 185, 99, 137, 100, 148, 100
dw 151, 100, 154, 100, 156, 100, 165, 100, 167, 100, 171, 100, 174, 100, 185, 100, 137
dw 101, 147, 101, 151, 101, 154, 101, 156, 101, 165, 101, 171, 101, 185, 101, 137, 102
dw 146, 102, 153, 102, 157, 102, 165, 102, 171, 102, 185, 102, 137, 103, 153, 103, 158
dw 103, 164, 103, 166, 103, 171, 103, 175, 103, 176, 103, 185, 103, 137, 104, 152, 104
dw 158, 104, 159, 104, 160, 104, 163, 104, 167, 104, 168, 104, 169, 104, 170, 104, 171
dw 104, 172, 104, 173, 104, 174, 104, 175, 104, 185, 104, 137, 105, 150, 105, 151, 105
dw 159, 105, 185, 105
name0l dw 155

name1 dw 117, 90, 139, 90, 164, 90, 181, 90, 184, 90, 197, 90, 117, 91, 126, 91, 127, 91
dw 128, 91, 129, 91, 130, 91, 131, 91, 132, 91, 133, 91, 134, 91, 135, 91, 136, 91, 137
dw 91, 138, 91, 139, 91, 140, 91, 153, 91, 164, 91, 181, 91, 182, 91, 183, 91, 184, 91
dw 185, 91, 197, 91, 117, 92, 131, 92, 135, 92, 145, 92, 146, 92, 147, 92, 148, 92, 149
dw 92, 150, 92, 151, 92, 152, 92, 153, 92, 154, 92, 164, 92, 166, 92, 170, 92, 181, 92
dw 197, 92, 117, 93, 131, 93, 135, 93, 139, 93, 145, 93, 153, 93, 160, 93, 161, 93, 162
dw 93, 163, 93, 164, 93, 165, 93, 166, 93, 167, 93, 169, 93, 170, 93, 176, 93, 177, 93
dw 178, 93, 179, 93, 180, 93, 181, 93, 182, 93, 183, 93, 184, 93, 185, 93, 186, 93, 187
dw 93, 197, 93, 117, 94, 127, 94, 128, 94, 129, 94, 130, 94, 131, 94, 132, 94, 133, 94
dw 134, 94, 135, 94, 136, 94, 137, 94, 138, 94, 139, 94, 140, 94, 145, 94, 153, 94, 164
dw 94, 168, 94, 176, 94, 180, 94, 187, 94, 197, 94, 117, 95, 127, 95, 131, 95, 135, 95
dw 139, 95, 145, 95, 153, 95, 164, 95, 167, 95, 171, 95, 176, 95, 180, 95, 183, 95, 184
dw 95, 186, 95, 197, 95, 117, 96, 127, 96, 131, 96, 135, 96, 139, 96, 145, 96, 153, 96
dw 158, 96, 159, 96, 160, 96, 161, 96, 162, 96, 163, 96, 164, 96, 165, 96, 166, 96, 167
dw 96, 168, 96, 169, 96, 170, 96, 171, 96, 172, 96, 176, 96, 177, 96, 178, 96, 179, 96
dw 180, 96, 181, 96, 182, 96, 197, 96, 117, 97, 127, 97, 131, 97, 135, 97, 139, 97, 145
dw 97, 153, 97, 165, 97, 176, 97, 180, 97, 186, 97, 197, 97, 117, 98, 127, 98, 131, 98
dw 135, 98, 139, 98, 145, 98, 146, 98, 147, 98, 148, 98, 149, 98, 150, 98, 151, 98, 152
dw 98, 153, 98, 164, 98, 176, 98, 181, 98, 182, 98, 183, 98, 184, 98, 185, 98, 186, 98
dw 197, 98, 117, 99, 127, 99, 131, 99, 135, 99, 139, 99, 145, 99, 153, 99, 163, 99, 169
dw 99, 176, 99, 183, 99, 197, 99, 117, 100, 127, 100, 130, 100, 132, 100, 134, 100, 136
dw 100, 139, 100, 162, 100, 163, 100, 168, 100, 169, 100, 176, 100, 179, 100, 180, 100
dw 181, 100, 182, 100, 183, 100, 184, 100, 197, 100, 117, 101, 127, 101, 129, 101, 133
dw 101, 137, 101, 138, 101, 139, 101, 147, 101, 151, 101, 161, 101, 163, 101, 166, 101
dw 167, 101, 176, 101, 179, 101, 183, 101, 197, 101, 117, 102, 127, 102, 128, 102, 132
dw 102, 138, 102, 139, 102, 146, 102, 147, 102, 152, 102, 160, 102, 163, 102, 164, 102
dw 165, 102, 176, 102, 179, 102, 183, 102, 197, 102, 117, 103, 127, 103, 139, 103, 145
dw 103, 153, 103, 154, 103, 159, 103, 163, 103, 171, 103, 176, 103, 179, 103, 183, 103
dw 187, 103, 197, 103, 117, 104, 127, 104, 137, 104, 139, 104, 144, 104, 154, 104, 155
dw 104, 158, 104, 163, 104, 171, 104, 175, 104, 178, 104, 183, 104, 187, 104, 197, 104
dw 117, 105, 127, 105, 138, 105, 143, 105, 155, 105, 164, 105, 165, 105, 166, 105, 167
dw 105, 168, 105, 169, 105, 170, 105, 171, 105, 174, 105, 177, 105, 184, 105, 185, 105
dw 186, 105, 187, 105, 197, 105
name1l dw 293
name2 dw 117, 90, 133, 90, 153, 90, 161, 90, 166, 90, 184, 90, 197, 90, 117, 91, 129, 91
dw 133, 91, 145, 91, 146, 91, 147, 91, 148, 91, 149, 91, 150, 91, 151, 91, 152, 91, 153
dw 91, 154, 91, 161, 91, 166, 91, 182, 91, 183, 91, 184, 91, 185, 91, 197, 91, 117, 92
dw 129, 92, 133, 92, 145, 92, 153, 92, 161, 92, 166, 92, 177, 92, 178, 92, 179, 92, 180
dw 92, 181, 92, 197, 92, 117, 93, 129, 93, 133, 93, 138, 93, 145, 93, 153, 93, 161, 93
dw 166, 93, 170, 93, 177, 93, 197, 93, 117, 94, 128, 94, 129, 94, 130, 94, 131, 94, 132
dw 94, 133, 94, 134, 94, 135, 94, 136, 94, 137, 94, 138, 94, 139, 94, 145, 94, 153, 94
dw 159, 94, 161, 94, 162, 94, 164, 94, 165, 94, 166, 94, 167, 94, 168, 94, 169, 94, 170
dw 94, 171, 94, 177, 94, 181, 94, 197, 94, 117, 95, 128, 95, 133, 95, 145, 95, 153, 95
dw 159, 95, 161, 95, 163, 95, 166, 95, 170, 95, 177, 95, 181, 95, 197, 95, 117, 96, 127
dw 96, 133, 96, 145, 96, 153, 96, 159, 96, 161, 96, 166, 96, 170, 96, 176, 96, 181, 96
dw 187, 96, 197, 96, 117, 97, 127, 97, 133, 97, 145, 97, 146, 97, 147, 97, 148, 97, 149
dw 97, 150, 97, 151, 97, 152, 97, 153, 97, 158, 97, 161, 97, 166, 97, 170, 97, 175, 97
dw 176, 97, 177, 97, 178, 97, 179, 97, 180, 97, 181, 97, 182, 97, 183, 97, 184, 97, 185
dw 97, 186, 97, 187, 97, 188, 97, 197, 97, 117, 98, 126, 98, 133, 98, 137, 98, 145, 98
dw 153, 98, 161, 98, 166, 98, 170, 98, 181, 98, 197, 98, 117, 99, 128, 99, 129, 99, 130
dw 99, 131, 99, 132, 99, 133, 99, 134, 99, 135, 99, 136, 99, 137, 99, 138, 99, 145, 99
dw 153, 99, 161, 99, 162, 99, 163, 99, 164, 99, 165, 99, 166, 99, 167, 99, 168, 99, 169
dw 99, 170, 99, 171, 99, 172, 99, 181, 99, 197, 99, 117, 100, 133, 100, 145, 100, 153
dw 100, 161, 100, 166, 100, 178, 100, 181, 100, 184, 100, 197, 100, 117, 101, 133, 101
dw 145, 101, 153, 101, 161, 101, 165, 101, 167, 101, 178, 101, 181, 101, 185, 101, 197
dw 101, 117, 102, 133, 102, 145, 102, 153, 102, 161, 102, 165, 102, 168, 102, 177, 102
dw 181, 102, 186, 102, 197, 102, 117, 103, 133, 103, 139, 103, 145, 103, 146, 103, 147
dw 103, 148, 103, 149, 103, 150, 103, 151, 103, 152, 103, 153, 103, 161, 103, 164, 103
dw 169, 103, 176, 103, 181, 103, 186, 103, 187, 103, 197, 103, 117, 104, 126, 104, 127
dw 104, 128, 104, 129, 104, 130, 104, 131, 104, 132, 104, 133, 104, 134, 104, 135, 104
dw 136, 104, 137, 104, 138, 104, 139, 104, 140, 104, 145, 104, 153, 104, 161, 104, 163
dw 104, 170, 104, 171, 104, 172, 104, 175, 104, 179, 104, 181, 104, 187, 104, 197, 104
dw 117, 105, 161, 105, 162, 105, 171, 105, 180, 105, 197, 105
name2l dw 260
;262
name3 dw 127, 90, 143, 90, 164, 90, 180, 90, 191, 90, 127, 91, 143, 91, 154, 91, 155, 91
dw 156, 91, 157, 91, 158, 91, 159, 91, 160, 91, 161, 91, 162, 91, 163, 91, 164, 91, 165
dw 91, 170, 91, 171, 91, 172, 91, 173, 91, 174, 91, 175, 91, 176, 91, 177, 91, 178, 91
dw 179, 91, 180, 91, 181, 91, 191, 91, 127, 92, 143, 92, 154, 92, 164, 92, 170, 92, 180
dw 92, 191, 92, 127, 93, 143, 93, 154, 93, 155, 93, 156, 93, 157, 93, 158, 93, 159, 93
dw 160, 93, 161, 93, 162, 93, 163, 93, 164, 93, 170, 93, 171, 93, 172, 93, 173, 93, 174
dw 93, 175, 93, 176, 93, 177, 93, 178, 93, 179, 93, 180, 93, 191, 93, 127, 94, 143, 94
dw 154, 94, 164, 94, 170, 94, 180, 94, 191, 94, 127, 95, 141, 95, 143, 95, 145, 95, 154
dw 95, 155, 95, 156, 95, 157, 95, 158, 95, 159, 95, 160, 95, 161, 95, 162, 95, 163, 95
dw 164, 95, 170, 95, 171, 95, 172, 95, 173, 95, 174, 95, 175, 95, 176, 95, 177, 95, 178
dw 95, 179, 95, 180, 95, 191, 95, 127, 96, 141, 96, 143, 96, 146, 96, 159, 96, 175, 96
dw 191, 96, 127, 97, 140, 97, 143, 97, 147, 97, 154, 97, 159, 97, 164, 97, 170, 97, 175
dw 97, 180, 97, 191, 97, 127, 98, 140, 98, 143, 98, 148, 98, 154, 98, 155, 98, 156, 98
dw 157, 98, 158, 98, 159, 98, 160, 98, 161, 98, 162, 98, 163, 98, 164, 98, 165, 98, 170
dw 98, 171, 98, 172, 98, 173, 98, 174, 98, 175, 98, 176, 98, 177, 98, 178, 98, 179, 98
dw 180, 98, 181, 98, 191, 98, 127, 99, 139, 99, 143, 99, 149, 99, 154, 99, 159, 99, 170
dw 99, 175, 99, 191, 99, 127, 100, 138, 100, 143, 100, 149, 100, 153, 100, 159, 100, 163
dw 100, 169, 100, 175, 100, 179, 100, 191, 100, 127, 101, 137, 101, 143, 101, 152, 101
dw 154, 101, 155, 101, 156, 101, 157, 101, 158, 101, 159, 101, 160, 101, 161, 101, 162
dw 101, 163, 101, 164, 101, 168, 101, 170, 101, 171, 101, 172, 101, 173, 101, 174, 101
dw 175, 101, 176, 101, 177, 101, 178, 101, 179, 101, 180, 101, 191, 101, 127, 102, 143
dw 102, 159, 102, 175, 102, 191, 102, 127, 103, 143, 103, 159, 103, 165, 103, 175, 103
dw 181, 103, 191, 103, 127, 104, 141, 104, 143, 104, 152, 104, 153, 104, 154, 104, 155
dw 104, 156, 104, 157, 104, 158, 104, 159, 104, 160, 104, 161, 104, 162, 104, 163, 104
dw 164, 104, 165, 104, 166, 104, 168, 104, 169, 104, 170, 104, 171, 104, 172, 104, 173
dw 104, 174, 104, 175, 104, 176, 104, 177, 104, 178, 104, 179, 104, 180, 104, 181, 104
dw 182, 104, 191, 104, 127, 105, 142, 105, 191, 105
;242
name3l dw 240

name4 dw 76, 153, 79, 153, 76, 154, 79, 154, 75, 155, 78, 155, 75, 156, 78, 156, 74, 157
      dw 77, 157, 74, 158, 77, 158, 75, 159, 78, 159, 75, 160, 78, 160, 76, 161, 79, 161
      dw 76, 162, 79, 162
;20
name4l dw 20

name5 dw 161, 150, 177, 150, 161, 151, 177, 151, 161, 152, 177, 152, 161, 153, 177, 153
      dw 161, 154, 177, 154, 161, 155, 177, 155, 161, 156, 177, 156, 161, 157, 177, 157
      dw 161, 158, 177, 158, 161, 159, 177, 159, 161, 160, 177, 160, 161, 161, 177, 161
      dw 161, 162, 177, 162, 161, 163, 177, 163, 161, 164, 177, 164, 161, 165, 177, 165
name5l dw 30

name6 dw 244, 153, 247, 153, 244, 154, 247, 154, 245, 155, 248, 155, 245, 156, 248, 156
      dw 246, 157, 249, 157, 246, 158, 249, 158, 245, 159, 248, 159, 245, 160, 248, 160
      dw 244, 161, 247, 161, 244, 162, 247, 162
name6l dw 20
;=====================设置写字的点位=======================
start: 
;===============主函数图形模式开始=======================
;进入13h号320*200 256色的图形模式
    mov ah,00h
    mov al,13h
    int 10h
    mov ax,0xa000 ;往显存中放入点数据
    mov es,ax
;=================主函数开始=========================
    mov si,ts
    ;设置白色背景。
    call col
    ;其他调色
    call col
    call col
    call col
    call col
    call col
    call col
    call col
    call col

;=================写字==============================
    push bx
    mov bx,2
    mov [finpen],bx
    pop bx
    mov si,name0
    push bx
    mov bx,[name0l]
    mov [namelength],bx
    pop bx
    call outpoint
;=================写字==============================


;=================算xy点位==============================
    ;第一个点计算
    mov bx,[x1_place]
    mov [x_place],bx
    mov bx,[y1_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy1_place],bx
    ;第二个点计算
    mov bx,[x2_place]
    mov [x_place],bx
    mov bx,[y2_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy2_place],bx
    ;第三个点计算
    mov bx,[x3_place]
    mov [x_place],bx
    mov bx,[y3_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy3_place],bx
    ;第四个点计算
    mov bx,[x4_place]
    mov [x_place],bx
    mov bx,[y4_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy4_place],bx
    ;第五个点计算
    mov bx,[x5_place]
    mov [x_place],bx
    mov bx,[y5_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy5_place],bx
    ;第六个点计算
    mov bx,[x6_place]
    mov [x_place],bx
    mov bx,[y6_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy6_place],bx
    ;第七个点计算
    mov bx,[x7_place]
    mov [x_place],bx
    mov bx,[y7_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy7_place],bx
    ;第八个点计算
    mov bx,[x8_place]
    mov [x_place],bx
    mov bx,[y8_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy8_place],bx
    ;第九个点计算
    mov bx,[x9_place]
    mov [x_place],bx
    mov bx,[y9_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy9_place],bx
    ;第十个点计算
    mov bx,[x10_place]
    mov [x_place],bx
    mov bx,[y10_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy10_place],bx
    ;第十一个点计算
    mov bx,[x11_place]
    mov [x_place],bx
    mov bx,[y11_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy11_place],bx
    ;第十二个点计算
    mov bx,[x12_place]
    mov [x_place],bx
    mov bx,[y12_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy12_place],bx
    ;第十三个点计算
    mov bx,[x13_place]
    mov [x_place],bx
    mov bx,[y13_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy13_place],bx
    ;第十四个点计算
    mov bx,[x14_place]
    mov [x_place],bx
    mov bx,[y14_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy14_place],bx
    ;第十五个点计算
    mov bx,[x15_place]
    mov [x_place],bx
    mov bx,[y15_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy15_place],bx
    ;第十六个点计算
    mov bx,[x16_place]
    mov [x_place],bx
    mov bx,[y16_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy16_place],bx
        ;第十7个点计算
    mov bx,[x17_place]
    mov [x_place],bx
    mov bx,[y17_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy17_place],bx
        ;第十8个点计算
    mov bx,[x18_place]
    mov [x_place],bx
    mov bx,[y18_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy18_place],bx
        ;第十9个点计算
    mov bx,[x19_place]
    mov [x_place],bx
    mov bx,[y19_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy19_place],bx
        ;第20个点计算
    mov bx,[x20_place]
    mov [x_place],bx
    mov bx,[y20_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy20_place],bx
            ;第21个点计算
    mov bx,[x21_place]
    mov [x_place],bx
    mov bx,[y21_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy21_place],bx
            ;第22个点计算
    mov bx,[x22_place]
    mov [x_place],bx
    mov bx,[y22_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy22_place],bx
            ;第23个点计算
    mov bx,[x23_place]
    mov [x_place],bx
    mov bx,[y23_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy23_place],bx
            ;第24个点计算
    mov bx,[x24_place]
    mov [x_place],bx
    mov bx,[y24_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy24_place],bx
            ;第25个点计算
    mov bx,[x25_place]
    mov [x_place],bx
    mov bx,[y25_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy25_place],bx
            ;第26个点计算
    mov bx,[x26_place]
    mov [x_place],bx
    mov bx,[y26_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy26_place],bx
                ;第27个点计算
    mov bx,[x27_place]
    mov [x_place],bx
    mov bx,[y27_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy27_place],bx
                ;第28个点计算
    mov bx,[x28_place]
    mov [x_place],bx
    mov bx,[y28_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy28_place],bx
                ;第29个点计算
    mov bx,[x29_place]
    mov [x_place],bx
    mov bx,[y29_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy29_place],bx
                ;第30个点计算
    mov bx,[x30_place]
    mov [x_place],bx
    mov bx,[y30_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy30_place],bx
                ;第31个点计算
    mov bx,[x31_place]
    mov [x_place],bx
    mov bx,[y31_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy31_place],bx
                ;第32个点计算
    mov bx,[x32_place]
    mov [x_place],bx
    mov bx,[y32_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy32_place],bx
                    ;第33个点计算
    mov bx,[x33_place]
    mov [x_place],bx
    mov bx,[y33_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy33_place],bx
                ;第34个点计算
    mov bx,[x34_place]
    mov [x_place],bx
    mov bx,[y34_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy34_place],bx
                ;第35个点计算
    mov bx,[x35_place]
    mov [x_place],bx
    mov bx,[y35_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy35_place],bx
                ;第36个点计算
    mov bx,[x36_place]
    mov [x_place],bx
    mov bx,[y36_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy36_place],bx
                ;第37个点计算
    mov bx,[x37_place]
    mov [x_place],bx
    mov bx,[y37_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy37_place],bx
                ;第38个点计算
    mov bx,[x38_place]
    mov [x_place],bx
    mov bx,[y38_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy38_place],bx
                    ;第39个点计算
    mov bx,[x39_place]
    mov [x_place],bx
    mov bx,[y39_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy39_place],bx
                ;第40个点计算
    mov bx,[x40_place]
    mov [x_place],bx
    mov bx,[y40_place]
    mov [y_place],bx
    call countxy
    mov bx,[xy_place]
    mov [xy40_place],bx

;=================算xy点位==============================
;=================画框==============================
    ;选择颜色
    mov bx,[redpen]
    mov [finpen],bx
    ;给方框赋值点位
    mov bx,[xy1_place]
    mov [r1_place],bx
    mov bx,[xy2_place]
    mov [r2_place],bx
    mov bx,[xy3_place]
    mov [r3_place],bx
    mov bx,[xy4_place]
    mov [r4_place],bx
    call rectangle
    ;画横线
    mov bx,[redpen]
    mov [finpen],bx
    mov bx,[xy5_place]
    mov [xystart_place],bx
    mov bx,[xy6_place]
    mov [xyend],bx
    call line



;=================画框=================================

;=================music字==============================
    ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy11_place]
    mov [xystart_place],bx
    mov bx,[xy13_place]
    mov [xyend],bx
    call line
    ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy11_place]
    mov [xystart_place],bx
    mov bx,[xy14_place]
    mov [xyend],bx
    call row
    ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy11_place]
    mov [xystart_place],bx
    mov bx,[xy14_place]
    mov [xyend],bx
    call row
    ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy12_place]
    mov [xystart_place],bx
    mov bx,[xy15_place]
    mov [xyend],bx
    call row
    ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy13_place]
    mov [xystart_place],bx
    mov bx,[xy16_place]
    mov [xyend],bx
    call row
     ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy19_place]
    mov [xystart_place],bx
    mov bx,[xy20_place]
    mov [xyend],bx
    call line
    ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy17_place]
    mov [xystart_place],bx
    mov bx,[xy19_place]
    mov [xyend],bx
    call row
    ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy18_place]
    mov [xystart_place],bx
    mov bx,[xy20_place]
    mov [xyend],bx
    call row
         ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy21_place]
    mov [xystart_place],bx
    mov bx,[xy22_place]
    mov [xyend],bx
    call line
         ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy23_place]
    mov [xystart_place],bx
    mov bx,[xy24_place]
    mov [xyend],bx
    call line
         ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy25_place]
    mov [xystart_place],bx
    mov bx,[xy26_place]
    mov [xyend],bx
    call line
        ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy21_place]
    mov [xystart_place],bx
    mov bx,[xy23_place]
    mov [xyend],bx
    call row
        ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy24_place]
    mov [xystart_place],bx
    mov bx,[xy25_place]
    mov [xyend],bx
    call row
             ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy27_place]
    mov [xystart_place],bx
    mov bx,[xy29_place]
    mov [xyend],bx
    call line
             ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy30_place]
    mov [xystart_place],bx
    mov bx,[xy32_place]
    mov [xyend],bx
    call line
            ;画竖线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy28_place]
    mov [xystart_place],bx
    mov bx,[xy31_place]
    mov [xyend],bx
    call row
                 ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy33_place]
    mov [xystart_place],bx
    mov bx,[xy34_place]
    mov [xyend],bx
    call line
             ;画横线
    mov bx,[rdpen+5]
    mov [finpen],bx
    mov bx,[xy35_place]
    mov [xystart_place],bx
    mov bx,[xy36_place]
    mov [xyend],bx
    call line
            ;画竖线
    mov bx,[rdpen+5 ]
    mov [finpen],bx
    mov bx,[xy33_place]
    mov [xystart_place],bx
    mov bx,[xy35_place]
    mov [xyend],bx
    call row

;=================开机音效==============================

    call outhuanyin
    call sleeploop3times
    call sleeploop3times
;=================开机音效==============================
    sti
;=================定时器==============================

    mov bp,1
    mov word [ds:0x20],int_time0
    mov word [ds:0x22],0

;=================定时器==============================

;=================声音==============================

    mov word [ds:0x24],int_key ;中断地址9
    mov word [ds:0x26],0

;=================声音==============================

;=================暂停线==============================
            ;画竖线
    mov bx,8
    mov [finpen],bx
    mov bx,[xy37_place]
    mov [xystart_place],bx
    mov bx,[xy38_place]
    mov [xyend],bx
    call row
                ;画竖线
    mov bx,8
    mov [finpen],bx
    mov bx,[xy39_place]
    mov [xystart_place],bx
    mov bx,[xy40_place]
    mov [xyend],bx
    call row
;=================暂停线==============================
;=================播放按键==============================

    push bx
    mov bx,8
    mov [finpen],bx
    pop bx
    mov si,name4
    push bx
    mov bx,[name4l]
    mov [namelength],bx
    pop bx
    call outpoint

    ; push bx
    ; mov bx,2
    ; mov [finpen],bx
    ; pop bx
    ; mov si,name5
    ; push bx
    ; mov bx,[name5l]
    ; mov [namelength],bx
    ; pop bx
    ; call outpoint

    push bx
    mov bx,8
    mov [finpen],bx
    pop bx
    mov si,name6
    push bx
    mov bx,[name6l]
    mov [namelength],bx
    pop bx
    call outpoint

;=================播放按键==============================

    jmp $
;=================主函数结束=========================




;画横线==============================================
;bp 起始位置 di 终止位置 cl色号
line:
    push bp
    push di
    mov bp,[xystart_place]
    mov di,[xyend]
    mov cl,[finpen]
linepart:
    mov byte [es:bp],cl
    add bp,1
    cmp bp,di
    jbe linepart
    pop di
    pop bp
    ret
;画横线===============================================


;画竖线===============================================
;bp 起始位置 di 终止位置 cl色号
row:
    push bp
    push di
    mov bp,[xystart_place]
    mov di,[xyend]
    mov cl,[finpen]
rowpart:
    mov byte [es:bp],cl
    add bp,320
    cmp bp,di
    jbe rowpart
    pop di
    pop bp
    ret
;画竖线===============================================


;画斜线，bl色号，bp起始位置，cx终点位置,坐标算死在调用,left 多加一个320
rightslash:
    mov byte [es:bp],bl
    add bp,321
    cmp bp,cx
    jbe rightslash
    ret
leftslash:
    mov byte [es:bp],bl
    add bp,319
    cmp bp,cx
    jbe leftslash
    ret

;=================计算坐标函数=========================
;计算坐标，输入值是x_place,y_place,写回xy_place
;使用： mov bx,[数据一] mov [x_place],bx  mov bx,[数据二] mov [y_place],bx call即可
;使用完将 [xy_place]写到bx 里面，再将bx 写回到数据三中，调用数据三即可调用坐标
countxy:
    push ax
    push bx
    mov ax,[y_place]
    mov bx,320
    mul bx
    mov [xy_place],ax
    mov bx,[x_place]
    add [xy_place],bx
    pop bx
    pop ax
    ret
;=================计算坐标函数=========================
;设置颜色，先mov si,ts直接重复调用即可，色号按照如下方式给出
; ts  db 0,255,255,255;背景色白
;     db 1,220,140,160;方框调色
;     db 2,255,0,0;
;     db 3,0,0,255
;=================颜色函数=========================
col:
    push dx
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
    pop dx
    ret
;=================颜色函数=========================
;=================画方框函数========================
;传入 r1 r2 r3 r4 四个点
rectangle:
    ;上，调用横线函数
    push bp
    push di
    mov bp,[r1_place]
    mov di,[r2_place]
    mov cl,[finpen]
lp1:
    mov byte [es:bp],cl
    add bp,1
    cmp bp,di
    jbe lp1
    ;下，调用横线函数 
    mov bp,[r3_place]
    mov di,[r4_place]
    mov cl,[finpen]
lp2:
    mov byte [es:bp],cl
    add bp,1
    cmp bp,di
    jbe lp2
    ;左，调用竖线函数
    mov bp,[r1_place]
    mov di,[r3_place]
    mov cl,[finpen]
lp3:
    mov byte [es:bp],cl
    add bp,320
    cmp bp,di
    jbe lp3
    ;右，调用竖线函数
    mov bp,[r2_place]
    mov di,[r4_place]
    mov cl,[finpen]
lp4:
    mov byte [es:bp],cl
    add bp,320
    cmp bp,di
    jbe lp4
    pop di
    pop bp
    ret
;=================画方框函数========================

;===================写字函数=======================
outpoint:
    push bx
    push cx
    push ax
    mov bx,0
partout:
    mov ax,[si+2]
    mov cx,320
    mul cx
    mov [nameplace],ax
    mov cx,[si]
    add [nameplace],cx
    mov bp,[nameplace]
    push ax
    mov al,[finpen]
    mov byte [es:bp],al
    pop ax
    add bx,1
    add si,4
    cmp bx,[namelength];点位大小
    jb partout
    pop ax
    pop cx
    pop bx
    ret
;===================写字函数=======================

;===================声音的函数=====================
int_key:
    mov dx,0x60
    in al,dx
    ;判断输入的是哪个按键，跳转

    ;开始判断下一个按键
    ;a
    mov word [ds:0x20],int_time1
    mov word [ds:0x22],0
    cmp al,0x1e
    je outa
    ;b
    cmp al,0x30
    je outb
    ;c
    cmp al,0x2e
    je outc

    cmp al,0x20
    je outd

    jmp k1
    ;因为代码都一样这里就用a b c d


outa:
;=================写字==============================
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name0
    push bx
    mov bx,[name0l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name2
    push bx
    mov bx,[name2l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name3
    push bx
    mov bx,[name3l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,5
    mov [finpen],bx
    pop bx
    mov si,name1
    push bx
    mov bx,[name1l]
    mov [namelength],bx
    pop bx
    call outpoint
;=================写字==============================
    call closes
    call outliangzhilaohu
    jmp k1
outb:
;=================写字==============================
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name0
    push bx
    mov bx,[name0l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name1
    push bx
    mov bx,[name1l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name3
    push bx
    mov bx,[name3l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,6
    mov [finpen],bx
    pop bx
    mov si,name2
    push bx
    mov bx,[name2l]
    mov [namelength],bx
    pop bx
    call outpoint
;=================写字==============================
    call closes
    call outshengrikuaile
    jmp k1
outc:
;=================写字==============================
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name0
    push bx
    mov bx,[name0l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name2
    push bx
    mov bx,[name2l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,0
    mov [finpen],bx
    pop bx
    mov si,name1
    push bx
    mov bx,[name1l]
    mov [namelength],bx
    pop bx
    call outpoint
    push bx
    mov bx,1
    mov [finpen],bx
    pop bx
    mov si,name3
    push bx
    mov bx,[name3l]
    mov [namelength],bx
    pop bx
    call outpoint
;=================写字==============================
    call closes
    call outxiaoxingxing
    jmp k1
outd:
    call closes
    jmp k1
k1:
    mov dx,0x20 ;键盘中断结束
    mov al,0x61
    out dx,al
    mov word [ds:0x20],int_time0
    mov word [ds:0x22],0
iret

outt:;初始化扬声器
    mov [pl_1],bx ;把do re。。。的频率先给
    mov al,10110110B
    out 43h,al
    push ax
    push dx
    push di
    mov dx,12h
    mov ax,32edh
    mov di,[pl_1]
    div di
    mov [pl_2],ax
    pop di
    pop dx
    pop ax
    mov ax, [pl_2] ;计数初值=1.19 MHz, 600 Hz=1983
    out 42H, al ;送计数初值低位字节，8253的计数器2的地址42H
    mov al, ah
    out 42H, al ;送计数初值高位字节
    call opens
    call sleep_0point4sec
    
    call closes
    ret
;延迟1s
sleep_1point0sec:
    push cx 
    push ax 
    push dx
    mov  cx, 0FH ;延时高16位
    mov  dx, 4240H ;延时低16位 1s=1000 000us=这个
    mov  ah, 86H ;调用功能号，格式化驱动器定期中断
    int  15H
    pop dx 
    pop ax 
    pop cx
ret

sleep_0point4sec:
    push cx 
    push ax 
    push dx
    mov  cx, 06H ;延时高16位
    mov  dx, 4240H ;延时低16位 1s=1000 000us=这个
    mov  ah, 86H ;调用功能号，格式化驱动器定期中断
    int  15H
    pop dx 
    pop ax 
    pop cx
ret

sleeploop3times:
    call sleep_1point0sec
    call sleep_1point0sec
    call sleep_1point0sec
ret

sleep_wl:
    push cx
    push ax
    mov ax,0fffh
x11:    mov cx,100
x22:    loop x22
    dec ax
    jnz x11
    pop ax
    pop cx
    ret


opens:
    ;打开扬声器
    push ax
    in al,61h
    or al,00000011B
    out 61h,al
    pop ax
    ret
closes:
    ;关闭扬声器
    push ax
    in al,61h
    and al,11111100B
    out 61h,al
    pop ax
    ret


outliangzhilaohu:
    push bx
    push di
    mov di,0
pratoutliangzhilaohu:
    mov bx,[liangzhilaohu+di]
    call sleeploop3times
    call outt
    add di,2
    cmp di,62
    jbe pratoutliangzhilaohu
    pop di
    pop bx
    ret

outhuanyin:
    push bx
    push di
    mov di,0
pratouthuanyin:
    mov bx,[huanyin+di]
    call sleep_1point0sec
    call outt
    add di,2
    cmp di,10
    jbe pratouthuanyin
    pop di
    pop bx
    ret

outshengrikuaile:
    push bx
    push di
    mov di,0
pratoutshengrikuaile:
    mov bx,[shengrikuaile+di]
    call sleeploop3times
    call outt
    add di,2
    cmp di,48
    jbe pratoutshengrikuaile
    pop di
    pop bx
    ret

outxiaoxingxing:
    push bx
    push di
    mov di,0
pratoutxiaoxingxing:
    mov bx,[xiaoxingxing+di]
    call sleeploop3times
    call outt
    add di,2
    cmp di,82
    jbe pratoutxiaoxingxing
    pop di
    pop bx
    ret
;===================声音的函数=====================
;===================计时器=====================
int_time0:
    push bx
    ;画横线
    inc bp
xxx:    cmp bp,7
    ja decbp
    mov bx,[rdpen+bp]
    mov [finpen],bx
     mov bx,[xy7_place]
    mov [xystart_place],bx
    mov bx,[xy8_place]
    mov [xyend],bx
    call line
     mov bx,[xy9_place]
    mov [xystart_place],bx
    mov bx,[xy10_place]
    mov [xyend],bx
    call line
    pop bx
    mov al,0x20
    mov dx,0x20
    out dx,al   ;EOI=0,中断结束
    iret
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
decbp:
    mov bp,1
    jmp xxx
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
;===================注意这里有无条件跳转=========
int_time1:
   

    mov al,0x20
    mov dx,0x20
    out dx,al   ;EOI=0,中断结束
    iret

sleep_1sec:
    push cx 
    push ax 
    push dx
    mov  cx, 98H ;延时高16位
    mov  dx, 9680H ;延时低16位 1s=1000 000us=这个
    mov  ah, 86H ;调用功能号，格式化驱动器定期中断
    int  15H
    pop dx 
    pop ax 
    pop cx
ret
;===================计时器=====================

