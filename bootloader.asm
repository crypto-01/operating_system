[org 0x7c00]
[BITS 16]


section .text
global start

start:
	cli 
	jmp 0x0000:alignSegments
alignSegments:  ;allighn segmenta
	xor ax,ax
	mov ss,ax
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
	mov sp,start
	cld
	sti
	int 0x13 ;resets disk
	;mov ah,0
	;mov al,13 ;enter video mode
	;int 0x10
	


call readDisk ;load  kernal
call a20line ;check if a 20 line is enable
cmp  ax,1
je enter_ptm
call biosenable ;try to enable using bios
call a20line
cmp ax,1
je enter_ptm
call keyboardalineenable ; use the keyboard
call a20line
cmp ax,1
je enter_ptm
push MSG_a20
call printf
add sp,2


enter_ptm:
	cli
	;push eax
	mov eax,cr0
	or eax,1
	mov cr0,eax
	;pop eax
	lgdt [gdt_pointer] ;load gdt tablw
	jmp 08h:0x7c00+512 ; jump to location of kernal


%include "./printf.asm"
%include "./checkAline.asm"
%include "./read_disk.asm"
%include  "./global_descriptor_table.asm"
%include "./enablea20.asm"

MSG_a20:
	db "failed to initializze  a20 line",0

times 510 -($-$$) db 0
dw 0xaa55
