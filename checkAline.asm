a20line:
	push bp
	mov bp,sp
	;pushf
	cli
	push ds
	push es
	push di
	push si

	xor ax,ax
	mov es,ax
	mov di,0x0500

	mov ax,0xffff
	mov ds,ax
	mov si,0x0510
	mov al,byte [es:di]
	push ax
	mov  al, byte [ds:si]
	push ax
	mov byte [es:di],0x00
	mov byte [ds:si],0xff
	cmp byte [es:di],0xff
	pop ax
	mov byte [ds:si],al

	pop ax
	mov [es:di],al
	mov ax,0
	je a20lineend
	mov ax,1
a20lineend:
	pop si
	pop di
	pop es
	pop ds
	;popf
	pop bp
	ret



	

