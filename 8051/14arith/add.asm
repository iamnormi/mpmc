MOV A,#20H          ;Move 1st data to accumulator
MOV dptr,#4200H     ;Load the address in dptr
MOV B,#54H          ;Move 2nd data to accumulator
ADD A,B             ;Add both data
MOVX @dptr,A        ;Store the result in memory
HERE: SJMP HERE     ;Stop the program