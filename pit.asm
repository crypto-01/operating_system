; COUNT = input hz / frequency
section .data:
	 _tick :dd 0

init_timer:
	push edx
	push eax
	mov	dx, 1193180 / 100	; 100hz, or 10 milliseconds
	; FIRST send the command word to the PIT. Sets binary counting,
	; Mode 3, Read or Load LSB first then MSB, Channel 0
 
	mov	al, 110110b
	out	0x43, al
 
	; Now we can write to channel 0. Because we set the "Load LSB first then MSB" bit, that is
	; the way we send it
 
	mov	ax, dx
	out	0x40, al	;LSB
	xchg	ah, al
	out	0x40, al	;MSB
	pop eax
	pop edx
	ret

timer_handler:
	push eax
	mov eax,[_tick]
	or eax,eax
	jz timer_done
	dec dword [_tick]

	timer_done:
	pop eax
	ret

sleep:
	push ebp
	mov ebp,esp
	push eax
	push edx
	mov eax,[ebp+8]
	;div eax
	mov [_tick],eax
	sleep_loop:
	cli
	mov eax,[_tick]
	or eax, eax
	jz sleep_done
	sti
	nop 
	nop
	nop
	nop
	jmp sleep_loop

	sleep_done:
	sti
	pop edx
	pop eax
	pop ebp
	ret


