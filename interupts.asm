;16 bit lower base of handler for interupt
;16 bit kernal selector
;8 bit but always zero
;8 bit flags of p,dpl,always 00110 14 in hex which is e




section .data
	Msg_interupt:
		db "Interupt recieved: ",0;

section .bss
	interupt_table:resb 2048-1
	gdt_ptr:
		resw 1 ;limit  size if idt
		resd 1 ;address of first element in udt


section .text

init_idt:
	cli
	call clear_interupt_table
	mov word [gdt_ptr],2048
	mov dword [gdt_ptr + 2],interupt_table
	mov eax,isr0
	mov ebx,0x08
	mov ecx,0
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr1
	mov ebx,0x08
	mov ecx,1
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr2
	mov ebx,0x08
	mov ecx,2
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr3
	mov ebx,0x08
	mov ecx,3
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr4
	mov ebx,0x08
	mov ecx,4
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr5
	mov ebx,0x08
	mov ecx,5
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr6
	mov ebx,0x08
	mov ecx,6
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr7
	mov ebx,0x08
	mov ecx,7
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr8
	mov ebx,0x08
	mov ecx,8
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr9
	mov ebx,0x08
	mov ecx,9
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr10
	mov ebx,0x08
	mov ecx,10
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr11
	mov ebx,0x08
	mov ecx,11
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr12
	mov ebx,0x08
	mov ecx,12
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr13
	mov ebx,0x08
	mov ecx,13
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr14
	mov ebx,0x08
	mov ecx,14
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr15
	mov ebx,0x08
	mov ecx,15
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr16
	mov ebx,0x08
	mov ecx,16
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr17
	mov ebx,0x08
	mov ecx,17
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr18
	mov ebx,0x08
	mov ecx,18
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr19
	mov ebx,0x08
	mov ecx,19
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr20
	mov ebx,0x08
	mov ecx,20
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr21
	mov ebx,0x08
	mov ecx,21
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr22
	mov ebx,0x08
	mov ecx,22
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr23
	mov ebx,0x08
	mov ecx,23
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr24
	mov ebx,0x08
	mov ecx,24
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr25
	mov ebx,0x08
	mov ecx,25
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr26
	mov ebx,0x08
	mov ecx,26
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr27
	mov ebx,0x08
	mov ecx,27
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr28
	mov ebx,0x08
	mov ecx,28
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr29
	mov ebx,0x08
	mov ecx,29
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr30
	mov ebx,0x08
	mov ecx,30
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr31
	mov ebx,0x08
	mov ecx,31
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr32
	mov ebx,0x08
	mov ecx,32
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr33
	mov ebx,0x08
	mov ecx,33
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr34
	mov ebx,0x08
	mov ecx,34
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr35
	mov ebx,0x08
	mov ecx,35
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr36
	mov ebx,0x08
	mov ecx,36
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr37
	mov ebx,0x08
	mov ecx,37
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr38
	mov ebx,0x08
	mov ecx,38
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr39
	mov ebx,0x08
	mov ecx,39
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr40
	mov ebx,0x08
	mov ecx,40
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr41
	mov ebx,0x08
	mov ecx,41
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr42
	mov ebx,0x08
	mov ecx,42
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr43
	mov ebx,0x08
	mov ecx,43
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr44
	mov ebx,0x08
	mov ecx,44
	mov edx,0x8e
	call idt_set_gate
	
	mov eax,isr45
	mov ebx,0x08
	mov ecx,45
	mov edx,0x8e
	call idt_set_gate


	mov eax,isr46
	mov ebx,0x08
	mov ecx,46
	mov edx,0x8e
	call idt_set_gate

	mov eax,isr47
	mov ebx,0x08
	mov ecx,47
	mov edx,0x8e
	call idt_set_gate
	call init_timer

	lidt [gdt_ptr]
	call mapPIC
	ret



clear_interupt_table:
	pushad
	xor ecx,ecx
	xor edx,edx
	clear_interupt_loop:
		cmp ecx,512
		je clear_interupt_end
		mov [interupt_table+ecx],edx
		add ecx,4
		jmp clear_interupt_loop
	clear_interupt_end:
	popad
	ret

;ax contain num of gate byte
;ebx contain 32 byte address of handler
;cx contain 16bit address of code descriptoe
;dx low contain flags of a byte
idt_set_gate:
	push ebp
	mov ebp,esp
	push eax
	and eax,0xffff
	mov word [interupt_table + ecx *8],ax ;low bit of interupt handler
	mov word [interupt_table+ ecx *8 +2],bx ;code selector
	mov byte [interupt_table + ecx * 8 + 4],0 ;always zero
	mov [interupt_table + ecx* 8 + 5],dl; flags
	pop eax
	shr eax,16
	mov [interupt_table + ecx * 8 + 6],ax;high bit of interupt handler
	pop ebp
	ret

