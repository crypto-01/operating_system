;vga cols is 80
;vga rows is 25


print_str:
	push ebp
	mov ebp,esp
	pushad
	mov esi,[ebp+8]
	xor ecx,ecx
	write_char:
		mov al,[esi]
		cmp al,0
		je print_str_end
		mov eax,[cursor_loc_x]
		mov ebx,80
		cmp eax,ebx
		jb skip_new_line
		call new_line
		skip_new_line:
		mov eax,[cursor_loc_y]
		cmp eax,25
		jb skip_scroll
		call scroll
		skip_scroll:

		mov eax,[cursor_loc_y]
		mov ebx,vga_col
		mul ebx
		add eax,[cursor_loc_x]
		mov ebx,2
		mul ebx
		mov dl,[esi]
		mov dh,text_color
		mov [VID_MEM + eax],dx
		add dword [cursor_loc_x ],1
		inc esi
		add ecx,2
		jmp write_char

print_str_end:
	call update_cursor
	popad
	mov esp,ebp
	pop ebp
	ret

print_char:
	push ebp
	mov ebp,esp
	push ebx
	push eax
	mov bl,[ebp + 8]
	mov bh,text_color
	cmp dword [cursor_loc_x],80
	jb skip_new_line_char
	call new_line
	skip_new_line_char:
	mov eax,[cursor_loc_y]
	cmp eax,25
	jb skip_scroll_char
	call scroll
	skip_scroll_char:
	cmp bl,0
	jne new_line_char2
	call new_line
	new_line_char2:

	mov eax,[cursor_loc_y]
	mov edx,vga_col
	mul edx
	add eax,[cursor_loc_x]
	mov edx,2
	mul edx
	mov bh,text_color
	mov [VID_MEM + eax],bx
	add dword [cursor_loc_x ],1

	pop eax
	pop ebx
	mov esp,ebp
	pop ebp
	call update_cursor

	ret


new_line:
	mov dword [cursor_loc_x],-1
	add dword [cursor_loc_y],1
	ret
scroll:
	pushad
	xor ecx,ecx
	scroll_line_up:
		cmp ecx, vga_row * vga_col * 2
		je scroll_line_up_end
		mov dx,[VID_MEM + ecx + vga_col*2]
		mov [VID_MEM + ecx ],dx
		add ecx,2
		jmp scroll_line_up
	scroll_line_up_end:
	mov ecx,24*80
	clear_last_line:
		cmp ecx,25*80
		je scroll_end
		mov dh,text_color
		mov dl,' '
		mov [VID_MEM + ecx*2],dx
		inc ecx
		jmp clear_last_line
	scroll_end:
		popad
		mov dword [cursor_loc_y],24
		mov dword [cursor_loc_x],0
		ret








clear_screen:
	push ebp
	mov ebp,esp
	push ecx
	push eax
	xor ecx,ecx
	mov ah,screen_color
	mov al," "
	mov dword [cursor_loc_x],0
	mov dword [cursor_loc_y],0
	clear_screen_loop:
		cmp ecx,vga_row * vga_col
		je clear_screen_end
		mov [VID_MEM + (ecx * 2)],ax
		inc ecx
		jmp clear_screen_loop
	clear_screen_end:
		pop eax
		pop ecx
		mov esp,ebp
		pop ebp
		ret

update_cursor:
	pushad
	mov eax,[cursor_loc_y]
	mov ebx,vga_col
	mul ebx
	add eax,[cursor_loc_x]
	mov ebx,eax
	;sets low byte
	mov al,0x0f;cursor location low byte
	mov dx,0x03d4 ;write to crt index register
	out dx,al

	mov dx,0x03d5
	mov al,bl
	out dx,al

	;sets high byte
	mov al,0x0e;cursor location high byte
	mov dx,0x03d4 ;write to crt index register
	out dx,al

	mov dx,0x03d5
	mov al,bh
	out dx,al

	popad
	ret

disable_cursor:
	pushf
	push eax
	push edx
	mov dx,0x3d4
	mov al,0xa  ;low curser shape
	out dx,al

	inc dx
	mov al,0x20 ;bit 5 disable
	out dx,al

	pop edx
	pop eax
	popf
	ret

print_digits:
	pushad
	mov ebx,10
	xor ecx,ecx
	get_digit:
		xor edx,edx
		div ebx
		push edx
		inc ecx
		cmp eax,0
		jne get_digit
	print_digit:
		cmp ecx,0
		je print_digit_end
		pop edx
		mov ebx,48
		add edx,ebx
		;mov dh,0x0f
		;mov [VID_MEM],dx
		push edx
		call print_char
		pop edx
		dec ecx
		jmp print_digit
	print_digit_end:
	popad
	ret



cursor_loc_x:dd 0
cursor_loc_y:dd 0
vga_row equ 25
vga_col equ 80
text_color equ 0x0f
screen_color equ 0x0f
