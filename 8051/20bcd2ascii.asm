MOV dptr,#8000H     ;Initialise dptr with 8000
MOVX A,@dptr        ;Move dptr to A
MOV A,#29H          ;Move data to A
MOV B,A             ;Move content of A to B
ANL A,#0F0H         ; Perform AND operation ADD
A,#30H              ;Add A with 30
MOV R0,A            ;Move content of A with R0
MOV A,B             ;Move content of B to A
ANL A,#0F0H         ;AND operation is performed
SWAP A              ;Swap contents of A
ADD A,#30H          ;Add A with 30
MOV R1,A            ;Move content of A to R1
MOVX @dptr,A        ;Store the result
HERE: SJMP HERE     ;Stop the program