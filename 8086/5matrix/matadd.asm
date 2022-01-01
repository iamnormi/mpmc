;ref:yt-videoid=B_BZdEPulFc

MOV BX, 1300H   ; Load the Base Address 1st input Matrix in BX
MOV BP, 1400H   ; Load the Base Address 2nd input Matrix in BP
MOV SI, 0001H   ; Initialize pointer for element of matrix
MOV DI, 1501H   ; Set DI register as pointer for sum matrix
MOV  CL, 09H    ; Set CL as count for element in Matrix
REPEAT:
    MOV AL,[BX+SI]  ; Get the element of 1st Matrix in AL
    ADD AL,[BP+SI]  ; Add Corresponding element of 2nd Matrix to AL
    MOV [DI],AL     ; Store the Sum of element in Memory
    INC SI          ; Increment the Pointers
    INC DI
LOOP REPEART        ; Repeat the Addition untill count is zero
HLT                 ; Halt the Program exexcutiona