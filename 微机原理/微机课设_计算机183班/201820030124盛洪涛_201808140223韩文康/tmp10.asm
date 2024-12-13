org 0x8400
jmp start
;以下是汉字矩阵存储
;恭喜你赢了
mat db 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0
db 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0
db 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0
db 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0
db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0
db 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0
db 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0
db 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0
db 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0
db 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0
db 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0
db 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0
db 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0
db 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0
db 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0
db 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0
db 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0
db 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

;很遗憾你输了
mat2 db 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0
db 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0
db 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0
db 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0
db 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0
db 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0
db 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0
db 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0
db 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0
db 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0
db 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
db 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0
db 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0
db 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0
db 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0
db 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0
db 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0
db 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
db 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0
db 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0
db 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0
db 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0
db 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0
db 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0
db 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0
db 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0
db 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0
db 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0
db 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0
db 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0
db 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

color db 120,200,0;车的颜色
position dw 128;初始化车的左上角的坐标
car_width dw 64;车的宽度
car_height dw 25;车的高度
base dw 55744
da db 1,40,0,0
map_lenth dw 16;地图长度
now_level dw 0;当前是第几层
map_a dw 0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1
;地图数据
iter dw 0;地图指针
x_place dw 0
y_place dw 0
lose dw 0;是否输了
if_change_map dw 1;标志是否要下移地图
wa dw 0
wb dw 0
wc dw 0
;以下是画地图的版块
line:             		
	mov ax,0
col:
	cmp ax, 64
	jae bk
	mov byte[es:bx], 1
	add ax, 1
	add bx, 1
	jmp col
bk:
	ret

Tangle:
	mov bx,[ds:x_place]
	mov ax,64
	mov dx,[ds:y_place]
	imul ax,dx
	add bx,ax
	mov cx,320
	imul cx,175
	add cx,[ds:position]
	cmp cx,bx;冲撞分析
	jne Ys
	mov word[lose],1;设为失败
Ys:	mov dx,0
draww:	call line
	sub bx,64
	add bx,320
	add dx,1
	cmp dx,25
	jl draww
	ret

Show_barrier:
	mov si,map_a
	mov bx,[ds:iter]
	mov cx,7;地图是7行5列双循环生成
FOR1:		
		mov ax,cx
		mov dx,320
		imul ax,dx
		imul ax,25
		mov [ds:x_place],ax;把横坐标的位置换算成像素后存在xplace里
		mov dx,0
FOR2:		mov ax,[si+bx]
			cmp ax,0
			je GOTO
			mov [ds:y_place],dx;把纵坐标的列数放在yplace里
			push ax
			push bx
			push cx
			push dx
			call Tangle;画矩阵
			pop dx
			pop cx
			pop bx
			pop ax
GOTO:			add bx,2
			add dx,1
			cmp dx,5;五次循环
			jnge FOR2
			
	sub cx,1
	cmp cx,1;七次循环
	jge FOR1
	mov bx,[ds:iter]
	add bx,10;把指针的位置往后挪5格,注意此时只是对寄存器做了加法，还没对真正的指针变量进行修改
	cmp word[if_change_map],0;检测当前是处于需要下降还是不需要下降
	je show_end;0就不要变
	mov [ds:iter],bx;修改指针变量
show_end:
	ret
;主函数
start:	
	mov ah, 00h
	mov al, 13h
	int 10h ;图形模式
	mov ax, 0xa000	
	mov es, ax;确定车的位置
	mov si,0
	mov si, color
	mov cl, 3
	;根据需要决定是否要自定义键盘中断处理程序
	;mov ax,0
	;mov ds,ax
	;CLI
	;mov word[ds:0x24],int_key
	;mov word[ds:0x26],0
	;STI
	call setting;设置颜色
	call draw_car;初始化下画下车的位置
for:
	add word[now_level],1
	call draw_all
	call time_layback;限制一段的时间，这段时间内车可以移动，然后每隔固定时间，地图下移
	cmp word[lose],1;如果发生了冲撞输出失败信息
	je put_lose
	cmp word[now_level],16;当通过一定长度的地图时就胜利了
	je put_win

jmp for
;基于汉字区位码的汉字点阵的输出
put_lose:
	call clear_all
	mov si,mat2
	
	mov bx,0
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,18
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,36
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,54
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,72
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,90
	call get_ed
	mov ax,0
	call write_a_word
	jmp end
put_win:
	call clear_all
	mov si,mat
	
	mov bx,0
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,18
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,36
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,54
	call get_ed
	mov ax,0
	call write_a_word
	
	mov bx,72
	call get_ed
	mov ax,0
	call write_a_word
	
end:
jmp $
;根据需要确定是否需要自定义键盘中断处理程序
int_key:
jmp here10
keep_rightt:
	mov word[position],256
	jmp exit
here10:
	mov dx,0x60
	in al,dx
	cmp al,0x1e
	jnz tmpd
	;对a的响应
		cmp word[position],0
		je exit
		add word[position],-64
	jmp exit
