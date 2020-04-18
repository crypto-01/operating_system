[org 0x7c00 + 512]
[BITS 32]
global init_ptm


section .data
	VID_MEM equ 0xb8000
	MSG_KERNEL db"welcome to the kernal my friend testing everything i can test to see if it works with all lines now testing for double or tripple lines if it all is being displey now lets do more than two lines so 3",0
	msg_len equ $-MSG_KERNEL
	clock:
		dd 0 ;hour
		dd 0 ;second
	

section .bss
	heap:
		resb 4096
	stack:

section .text

	init_ptm:
		mov eax,0x10
		mov ds,ax
		mov ss,ax
		mov es,ax
		mov fs,ax
		mov gs,ax
		mov eax,stack
		mov esp,eax
		mov ebp,eax

	

	kernal_main:
	call clear_screen
	call update_cursor
	call init_idt
	int 0x1
	int 0x3
	sti
	;mov eax,3
	;mov ebx,0
	;div ebx
	;call clear_screen
	;mov dword[cursor_loc_x],0
	;mov dword[cursor_loc_y],23
	;push MSG_KERNEL
	;call print_str	
	;push MSG_KERNEL
	;call print_str	
	push 100
	kernal_main_loop:
		call sleep
		add dword [clock + 4],1
		;xor eax,eax
		mov eax,[clock ]
		call print_digits
		push byte ':'
		call print_char
		mov eax,[clock + 4 ]
		call print_digits
		push byte 0
		call print_char
		add esp,8
		cmp dword [clock +4],60
		jb update_clock_end
		update_clock:
			mov dword [clock + 4],0
			add dword [clock],1
			cmp dword [clock],60
			jne update_clock_end
			mov dword [clock + 4],0
			mov dword [clock ],0
		update_clock_end:

	jmp kernal_main_loop


	




%include "./vga_text_mode13.asm"
%include "./interupts.asm"
;%include "./pic.asm"

	