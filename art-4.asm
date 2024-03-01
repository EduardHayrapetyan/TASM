.model small
.stack 256
.data
a db 142
b db 32
c db ?
d dw ?
.code 
main:
	mov ax,@data
	mov ds,ax

	mov dh,29
	mov al,a
	add al,25
	mov c,al

	mov al,c
	div dh
	mov dl,al
	mov al,b
	mov si,145
	mul si
	mov d,ax
	mov al,c
	mov ah,0;cbw
	sub ax,12
	mov di,ax
;DH = 29; C = a + 25; DL = C / DH; D = b * 145; DI = C -12; BX = D++ / ( DI + 7 ); CX = D++ % ( DI + 7 );BL--; CL++;
	mov ax,d
	inc ax
	mov cx,di
	add cx,7
	div cx
	
	mov cx,dx
	dec bl
	inc cl

	mov ah,4ch
	mov al,0
	int 21h
end main