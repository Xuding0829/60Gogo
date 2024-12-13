org 0x8400
jmp main

hz dw 600

flag db 0

soundList dw 261, 261, 392, 392, 440, 440, 392
          dw 349, 349, 329, 329, 293, 293, 261
          dw 392, 392, 349, 349, 329, 329, 293
          dw 261, 261, 392, 392, 440, 440, 392
          dw 349, 349, 329, 329, 293, 293, 261
soundNow  dw 0
soundNum  dw 70
soundCount dw 0

colNum db 1
colR db 66
colG db 55
colB db 44

KAI db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,
db 0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0

SHI db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,
db 1,1,1,1,1,1,0,0,1,1,0,0,1,0,0,0,
db 1,1,1,1,1,1,0,1,1,0,0,0,1,1,0,0,
db 0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,
db 0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,
db 0,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,
db 1,1,0,0,1,1,0,1,1,1,1,1,1,1,0,0,
db 0,1,1,0,1,1,0,1,1,1,1,1,1,1,0,0,
db 0,0,1,1,1,0,0,1,1,0,0,0,1,1,0,0,
db 0,0,0,1,1,1,0,1,1,0,0,0,1,1,0,0,
db 0,0,1,1,0,1,0,1,1,1,1,1,1,1,0,0,
db 0,1,1,0,0,0,0,1,1,1,1,1,1,1,0,0,
db 1,1,0,0,0,0,0,1,1,0,0,0,1,1,0,0

YOU db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,
db 1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,0,
db 0,1,1,0,0,0,1,0,0,0,1,1,1,1,1,0,
db 0,0,0,1,1,1,1,1,0,1,1,1,1,1,1,0,
db 0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,0,0,1,1,0,0,1,0,1,1,1,1,1,0,
db 0,1,1,0,1,1,1,1,0,0,1,1,1,1,1,0,
db 0,0,0,0,1,1,1,1,0,0,0,0,1,1,0,0,
db 0,0,0,0,1,1,0,1,0,1,1,1,1,1,1,0,
db 0,0,1,0,1,1,0,1,0,1,1,1,1,1,1,0,
db 0,0,1,0,1,1,0,1,0,0,0,1,1,0,0,0,
db 0,1,1,0,1,1,0,1,0,0,0,1,1,0,0,0,
db 0,1,0,0,1,1,0,1,0,0,0,1,1,0,0,0,
db 1,1,0,1,1,1,0,1,0,0,1,1,1,0,0,0,
db 1,1,0,1,1,0,1,1,0,0,1,1,0,0,0,0

XI db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,
db 1,1,1,1,1,1,0,0,1,1,0,1,1,0,0,0,
db 1,1,1,1,1,1,0,0,1,1,0,0,1,0,0,0,
db 0,0,0,0,1,1,0,0,1,1,1,1,1,1,0,0,
db 0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0,
db 0,1,1,0,1,1,0,0,1,1,0,0,1,0,0,0,
db 0,0,1,1,1,0,0,0,1,1,0,1,1,0,0,0,
db 0,0,0,1,1,0,0,0,1,1,0,1,1,0,0,0,
db 0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,0,
db 0,1,1,0,0,1,0,0,0,1,1,0,0,0,1,0,
db 1,1,0,0,0,0,0,0,1,1,1,1,0,1,1,0,
db 1,0,0,0,0,0,1,1,1,0,0,1,1,1,1,0,
db 0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,0

SHENG db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,
db 0,1,1,1,1,1,0,1,1,0,1,1,0,0,0,0,
db 0,1,1,1,1,1,0,1,1,0,1,1,0,0,0,0,
db 0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,
db 0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,
db 0,1,1,1,1,1,1,1,0,0,1,1,0,0,0,0,
db 0,1,1,0,1,1,0,0,0,0,1,1,0,0,0,0,
db 0,1,1,0,1,1,0,0,1,1,1,1,1,1,0,0,
db 0,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
db 0,1,1,0,1,1,0,0,0,0,1,1,0,0,0,0,
db 0,1,1,0,1,1,0,0,0,0,1,1,0,0,0,0,
db 0,1,1,0,1,1,0,0,0,0,1,1,0,0,0,0,
db 0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,
db 1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,0,
db 1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0

