ORG 00H
MAIN:MOV A,#00h         ;Move ‘00’ to A register.
MOV P1,A                ;Content of register A is moved to Port1
ACALL DELAY             ;Call delay routine
CPL A                   ;Complement the contents of register A and store it in AMOV P1,A ;Move the contents of A to Port1
ACALL DELAY             ;Call delay routine
SJMP MAIN
DELAY: MOV R2,#0FFH     ;Delay routine
UP1: MOV R3,#0FFH
HERE: DJNZ R2,UP1
RET
END