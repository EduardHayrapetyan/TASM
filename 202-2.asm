; K=3*c^8+ (4*a^3 – 3*b^4) / (2*c^6 + 5*a*b),  
; a=6, b=-3, c=2, db, signed

.model small
.stack 256 
.data 
a db 6
b db -3
c db 2
k dw ?

.code 
main:	mov ax,@data
	mov ds,ax
; 3*c^8 
	mov al,c
	imul al		; al*al->ax =>ax=c^2
	imul ax		; ax*ax->(dx:ax) =>(dx:ax)=c^4
	imul ax		; ax*ax->(dx:ax) =>dx:ax=c^8
	mov bx,3
	imul bx		; ax*bx->(dx:ax) => dx:ax=3*c^8
	mov si,ax	; si=3*c^8

;di=(2*c^6 + 5*a*b)
	mov al,c
	cbw		; al->ax =>ax=c
	mov bx,ax	; bx=ax=c
	imul al		; ax=c^2
	imul bx		; dx:ax=ax*bx=c*c^2=c^3
	imul ax		; dx:ax=(c^3)^2=c^6
	mov bx,2
	imul bx		; dx:ax=2*c^6
	mov di,ax
	mov al,a
	imul byte ptr b	; ax=a*b
	mov bx,5
	imul bx		; dx:ax=5*a*b
	add di,ax

; ax=(4*a^3 – 3*b^4) 
	mov al,b
	imul al		; ax=b^2
	imul ax		; dx:ax=b^4
	mov bx,3
	imul bx		; dx:ax=3*b^4
	mov cx,ax
	mov al,a
	cbw		; al->ax =>ax=a
	mov bx,ax	; bx=a	
	imul ax		; dx:ax=a^2
	imul bx		; dx:ax=bx*ax=a*a^2 = a^3
	mov bx,4
	imul bx		; dx:ax=4*a^3
	sub ax,cx	; ax=(4*a^3 – 3*b^4) 

; (4*a^3 – 3*b^4) / (2*c^6 + 5*a*b)

	cwd		; ax->dx:ax
	idiv di		; (dx:ax):di ->ax=/, dx=%
	mov k,ax

	mov ah,4ch
	mov al,0
	int 21h
end main