LI db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
db 0,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,
db 0,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,1,1,0,0,
db 1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,0,
db 1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,0,
db 0,0,0,1,1,1,0,0,0,1,1,0,1,1,0,0,
db 0,0,1,1,1,1,1,0,0,1,1,0,1,1,0,0,
db 0,1,1,0,1,1,1,1,0,1,1,0,1,1,0,0,
db 1,1,1,0,1,1,0,1,0,1,1,0,1,1,0,0,
db 0,1,0,0,1,1,0,0,0,0,0,0,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0

SHI2 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,
db 0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,
db 0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,
db 0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,
db 0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,
db 0,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0

BAI db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,
db 0,1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,
db 0,1,1,0,0,0,1,0,0,1,1,1,1,1,1,0,
db 0,1,1,0,1,0,1,0,0,1,1,1,1,1,1,0,
db 0,1,1,0,1,0,1,0,1,1,0,0,1,1,0,0,
db 0,1,1,0,1,0,1,0,1,1,0,0,1,1,0,0,
db 0,1,1,0,1,0,1,1,1,1,0,0,1,1,0,0,
db 0,1,1,0,1,0,1,1,1,1,0,0,1,1,0,0,
db 0,1,1,0,1,0,1,0,0,1,0,1,1,0,0,0,
db 0,0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,
db 0,0,1,1,0,1,0,0,0,0,1,1,0,0,0,0,
db 0,1,1,0,0,1,1,0,0,1,1,1,1,0,0,0,
db 1,1,0,0,0,0,0,0,1,1,0,0,1,1,1,0,
db 0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

CLEAR db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0



TANK1 db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

TANK2 db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,
db 0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0

TANK3 db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
db 0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1

TANK4 db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
db 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0

BULLET db 1,1,1,1,
       db 1,1,1,1,
       db 1,1,1,1,
       db 1,1,1,1

BULLETCLEAR db 0,0,0,0,
            db 0,0,0,0,
            db 0,0,0,0,
            db 0,0,0,0

ZAN db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,
db 0,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,
db 0,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,
db 0,0,1,0,1,1,0,0,0,1,1,1,1,1,1,0,
db 0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,
db 0,0,0,0,1,1,0,0,0,1,0,1,1,0,0,0,
db 0,1,1,1,1,1,1,0,1,1,0,1,1,0,0,0,
db 0,1,1,1,1,1,0,0,1,0,0,1,1,0,0,0,
db 0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,
db 0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,
db 0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0

TING db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,
db 0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,
db 0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,1,1,1,0,0,1,1,1,1,1,1,1,1,0,0,
db 1,1,1,1,0,0,1,1,0,0,0,0,1,1,0,0,
db 1,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,
db 0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,0,
db 0,0,1,1,0,1,0,0,0,0,0,0,0,0,1,0,
db 0,0,1,1,0,0,1,1,1,1,1,1,1,1,0,0,
db 0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,
db 0,0,1,1,0,0,0,1,1,1,1,0,0,0,0,0,
db 0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0

WU db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
db 0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,
db 0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
db 0,0,0,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,0,
db 0,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,
db 0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0

BOTCLEAR db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

;控制换行
limX dw 15  
limY dw 0
;在显存中的初始坐标
startX dw 100
startY dw 80
startAddr dw 0

;控制换行
blimX dw 3  
blimY dw 0
;在显存中的初始坐标
bstartX dw 0
bstartY dw 200
bstartAddr dw 0
bflag db 0
bdir db 0

dir db 0

botLimX dw 31  
botLimY dw 0
;在显存中的初始坐标
botStartX dw 100
botStartY dw 80
botStartAddr dw 0
botFlag db 0

sx  dw 0
sy  dw 0
ex  dw 0
ey  dw 0
width dw 320
hight dw 30
fg  dw 1
hp dw 14

pauseFlag db 0



main:
    sti
    mov ah, 00h
    mov al, 13h
    int 10h

    mov bx, 0xa000
    mov es, bx

    mov word [ds:0x24], kb
    mov word [ds:0x26], 0

    call setTimer

