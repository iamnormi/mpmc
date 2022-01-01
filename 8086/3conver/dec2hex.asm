.MODEL SMALL
.STACK 100H
.DATA
D1 DW 55;
.CODE
MAIN PROC FAR
        MOV AX, @DATA   ; load the value stored in variable D1
        MOV DS,AX
        MOV AX,D1       ; convert the value to hexadecimal
        CALL PRINT      ; print the value
        MOV AH, 4CH
        INT 21H         ; interrupt to exit
    MAIN ENDP
    PRINT PROC          ; initialize count
        MOV CX, 0
        MOV DX, 0
    LABEL1:
        CMP AX,0        ; if ax is 0
        JE PRINT1
        MOV BX,16       ; initialize bx to 16
        DIV BX          ; divide it by 16 to convert it to hexadecimal
        PUSH DX         ; push it in the stack
        INC CX          ; increment the count
        XOR DX, DX      ; set dx to 0
        JMP LABEL1
        PRINT1:
        CMP CX, 0       ; check if count is greater than 0
        JE EXIT
        POP DX          ; pop the top of the stack
        CMP DX,9        ; compare the value with 9
        JLE CONTINUE    ; if value is greater than 9 then add 7 so that adding 48 it represents A
        ADD DX, 7
    CONTINUE:
        ADD DX, 48      ; add 48 so that it represents the ascii value of digits
        MOV AH, 02h
        INT 21h         ; interrupt to print a character
        DEC CX          ; decrease the count
        JMP PRINT1
    EXIT: RET
    PRINT ENDP
END MAIN
RET