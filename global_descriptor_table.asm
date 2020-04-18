gdt_null:
	dd 0
	dd 0

gdt_code:
	dw 0xffff  		;limit low
	dw 0			;base low
	db 0			;base middle
	db 10011010b 	;access
	db 11001111b    ;granularity
	db 0			;base high

gdt_data:
	dw 0FFFFh 		;limit low
	dw 0			;base low
	db 0			;base middle
	db 10010010b 	;access
	db 11001111b    ;granularity
	db 0			;base high

gdt_end:

gdt_pointer:
	dw gdt_end - gdt_null - 1
	dd gdt_null