tmpd:
	cmp al,0x20
	;对d的响应
	jnz exit
		add word[position],64
		cmp word[position],256
		jae keep_rightt
	jnz exit
exit:	
	mov dx, 0x20
	mov al, 0x61
	out dx, al
	call draw_car
iret

get_ed:
	mov dx,bx
	add dx,4815
ret	
;跑一遍点阵
write_a_word:
	jmp here6
neline:
	mov ax,0
	add bx,304
	jmp back6
write_a_dot:
	mov byte [es:bx],4
	jmp back5
here6:	
	cmp byte[ds:si],1
	je write_a_dot
back5:	
	inc si
	inc bx
	inc ax
	cmp ax,16
	je neline
back6:	
	cmp bx,dx
	jbe here6
ret
;自定义方便debug的函数
debug:
	mov cx,0
	mov dx,0
	mov si,100
	ii:
		cmp cx,word[car_height]
		je debug_end;
		inc cx
		add si,256
		mov dx,0
		jmp jj
		jj:
		cmp dx,word[car_width]
		je ii
		mov byte[es:si],5
		inc dx
		inc si
		jmp jj
	debug_end:
ret

;根据int16中断程序的0号和1号功能区完成键盘输入响应
Horizontal_movement:
jmp here
keep_right:
	mov word[position],256
	jmp back2
here:
	mov ah,0x1;判断缓冲区是否为空
	int 0x16
	jz event_end;zf标志寄存器,空就不做操作，否则实时更新 车的位置
	
	mov ah, 0x0;从键盘缓冲区读出
	int 0x16	
	;以下是车的坐标的更新
	;int16处理后，ah存放扫描码，al存放ascii码
	cmp al,'a';向左移动
	jnz right
		cmp word[position],0;限制车的位置不得小于0
		je event_end
		add word[position],-64
	jmp event_end
right:	
	cmp al,'d';向右移动
	jnz event_end
		add word[position],64
		cmp word[position],256;限制车的位置不得大于256
		jae keep_right
back2:	jmp event_end
	event_end:
	call draw_car
ret

;通过当前车的左上角的相对坐标找到它的真实坐标
get_pos:
	mov si,word[base]
	add si,word[position]
ret

;用黑色点覆盖整个屏幕
clear_all:
	mov si,0
	mov dx,64000
clear_dot:
	mov word[es:si],0
	inc si
	cmp si,dx
	jb clear_dot
	ret	

;响应更新车的位置的操作	
draw_car:
	call clear_all;清空屏幕
	mov word[if_change_map],0;设置成不要改变地图的位置，因为这是在1秒内的操作，而不是第k秒
	call Show_barrier
	call get_pos
	mov cx,0
	mov dx,0
	iiii:
		cmp cx,word[car_height]
		je draw_car_end
		inc cx
		add si,256
		mov dx,0
		jmp jjjj
		jjjj:
		cmp dx,word[car_width]
		je iiii
		mov byte[es:si],5
		inc dx
		inc si
		jmp jjjj
	mov bx,[ds:iter]
	mov si,map_a
	mov cx,0
	jmp here5
;冲撞分析
judge:
	mov dx,cx
	imul dx,32
	cmp word[position],dx
	je set_lose
	jmp here5
;设置成错误
set_lose:
	mov word[lose],1
here5:
	cmp dx,[si+bx]
	cmp dx,1
	je judge
	add cx,2
	add bx,2
	cmp cx,8
	jbe here5
draw_car_end:		
	ret
;在这个版块中使地图下降
draw_all:
	call clear_all
	mov word[if_change_map],1;标志地图下降
	call Show_barrier
	call get_pos
	mov cx,0
	mov dx,0
	iii:
		cmp cx,word[car_height]
		je draw_all_end
		inc cx
		add si,256
		mov dx,0
		jmp jjj
		jjj:
		cmp dx,word[car_width]
		je iii
		mov byte[es:si],5
		inc dx
		inc si
		jmp jjj
draw_all_end:		
	ret
	
setting:
	mov dx, 0x3c8
	mov al, cl
	out dx, al

	mov dx, 0x3c9
	mov al, [ds:si]
	out dx, al
	
	mov al, [ds:si+1]
	out dx, al
	
	mov al, [ds:si+2]
	out dx, al
ret

;分时间2
time_layback3:
		mov word[wc],0
here4:	add word[wc],1
		cmp word[wc],1000
		jb here4
ret

;分时间1
time_layback2:
		mov word[wb],0
here3:	add word[wb],1
		call time_layback3
		cmp word[wb],400
		jb here3
ret

time_layback:
		mov word[wa],0
here2: 	add word[wa],1
		call time_layback2
		call Horizontal_movement;每隔400*1000个单位检测键盘缓冲区的数据做出相应
		cmp word[wa],10
		jb here2
ret