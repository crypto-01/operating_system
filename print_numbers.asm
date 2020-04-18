print_digits:
	pusha
	mov bx,10
	xor cx,cx
	get_digit:
		xor dx,dx
		div bx
		push dx
		inc cx
		cmp ax,0
		jne get_digit
	print_char:
		cmp cx,0
		je char_end
		pop dx
		add dx,48
		mov al,dl
		mov ah,0x0e
		int 0x10
		dec cx
		jmp print_char
	char_end:

	popa
	ret