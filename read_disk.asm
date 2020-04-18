readDisk:
	pusha
	mov ah,2 ;read mode
	mov al,6 ;sectors to read
	mov dl,0x80 ;reading from hard disk
	mov dh,0 ; select head
	mov ch,0 ;selects track
	mov cl,2 ; select sector
	mov bx,0x7c00 + 512
	int 0x13
	jc disk_error
	popa
	ret

disk_error:
	push DISK_ERROR_MSG
	call printf
	add sp,2
	jmp $

DISK_ERROR_MSG:
	db" error with disk",0x0a,0x0d,0






