MOV AL,#15  ; load the value of AL
MOV BL,#08  ; load the value of BL
SUB AL,BL   ; AL=AL-BL
DAA         ; adjust the decimal after subtraction
RET