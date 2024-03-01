.model small
.stack 256
;Գրել ծրագիր, որը կկատարի հետևյալ գործողությունները.
;AX = a * 5; BX =b * 15; SI = AX++; DI = BX--; CL = -4; DH = ( AX - BX ) % CL; DL =( AX - BX ) / CL;
;որտեղ a-ն և b-ն բայթային նշանով փոփոխականներ են, a = 18, b = -23;
.data
a db 18
b db -23
.code
main:   
	mov ax,@data
	mov ds,ax

	mov al,b
	cbw
	mov cx,15
	imul cx
	mov bx,ax

	mov al,a
	cbw
	mov cx,5
	imul cx
	
	mov si,ax
	inc si
	mov di,bx
	dex di

	mov cl,-4
	sub ax,bx
	imul cl
	mov dx,ax

	mov ax,si
	dec ax

	mov ah,4ch	
	mov al,0
	int 21h
end main