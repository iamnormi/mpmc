;String Copy - 8086
.model small
.stack 100h
.data
    text1 db 'Hello Welcome'
    text2 db 13 dup(?)
    count dw 13
.code
begin:  mov ax,@data
        mov ds,ax
        mov es,ax
        
        mov si,offset text1
        mov di,offset text2
        mov cx,count
        cld
        
        rep movsb
        
        mov ah,4ch
        int 21h
        end begin