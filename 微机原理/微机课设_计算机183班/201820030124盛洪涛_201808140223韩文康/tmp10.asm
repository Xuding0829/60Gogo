org 0x8400
jmp start
;�����Ǻ��־���洢
;��ϲ��Ӯ��
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

;���ź�������
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

color db 120,200,0;������ɫ
position dw 128;��ʼ���������Ͻǵ�����
car_width dw 64;���Ŀ��
car_height dw 25;���ĸ߶�
base dw 55744
da db 1,40,0,0
map_lenth dw 16;��ͼ����
now_level dw 0;��ǰ�ǵڼ���
map_a dw 0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1
;��ͼ����
iter dw 0;��ͼָ��
x_place dw 0
y_place dw 0
lose dw 0;�Ƿ�����
if_change_map dw 1;��־�Ƿ�Ҫ���Ƶ�ͼ
wa dw 0
wb dw 0
wc dw 0
;�����ǻ���ͼ�İ��
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
	cmp cx,bx;��ײ����
	jne Ys
	mov word[lose],1;��Ϊʧ��
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
	mov cx,7;��ͼ��7��5��˫ѭ������
FOR1:		
		mov ax,cx
		mov dx,320
		imul ax,dx
		imul ax,25
		mov [ds:x_place],ax;�Ѻ������λ�û�������غ����xplace��
		mov dx,0
FOR2:		mov ax,[si+bx]
			cmp ax,0
			je GOTO
			mov [ds:y_place],dx;�����������������yplace��
			push ax
			push bx
			push cx
			push dx
			call Tangle;������
			pop dx
			pop cx
			pop bx
			pop ax
GOTO:			add bx,2
			add dx,1
			cmp dx,5;���ѭ��
			jnge FOR2
			
	sub cx,1
	cmp cx,1;�ߴ�ѭ��
	jge FOR1
	mov bx,[ds:iter]
	add bx,10;��ָ���λ������Ų5��,ע���ʱֻ�ǶԼĴ������˼ӷ�����û��������ָ����������޸�
	cmp word[if_change_map],0;��⵱ǰ�Ǵ�����Ҫ�½����ǲ���Ҫ�½�
	je show_end;0�Ͳ�Ҫ��
	mov [ds:iter],bx;�޸�ָ�����
show_end:
	ret
;������
start:	
	mov ah, 00h
	mov al, 13h
	int 10h ;ͼ��ģʽ
	mov ax, 0xa000	
	mov es, ax;ȷ������λ��
	mov si,0
	mov si, color
	mov cl, 3
	;������Ҫ�����Ƿ�Ҫ�Զ�������жϴ������
	;mov ax,0
	;mov ds,ax
	;CLI
	;mov word[ds:0x24],int_key
	;mov word[ds:0x26],0
	;STI
	call setting;������ɫ
	call draw_car;��ʼ���»��³���λ��
for:
	add word[now_level],1
	call draw_all
	call time_layback;����һ�ε�ʱ�䣬���ʱ���ڳ������ƶ���Ȼ��ÿ���̶�ʱ�䣬��ͼ����
	cmp word[lose],1;��������˳�ײ���ʧ����Ϣ
	je put_lose
	cmp word[now_level],16;��ͨ��һ�����ȵĵ�ͼʱ��ʤ����
	je put_win

jmp for
;���ں�����λ��ĺ��ֵ�������
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
;������Ҫȷ���Ƿ���Ҫ�Զ�������жϴ������
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
	;��a����Ӧ
		cmp word[position],0
		je exit
		add word[position],-64
	jmp exit
tmpd:
	cmp al,0x20
	;��d����Ӧ
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
;��һ�����
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
;�Զ��巽��debug�ĺ���
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

;����int16�жϳ����0�ź�1�Ź�������ɼ���������Ӧ
Horizontal_movement:
jmp here
keep_right:
	mov word[position],256
	jmp back2
here:
	mov ah,0x1;�жϻ������Ƿ�Ϊ��
	int 0x16
	jz event_end;zf��־�Ĵ���,�վͲ�������������ʵʱ���� ����λ��
	
	mov ah, 0x0;�Ӽ��̻���������
	int 0x16	
	;�����ǳ�������ĸ���
	;int16�����ah���ɨ���룬al���ascii��
	cmp al,'a';�����ƶ�
	jnz right
		cmp word[position],0;���Ƴ���λ�ò���С��0
		je event_end
		add word[position],-64
	jmp event_end
right:	
	cmp al,'d';�����ƶ�
	jnz event_end
		add word[position],64
		cmp word[position],256;���Ƴ���λ�ò��ô���256
		jae keep_right
back2:	jmp event_end
	event_end:
	call draw_car
ret

;ͨ����ǰ�������Ͻǵ���������ҵ�������ʵ����
get_pos:
	mov si,word[base]
	add si,word[position]
ret

;�ú�ɫ�㸲��������Ļ
clear_all:
	mov si,0
	mov dx,64000
clear_dot:
	mov word[es:si],0
	inc si
	cmp si,dx
	jb clear_dot
	ret	

;��Ӧ���³���λ�õĲ���	
draw_car:
	call clear_all;�����Ļ
	mov word[if_change_map],0;���óɲ�Ҫ�ı��ͼ��λ�ã���Ϊ������1���ڵĲ����������ǵ�k��
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
;��ײ����
judge:
	mov dx,cx
	imul dx,32
	cmp word[position],dx
	je set_lose
	jmp here5
;���óɴ���
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
;����������ʹ��ͼ�½�
draw_all:
	call clear_all
	mov word[if_change_map],1;��־��ͼ�½�
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

;��ʱ��2
time_layback3:
		mov word[wc],0
here4:	add word[wc],1
		cmp word[wc],1000
		jb here4
ret

;��ʱ��1
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
		call Horizontal_movement;ÿ��400*1000����λ�����̻�����������������Ӧ
		cmp word[wa],10
		jb here2
ret