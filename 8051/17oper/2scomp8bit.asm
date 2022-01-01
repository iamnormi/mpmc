MOV dptr,#8000H     ;Initialise dptr with 8000
MOVX A,@dptr        ;Move value of dptr to A
MOV A,#05           ;Move data to A
MOV R0,A            ;Move A to R0 register
MOV B,A             ;Move content of A to B
CPL A               ;Add 1 to A ;Complement content of A
ADD A,#01           ;Add 1 to accumulator
INC dptr            ;Increment dptr
MOVX @dptr,A        ;Store the result
HERE:SJMP HERE      ;Stop the program