mainControl:
    
    cmp byte [flag], 0
    je gameStart

    cmp byte [flag], 1
    je gameMain

    cmp byte [flag], 2
    je gameWin

    cmp byte [flag], 3
    je gameLose

    jmp mainControl

    
gameStart:
    sti
    mov byte [colNum], 3

    mov word [startX], 100
    mov word [startY], 80
    mov word [startAddr], KAI
    call print

    mov word [startX], 120
    mov word [startY], 80
    mov word [startAddr], SHI
    call print

    mov word [startX], 140
    mov word [startY], 80
    mov word [startAddr], YOU
    call print

    mov word [startX], 160
    mov word [startY], 80
    mov word [startAddr], XI
    call print


    jmp mainControl

gameMain:
    sti
    mov byte [colNum], 0
    mov byte [colR], 50
    mov byte [colG], 50
    mov byte [colB], 50
    call setColor

    mov word [startAddr], CLEAR

    mov word [startX], 100
    mov word [startY], 80
    call print

    mov word [startX], 120
    mov word [startY], 80
    call print

    mov word [startX], 140
    mov word [startY], 80
    call print

    mov word [startX], 160
    mov word [startY], 80
    call print

    mov byte [colNum], 14
    mov word [sx], 0
    mov word [sy], 0
    call printSoildRec

    mov byte [colNum], 41

    mov word [startX], 10
    mov word [startY], 180
    mov word [startAddr], ZAN
    call print

    mov word [startX], 30
    mov word [startY], 180
    mov word [startAddr], TING
    call print

    mov byte [colNum], 78
    mov byte [colR], 77
    mov byte [colG], 88
    mov byte [colB], 88
    call setColor

    mov word [botStartX], 70
    mov word [botStartY], 180
    mov word [botStartAddr], WU
    call botPrint

    mov byte [colNum], 19
    mov byte [colR], 36
    mov byte [colG], 36
    mov byte [colB], 47
    call setColor

    mov word [sx], 0
    mov word [sy], 170
    mov word [ex], 320
    mov word [ey], 170
    mov word [fg], 1
    call printLine

    mov byte [colNum], 17
    mov byte [colR], 63
    mov byte [colG], 63
    mov byte [colB], 63
    call setColor

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 179
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 0
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov byte [colNum], 18
    mov byte [colR], 0
    mov byte [colG], 0
    mov byte [colB], 0
    call setColor

    mov word [sx], 0
    mov word [sy], 196
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 1
    call printLine

    mov word [sx], 56
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov byte [colNum], 55
    mov byte [colR], 38
    mov byte [colG], 51
    mov byte [colB], 12
    call setColor

    mov word [startX], 50
    mov word [startY], 50


timerControl:
    cmp byte [flag], 1
    jne mainControl

    cmp byte [pauseFlag], 1
    je mainPause

    mov word [ds:0x20], bulletControl
    mov word [ds:0x22], 0
    call sleep
    call sleep

    mov word [ds:0x20], tankControl
    mov word [ds:0x22], 0
    call sleep


    mov word [ds:0x20], playSound
    mov word [ds:0x22], 0
    call sleep

    mov word [ds:0x20], botControl
    mov word [ds:0x22], 0
    call sleep

    jmp timerControl

mainPause:

    mov word [ds:0x20], emptyTask
    mov word [ds:0x22], 0
    ;call sleep

    jmp timerControl




gameWin:
    cli
    mov byte [colNum], 0
    mov byte [colR], 0
    mov byte [colG], 0
    mov byte [colB], 0
    call setColor

    mov byte [colNum], 8
    mov byte [colR], 0
    mov byte [colG], 0
    mov byte [colB], 63
    call setColor

    mov word [startX], 100
    mov word [startY], 80
    mov word [startAddr], YOU
    call print

    mov word [startX], 120
    mov word [startY], 80
    mov word [startAddr], XI
    call print

    mov word [startX], 140
    mov word [startY], 80
    mov word [startAddr], SHENG
    call print

    mov word [startX], 160
    mov word [startY], 80
    mov word [startAddr], LI
    call print


    mov word [startAddr], CLEAR
    mov word [startX], 10
    mov word [startY], 180
    call print

    mov word [startX], 30
    mov word [startY], 180
    call print

    mov word [botStartAddr], BOTCLEAR
    call botPrint

    mov byte [colNum], 18

    mov word [sx], 0
    mov word [sy], 170
    mov word [ex], 320
    mov word [ey], 170
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 179
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 0
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov word [sx], 0
    mov word [sy], 196
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 1
    call printLine

    mov word [sx], 56
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov word [ds:0x20], emptyTask
    mov word [ds:0x22], 0

    call sleep

    jmp mainControl

