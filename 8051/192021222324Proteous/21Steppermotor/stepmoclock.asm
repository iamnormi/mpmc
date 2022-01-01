ORG 00H
MAIN:
MOV A,#0CH                  ;Move 0C to A register
MOV P2,A                    ;Content of register A moved to port 2
ACALL DELAY                 ;Call delay routine
MOV A,#06H                  ;Move ‘06’ to A register
MOV P2,A                    ;Content of register A moved to port 2
ACALL DELAY                 ;Call delay routine
MOV A,#03H                  ;Move ‘03 ‘ to A register
MOV P2,A                    ;Content of register A moved to port 2
ACALL DELAY                 ;Call delay routine
MOV A,#09H                  ;Move ‘09’ to A register
MOV P2,A                    ;Content of register A is moved to port 2
ACALL DELAY                 ;Call delay routine
SJMP MAIN
DELAY:
MOV R3,08H                  ;Delay routine
UP2:MOV R2,#0FFH
UP1:MOV R1,#0FFH
HERE:DJNZ R1,HERE
DJNZ R2,UP1
DJNZ R3,UP2
RET
END