;0
isr0: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 0 ;interupt number
	jmp isr_common_handler

;1
isr1: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 1 ;interupt number
	jmp isr_common_handler

;2
isr2: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 2 ;interupt number
	jmp isr_common_handler

;3
isr3: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 3 ;interupt number
	jmp isr_common_handler

;4
isr4: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 4 ;interupt number
	jmp isr_common_handler

;5
isr5: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 5 ;interupt number
	jmp isr_common_handler

;6
isr6: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 6 ;interupt number
	jmp isr_common_handler

;7
isr7: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 7 ;interupt number
	jmp isr_common_handler


;8
isr8: ;interupt service route
	cli
	push 0 ; error code
	push 8 ;interupt number
	;iret
	jmp isr_common_handler

;9
isr9: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 9 ;interupt number
	jmp isr_common_handler

;10
isr10: ;interupt service route
	cli
	;push byte 0 ; error code
	push byte 10 ;interupt number
	jmp isr_common_handler

;11
isr11: ;interupt service route
	cli
	;push byte 0 ; error code
	push byte 11 ;interupt number
	jmp isr_common_handler

;12
isr12: ;interupt service route
	cli
	;push byte 0 ; error code
	push byte 12 ;interupt number
	jmp isr_common_handler

;13
isr13: ;interupt service route
	cli
	;push byte 0 ; error code
	push byte 13 ;interupt number
	jmp isr_common_handler

;14
isr14: ;interupt service route
	cli
	;push byte 0 ; error code
	push byte 14 ;interupt number
	jmp isr_common_handler

;15
isr15: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 15 ;interupt number
	jmp isr_common_handler


;16
isr16: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 16 ;interupt number
	jmp isr_common_handler

;17
isr17: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 17 ;interupt number
	jmp isr_common_handler

;18
isr18: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 18 ;interupt number
	jmp isr_common_handler

;19
isr19: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 19 ;interupt number
	jmp isr_common_handler

;20
isr20: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 20 ;interupt number
	jmp isr_common_handler

;21
isr21: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 21 ;interupt number
	jmp isr_common_handler

;22
isr22: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 22 ;interupt number
	jmp isr_common_handler

;23
isr23: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 23 ;interupt number
	jmp isr_common_handler


;24
isr24: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 24 ;interupt number
	jmp isr_common_handler

;25
isr25: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 25 ;interupt number
	jmp isr_common_handler

;26
isr26: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 26 ;interupt number
	jmp isr_common_handler

;27
isr27: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 27 ;interupt number
	jmp isr_common_handler

;28
isr28: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 28 ;interupt number
	jmp isr_common_handler

;29
isr29: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 29;interupt number
	jmp isr_common_handler

;30
isr30: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 30 ;interupt number
	jmp isr_common_handler

;31
isr31: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 31 ;interupt number
	jmp isr_common_handler


;irg for hardware interupts

;32
isr32: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 32;interupt number
	jmp isr_common_handler

;33
isr33: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 33 ;interupt number
	jmp isr_common_handler

;34
isr34: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 34 ;interupt number
	jmp isr_common_handler




;35
isr35: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 35;interupt number
	jmp isr_common_handler

;36
isr36: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 37 ;interupt number
	jmp isr_common_handler

;37
isr37: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 37 ;interupt number
	jmp isr_common_handler


;38
isr38: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 38;interupt number
	jmp isr_common_handler

;39
isr39: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 39 ;interupt number
	jmp isr_common_handler

;40
isr40: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 40 ;interupt number
	jmp isr_common_handler

;41
isr41: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 41;interupt number
	jmp isr_common_handler

;42
isr42: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 42;interupt number
	jmp isr_common_handler

;43
isr43: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 43 ;interupt number
	jmp isr_common_handler

;44
isr44: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 44;interupt number
	jmp isr_common_handler

;45
isr45: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 45 ;interupt number
	jmp isr_common_handler

;46
isr46: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 46 ;interupt number
	jmp isr_common_handler


;47
isr47: ;interupt service route
	cli
	push byte 0 ; error code
	push byte 47 ;interupt number
	jmp isr_common_handler



isr_common_handler:
	;push ebp
	mov ebp,esp
	pushad
	mov ax,ds
	push eax
	mov ax,0x10
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
	call isr_handler
	pop eax
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
	popad
	mov esp,ebp
	;pop ebp
	cmp byte [ebp],31
	jb skipEOF
	cmp byte [ebp],33
	jne sendEOF
	call keyBoard
	sendEOF:
		mov al,0x20
		out 0x20,al
	skipEOF:

	add esp,8 ;remove error code and isr number
	sti
	iret

isr_handler:
	cmp byte [ebp],32
	jne skip_timer
	call timer_handler
	skip_timer:
	ret

keyBoard:
	push eax
	in al,0x60
	pop eax
	ret



%include "./pic.asm"
%include "./pit.asm"
