gameLose:
    cli
    mov byte [colNum], 0
    mov byte [colR], 0
    mov byte [colG], 0
    mov byte [colB], 0
    call setColor

    mov byte [colNum], 10
    mov byte [colR], 63
    mov byte [colG], 0
    mov byte [colB], 0
    call setColor

    mov word [startX], 100
    mov word [startY], 80
    mov word [startAddr], YOU
    call print

    mov word [startX], 120
    mov word [startY], 80
    mov word [startAddr], XI
    call print

    mov word [startX], 140
    mov word [startY], 80
    mov word [startAddr], SHI2
    call print

    mov word [startX], 160
    mov word [startY], 80
    mov word [startAddr], BAI
    call print

    mov word [startAddr], CLEAR
    mov word [startX], 10
    mov word [startY], 180
    call print

    mov word [startX], 30
    mov word [startY], 180
    call print

    mov word [botStartAddr], BOTCLEAR
    call botPrint

    mov byte [colNum], 18

    mov word [sx], 0
    mov word [sy], 170
    mov word [ex], 320
    mov word [ey], 170
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 179
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 0
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov word [sx], 0
    mov word [sy], 196
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 1
    call printLine

    mov word [sx], 56
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov word [ds:0x20], emptyTask
    mov word [ds:0x22], 0

    call sleep

    jmp mainControl

    jmp $

emptyTask:
    push ax
    push dx

    call closeBeep

    mov al, 0x20
    mov dx, 0x20
    out dx, al

    pop ax
    pop dx 

    iret

botControl:
    push dx
    push ax

    mov word [botStartAddr], BOTCLEAR
    call botPrint

    cmp word [botStartX], 290
    jae botChangeFlag1

    cmp word [botStartX], 60
    jbe botChangeFlag0

    cmp byte [botFlag], 0
    je botDirChange0

    jmp botDirChange1

botChangeFlag1:
    mov byte [botFlag], 1

    jmp botDirChange1

botChangeFlag0:
    mov byte [botFlag], 0
    jmp botDirChange0

botDirChange0:
    inc word [botStartX]
    mov word [botStartAddr], WU
    call botPrint
    jmp botExit

botDirChange1:
    dec word [botStartX]
    mov word [botStartAddr],WU
    call botPrint
    jmp botExit

botExit:
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    pop ax
    pop dx 

    iret

tankControl:
    push ax
    push dx

    cmp byte [dir], 1
    je printTank1

    cmp byte [dir], 2
    je printTank2
    
    cmp byte [dir], 3
    je printTank3

    cmp byte [dir], 4
    je printTank4

printTank1:
    mov word [startAddr], TANK1
    jmp printTank

printTank2:
    mov word [startAddr], TANK2
    jmp printTank

printTank3:
    mov word [startAddr], TANK3
    jmp printTank

printTank4:
    mov word [startAddr], TANK4
    jmp printTank

printTank:
    mov byte [colNum], 55
    call print


tankControlExit:
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    pop ax
    pop dx 

    iret

bulletControl:
    push ax
    push dx
    push bx

    cmp byte [bflag], 0
    je bulletControlExit

    mov word [bstartAddr], BULLETCLEAR
    call bprint


    cmp byte [bdir], 1
    je bdirw

    cmp byte [bdir], 2
    je bdirs

    cmp byte [bdir], 3
    je bdira

    cmp byte [bdir], 4
    je bdird

    jmp bulletControlExit

bdirw: 
    dec word [bstartY]

    cmp word [bstartY], 1
    jb bclear

    jmp bulletprint
