;ref:yt-videoid=imrqQqeWH6M

MOV SI, 1301H   ; Set SI as Pointers for First input Matrix
MOV DI, 1401H   ; Set DI as Pointers for Second input Matrix
MOV BP, 1501H   ; Set BP as Pointers for Product Matrix
MOV CL, 03H     ; Set CL as count for element in a row
MOV CH, 03H     ; Set CH as count for element in column
MOV DH,CH       ;
REPEAT3:
    MOV BL,DH     ; Copy the column count in BL register
REPEAT2:
    MOV DL, 00H   ; Initialize sum as zero
    MOV CH, DH    ; Get the column count in DH
REPEAT1:
    MOV AL,[SI]   ; Get one element of the row in AL register
    MUL [DI]      ; Get the Product of row and column element in AL
    ADD DL,AL     ; ADD the Product to SUM
    INC SI        ; Increment the first input in matrix pointer
    ADD SI,03     ; Let DI pointer points to the next element in same column of 2nd Matrix
    DEC CH        ; Decrement the Column Count
JNZ REPEAT1     ; Repeat Multiplication and Addition untill DH count is zero
MOV [BP],DL     ; Store an element of product matrix in memory
INC BP          ; Increment the Product Matrix Pointer
SUB SI, 03H     ; Make SI to point to first element of the row
SUB DI, 09H
INC DI
DEC BL          ; Decrement Column Count
JNZ REPEAT2     ; Repeat Multiplication Addition of row in 1st Matrix with Column of 2nd Matrix
ADD SI, 03H     ; Let SI pointer to first element of 2nd Matrix
MOV DI, 1401H   ; Make DI Pointer points to first element of 2nd Matrix
DEC CL          ; Decrement of Row Count
JNZ REPEAT3     ; Repeat Multiplication and Additon of next row in 1st Matrix with all column of 2nt Matrix
HLT             ;Halt and Execution