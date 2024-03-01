.model small
.stack 256
;Գրել ծրագիր, որը կկատարի հետևյալ գործողությունները.
;AX = a * 5; BX =b * 15; CL = 4; DL = ( AX + BX ) / CL; DH = ( AX + BX ) % CL; DH--; DL++;;
;որտեղ a-ն և b-ն բայթային առանց նշանի փոփոխականներ են, a = 18, b = 3;
.data
a db 18
b db 3
.code
main:   
	mov ax,@data
	mov ds,ax

	mov al,a
	cbw
	mov si,5
	mul si
	mov cx,ax
	mov al,b
	cbw
	mov si,15
	mul si
	mov bx,ax
	mov ax,cx
	mov cl,4
	add ax,bx
	mov di,ax
	div cl
	mov dl,al
	mov ax,di
	div cl
	mov dh,ah
	dec dl
	inc dl

	mov ah,4ch	
	mov al,0
	int 21h
end main