bdirs:
    inc word [bstartY]

    cmp word [bstartY], 165
    ja bclear

    jmp bulletprint
bdira:
    dec word [bstartX]

    cmp word [bstartX], 1
    jb bclear

    jmp bulletprint
bdird:
    inc word [bstartX]

    cmp word [bstartX], 315
    ja bclear

    jmp bulletprint

bulletprint:
    mov word [bstartAddr], BULLET
    call bprint

    mov word [sy], 0
    mov bx, [sy]
    add bx, [hight]
    add bx, 2
    cmp bx, [bstartY]
    ja bulletHit

    jmp bulletControlExit

bulletHit:
    dec word [hp]
    mov bx, [hp]
    mov [colNum], bl
    mov word [sx], 0
    mov word [sy], 0
    call printSoildRec

    mov word [bstartAddr], BULLETCLEAR
    call bprint

    cmp word [hp], 10
    jb bulletWin

    jmp bclear

bulletWin:
    mov byte [flag], 2

    mov word [hp], 0
    mov word [sx], 0
    mov word [sy], 0
    mov byte [colNum], 0
    call printSoildRec

    mov word [startAddr], CLEAR
    call print
    call closeBeep

bclear:
    mov byte [bflag], 0



bulletControlExit:
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    pop bx
    pop ax
    pop dx

    iret


kb:
    push dx
    push ax
    push bx

    mov dx, 0x60
    in al, dx

    cmp al, 0x12
    je kbChangeFlag

    cmp al, 0x11
    je kbW

    cmp al, 0x1f
    je kbS

    cmp al, 0x1e
    je kbA

    cmp al, 0x20
    je kbD

    cmp al, 0x24
    je kbullet
    
    cmp al, 0x19
    je kpause

    jmp kbExit

kbChangeFlag:

    cmp byte [flag], 2
    je kbExit

    cmp byte [flag], 3
    je kbExit

    mov byte [flag], 1
    jmp kbExit

kbW:
    cmp byte [flag], 1
    jne kbExit

    cmp byte [pauseFlag], 1
    je kbExit

    mov byte [dir], 1

    mov word [startAddr], CLEAR
    call print

    cmp word [startY], 30
    ja decY

    mov byte [flag], 3

    mov word [hp], 0
    mov word [sx], 0
    mov word [sy], 0
    mov word [colNum], 0
    call printSoildRec

    call closeBeep

    jmp kbExit
decY:
    dec word [startY]
    jmp kbExit

kbS:

    cmp byte [flag], 1
    jne kbExit

    cmp byte [pauseFlag], 1
    je kbExit

    mov byte [dir], 2

    mov word [startAddr], CLEAR
    call print

    cmp word [startY], 154
    jb incY

    jmp kbExit
incY:
    inc word [startY]
    jmp kbExit

kbA:

    cmp byte [flag], 1
    jne kbExit

    cmp byte [pauseFlag], 1
    je kbExit

    mov byte [dir], 3

    mov word [startAddr], CLEAR
    call print

    cmp word [startX], 0
    ja decX

    jmp kbExit
decX:
    dec word [startX]
    jmp kbExit


kbD:

    cmp byte [flag], 1
    jne kbExit

    cmp byte [pauseFlag], 1
    je kbExit

    mov byte [dir], 4

    mov word [startAddr], CLEAR
    call print

    cmp word [startX], 304
    jb incX

    jmp kbExit
incX:
    inc word [startX]
    jmp kbExit

kpause:

    cmp byte [flag], 1
    jne kbExit

    cmp byte[pauseFlag], 0
    je pauseTo1

    mov byte [pauseFlag], 0

    mov byte [colNum], 17

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 179
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 0
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov byte [colNum], 18

    mov word [sx], 0
    mov word [sy], 196
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 1
    call printLine

    mov word [sx], 56
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    jmp kbExit
pauseTo1:
    mov byte [pauseFlag], 1

    mov byte [colNum], 18

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 179
    mov word [fg], 1
    call printLine

    mov word [sx], 0
    mov word [sy], 179
    mov word [ex], 0
    mov word [ey], 196
    mov word [fg], 320
    call printLine

    mov byte [colNum], 17

    mov word [sx], 0
    mov word [sy], 196
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 1
    call printLine

    mov word [sx], 56
    mov word [sy], 179
    mov word [ex], 56
    mov word [ey], 196
    mov word [fg], 320
    call printLine
    jmp kbExit

