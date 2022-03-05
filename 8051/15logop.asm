MOV R1,#05          ;Move 1st data in R1 register
MOV R0,#04          ;Move 2nd data in R0 register
MOV dptr,#4150      ;Load address in data pointer
MOV A,R1            ;Move content of R1 to A
ANL A,R0            ;Perform AND R0 with accumulator
MOVX @dptr,A        ;Store the result
INC dptr            ;Increment dptr
MOV A,R1            ;Move content of R1 to A
ORL A,R0            ;Perform OR R0 with accumulator
MOVX @dptr,A        ;Store the result
INC dptr            ;Increment dptr
MOV A,R1            ;Move content of R1 to A
XRL A,R0            ;Perform XOR R0 with accumulator
MOVX @dptr,A        ;Store result in memory
HERE:SJMP HERE      ;Stop the program