biosenable:
	sti
	push bp
	mov bp,sp
	pusha
	mov ax,0x2401
	int 0x15
	popa
	mov sp,bp
	pop bp
	cli
	ret

keyboardalineenable:
	push bp
	mov bp,sp
	pusha
	cli
	call keyboardsendcomm
	mov al,0xad ;disable keyboard
	out 0x64,al
	

	call keyboardsendcomm
	mov al, 0xd0  ;read from input
	out 0x64,al

	call keyboarddata
	in al,0x60 ;read from keyboard
	push eax

	call keyboardsendcomm
	mov al,0xd1 ;write to output command
	out 0x64,al

	call keyboardsendcomm
	pop eax ;write input back with bit 2 set
	or al,2
	out 0x60,al

	call keyboardsendcomm
	mov al,0xae ;enable keyboard
	out 0x64,al

	call keyboardsendcomm
	popa
	mov sp,bp
	pop bp
	ret
	

keyboardsendcomm:
	push bp
	mov bp, sp
	pusha
	comm_loop:
	in al,0x64
	test al,2
	jnz comm_loop
	popa
	mov sp,bp
	pop bp
	ret

keyboarddata:
	push bp
	mov bp,sp
	pusha
	data_loop:
	in al,0x64
	test al,1
	jz data_loop
	popa
	mov sp,bp
	pop bp
	ret