kbullet:

    cmp byte [flag], 1
    jne kbExit

    cmp byte [pauseFlag], 1
    je kbExit

    cmp byte [bflag], 1
    je kbExit

    mov byte [bflag], 1

    cmp byte [dir], 1
    je kbulletW

    cmp byte [dir], 2
    je kbulletS

    cmp byte [dir], 3
    je kbulletA

    cmp byte [dir], 4
    je kbulletD

    jmp kbExit

kbulletW:
    mov bx, [startX]
    add bx, 6
    mov [bstartX], bx

    mov bx, [startY]
    sub bx, 4
    mov [bstartY], bx

    mov bl, [dir]
    mov [bdir], bl

    mov word [bstartAddr], BULLET
    call bprint
    jmp kbExit

kbulletS:
    mov bx, [startX]
    add bx, 6
    mov [bstartX], bx

    mov bx, [startY]
    add bx, 16
    mov [bstartY], bx

    mov bl, [dir]
    mov [bdir], bl

    mov word [bstartAddr], BULLET
    call bprint

    jmp kbExit


kbulletA:
    mov bx, [startX]
    sub bx, 4
    mov [bstartX], bx

    mov bx, [startY]
    add bx, 6
    mov [bstartY], bx

    mov bl, [dir]
    mov [bdir], bl

    mov word [bstartAddr], BULLET
    call bprint
    jmp kbExit

kbulletD:
    mov bx, [startX]
    add bx, 16
    mov [bstartX], bx

    mov bx, [startY]
    add bx, 6
    mov [bstartY], bx

    mov bl, [dir]
    mov [bdir], bl

    mov word [bstartAddr], BULLET
    call bprint

    jmp kbExit


kbExit:
    mov dx, 0x20
    mov al, 0x61
    out dx, al

    pop bx
    pop ax
    pop dx
    iret


print:      ;bx表示显存中的字符位置,bp表示当前内存中的坐标
    push bx
    push bp
    push ax

    ;将二维坐标转化为一维
    mov bx, [startY]
    mov ax, 320
    mul bx
    add ax, [startX]
    mov bx, ax

    add [limX], bx

    mov word [limY], 0

    mov bp, [startAddr]

printBeg:

    cmp bx, [limX]
    ja printChange

    mov al, byte [bp]

    cmp al, 1
    je print1

    mov byte [es:bx], 0
    jmp printAdd

print1:
    mov al, [colNum]
    mov byte [es:bx], al

printAdd:
    add bx, 1
    add bp, 1
    jmp printBeg

printChange:
    add bx, 304
    add word [limX], 320
    add word [limY], 1

    cmp word [limY], 15
    ja printExit

    jmp printBeg

printExit:
    pop  bx
    pop  bp
    pop  ax

    mov word [limX], 15
    mov word [limY], 0
    ret


botPrint:      ;bx表示显存中的字符位置,bp表示当前内存中的坐标
    push bx
    push bp
    push ax

    ;将二维坐标转化为一维
    mov bx, [botStartY]
    mov ax, 320
    mul bx
    add ax, [botStartX]
    mov bx, ax

    add [botLimX], bx

    mov word [botLimY], 0

    mov bp, [botStartAddr]

botPrintBeg:

    cmp bx, [botLimX]
    ja botPrintChange

    mov al, byte [bp]

    cmp al, 1
    je botPrint1

    mov byte [es:bx], 0
    jmp botPrintAdd

botPrint1:
    mov al, 78
    mov byte [es:bx], al

botPrintAdd:
    add bx, 1
    add bp, 1
    jmp botPrintBeg

botPrintChange:
    add bx, 288
    add word [botLimX], 320
    add word [botLimY], 1

    cmp word [botLimY], 15
    ja botPrintExit

    jmp botPrintBeg

botPrintExit:
    pop  bx
    pop  bp
    pop  ax

    mov word [botLimX], 31
    mov word [botLimY], 0
    ret

