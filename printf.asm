printf:
	push bp
	mov bp,sp
	pusha
	mov si,[bp + 4]
	get_char:
		mov al,[si]
		cmp al,0
		je end_char
		mov ah,0x0e
		int 0x10
		inc si
		jmp get_char
	end_char:
		popa
		mov sp,bp
		pop bp
		ret