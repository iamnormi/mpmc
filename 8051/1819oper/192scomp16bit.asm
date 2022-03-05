MOV dptr,#8000H     ;Initialise dptr with 8000
MOVX A,@dptr        ;Move content of dptr to A
MOV A,#89H          ;Move data to A
MOV R0,A            ;Move content of A to R0 register
MOV B,A             ;Move content of A to B
CPL A               ;Complement content of A
ADD A,#01           ;Add 1 to A
INC dptr            ;Increment dptr
MOVX @dptr,A        ;Move content of A to dptr
MOV R0,A            ;Move content of A to R0
MOV B,A             ;Move A to B
CPL A               ;Complement content of A
ADD A ,#01          ;Add 1 to A
INC dptr            ;Increment dptr
MOVX @dptr,A        ;Store the result
HERE: SJMP HERE     ;Stop the program