setColor:
    push dx
    push ax

    mov dx,0x3c8
    mov al,[colNum]
    out dx,al

    mov dx,0x3c9
    mov al,[colR]
    out dx,al

    mov al,[colG]
    out dx,al

    mov al,[colB]
    out dx,al

    pop ax
    pop dx

    ret

bprint:      ;bx表示显存中的字符位置,bp表示当前内存中的坐标
    push bx
    push bp
    push ax

    ;将二维坐标转化为一维
    mov bx, [bstartY]
    mov ax, 320
    mul bx
    add ax, [bstartX]
    mov bx, ax

    add [blimX], bx

    mov word [blimY], 0

    mov bp, [bstartAddr]

bprintBeg:

    cmp bx, [blimX]
    ja bprintChange

    mov al, byte [bp]

    cmp al, 1
    je bprint1

    mov byte [es:bx], 0
    jmp bprintAdd

bprint1:
    mov byte [es:bx], 4

bprintAdd:
    add bx, 1
    add bp, 1
    jmp bprintBeg

bprintChange:
    add bx, 316
    add word [blimX], 320
    add word [blimY], 1

    cmp word [blimY], 3
    ja bprintExit

    jmp bprintBeg

bprintExit:
    pop  bx
    pop  bp
    pop  ax

    mov word [blimX], 3
    mov word [blimY], 0
    ret

playSound:
    push ax
    push dx
    push bx

    inc word [soundCount]
    
soundBeg:

    cmp word [soundCount], 11
    ja soundAdd
    jmp soundExit

soundAdd:
    call closeBeep
    
    mov word[soundCount], 0
    add word [soundNow], 2
    mov bx, [soundNum]
    cmp [soundNow], bx
    jae soundClearNow
    jmp soundAddNow

soundClearNow:
    mov word [soundNow], 0

soundAddNow:
    mov bx, [soundNow]
    mov bx, [soundList + bx]
    mov [hz], bx

    call setHZ
    call openBeep

soundExit:
    
    mov al, 0x20
    mov dx, 0x20
    out dx, al

    pop bx
    pop ax
    pop dx
    iret



setHZ:

    push dx
    push ax
    push di

    mov dx, 12h
    mov ax, 34deh

    mov di, [hz]
    div di
    mov [hz], ax

    mov al, 10110110b
    out 43h, al
    mov ax, [hz]
    out 42h, al
    mov al, ah
    out 42h, al

    pop di
    pop ax
    pop dx

    ret

openBeep:
    push ax

    in al, 61h
    or al, 00000011b
    out 61h, al

    pop ax

    ret

closeBeep:
    push ax

    in al, 61h
    and al, 11111101b
    out 61h, al

    pop ax

    ret

sleep:
    push bx

    mov  bx, 0

sleepBeg:
    inc bx
    cmp bx, 128
    ja sleepBeg

    pop bx
    ret
printSoildRec:
    push cx 
    push ax

    mov cx,0
    mov ax,[sx]
    add ax,[width]
    mov [ex],ax
    mov ax,[sy]
    mov [ey],ax
    mov word [fg], 1

psrBeg:
    cmp cx,[hight]
    ja psrExit
    call printLine
    add word [ey],1
    add word [sy],1
    add cx,1
    jmp psrBeg

psrExit: 
    mov cx, [hight]
    add cx, 1
    sub word [ey], cx
    sub word [sy], cx
    pop ax
    pop cx
    ret

printLine:
    push bx
    push ax
    push bp

    mov bx,[sy]
    mov ax,320
    mul bx
    add ax,[sx]
    mov bx,ax

    mov bp,[ey]
    mov ax,320
    mul bp
    add ax,[ex]
    mov bp,ax

    mov al,[colNum]

plBeg:
    cmp bx,bp
    ja plExit
    mov byte [es:bx],al
    add bx, [fg]
    jmp plBeg

plExit:
    pop bp
    pop ax
    pop bx
    
    ret
setTimer:
    push ax
    mov al, 0x34
    out 0x43, al

    mov al, 0xff
    out 0x40, al

    mov al, 0x8f
    out 0x40, al
    pop ax
    ret
