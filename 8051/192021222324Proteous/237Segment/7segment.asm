ORG 00H
START:MOV R1,#10            ;Load R1 with immediate data 10(counter)
MOV DPTR,#400H              ;Move immediate data 400H to DPTR
BACK:CLR A                  ;Clear accumulator
MOVC A,@A+DPTR              ;Move a byte of data located in programcode(ROM) into accumulator
MOV P2,A                    ;Move accumulator content to port A
ACALL DELAY                 ;Call delay routine
INC DPTR                    ;Increment the content of DPTR
DJNZ R1,BACK                ;Jump to label back until counter R1 reaches zero
SJMP START
ORG 400H
DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH      ;Here values of LEDs to be glown for digits 0-9
DELAY:MOV R2,#08H           ;Delay routine  
UP2:MOV R4,#0FFH
UP1:MOV R3,#0FFH
HERE:DJNZ R3,HERE
DJNZ R4,UP1
RET 
END