.model small
.stack 100h
.data
    text db 'Hello world'
    count dw 13
    search db 'x'
    found db 'String Found$'
    notfound db 'String NOT Found$'
.code
begin: mov ax,@data
       mov ds,ax
       mov es,ax
       mov cx,count
       
       mov di,offset text
       mov al,search
       repne scasb
       
       jz yes
       
       mov dx,offset notfound
       mov ah,09
       int 21h
       jmp over
       
yes:   mov dx,offset found
       mov ah,09
       int 21h
over:  mov ah,4ch
       int 21h
       end begin 