ASSUME CS:CODE, DS:DATA                                     ; code and data segment initialization
DATA SEGMENT 
YY DW ?
MM DB ?
D DB ?
TDAY DW SUN,MON,TUE,WED,THU,FRI,SAT                         ; define the days of the week
SUN DB'SUNDAY,$'
MON DB'MONDAY,$'
TUE DB'TUESDAY,$'
WED DB'WEDNESDAY,$'
THU DB'THURSDAY,$'
FRI DB'FRIDAY,$'
SAT DB'SATURDAY,$'
TMON DW JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC     ; define the months of the year
JAN DB'JANUARY,$'
FEB DB'FEBRUARY,$'
MAR DB'MARCH,$'
APR DB'APRIL,$'
MAY DB 'MAY,$'
JUN DB 'JUNE,$'
JUL DB 'JULY,$'
AUG DB 'AUGUST,$'
SEP DB 'SEPTEMBER,$'
OCT DB 'OCTOBER,$'
NOV DB 'NOVEMBER,$'
DCMB DB 'DECEMBER,$'
DATA ENDS                                                   ; end of data segment
CODE SEGMENT
DISCHAR MACRO CHAR
PUSH AX                                                     ; save AX
PUSH DX                                                     ;save DX
MOV DL,CHAR                                                 ;display the character
MOV AH,02H                                                  ;move 02 to AH
INT 21H
POP DX                                                      ;restore DX
POP AX                                                      ;restore AX
ENDM                                                        ;end of main
START: MOV AX,DATA                                          ; initialize data segment
MOV DS,AX
CALL FAR PTR PDATE                                          ; display code
MOV AH,4CH                                                  ;exit to dos
INT 21H
PDATE PROC FAR                                              ; move 2a to AH
MOV AH,2AH
INT 21H
MOV [YY],CX                                                 ; save year
MOV [MM],DH                                                 ; save month
MOV [D],DL                                                  ; save day
MOV AH,0                                                    ;get a day of the week
ROL AX,1                                                    ; rotate right accumulator
MOV SI,OFFSET TDAY                                          ;address day table
ADD SI,AX                                                   ;add SI and AX
MOV DX, [SI]                                                ;address day of week
MOV AH,09H                                                  ; display day of week
INT 21H
MOV AL,[D]                                                  ; get day of month 
MOV AH,00H                                                  ; clear the contents of AH
AAM                                 
OR AH,AH                                                    ; convert to BCD
JZ DIGIT0                                                   ; if tens is 0
ADD AH,30H                                                  ; convert tens
DISCHAR AH                                                  ; display tens
DIGIT0: ADD AL,30H                                          ; convert units
DISCHAR AL                                                  ; display units
DISCHAR ' '                                                 ; leave space
MOV AL,[MM]                          			            ; get month
SUB AL,1 						                            ; sub the contents of al with 1
MOV AH,0						                            ; move 0 to AH
ROL AX,1                                                    ; rotate accumulator
MOV SI,OFFSET TMON                                          ; address month table
ADD SI,AX                                                   ;add SI and AX contents
MOV DX, [SI]                                                ; address month
MOV AH,09H                                                  ;display month
INT 21H
MOV AX,[YY]                                                 ; read year
CMP AX,07D0H                                                ; check for year 2000
JB DIS19                                                    ; if below year 2000
SUB AX,07D0H                                                ; scale for 00-99
DISCHAR '2'                                                 ; display 2
DISCHAR '0'                                                 ; display 0
JMP SKIP                                                    
DIS19: SUB AX,076CH                                         ; scale 1900-1999
DISCHAR '1'                                                 ; display 1
DISCHAR '9'                                                 ; display 9
SKIP: AAM                                                   ; convert to BCD
ADD AX,3030H                                                ; convert to ASCII
DISCHAR AH                                                  ; display tens
DISCHAR AL                                                  ; display units
RET                                                         ; return
PDATE ENDP
CODE ENDS
END START                                                   ; end of program
