global _start
section .text
_start:
;call function main
	call main
;exit program 
	mov eax, 1
	xor ebx, ebx
	int 0x80
;--------------
;--------------
;--------------
;--------------
;Мы делаем типа как в СИ Это чисто предположение -
;как работает программа на языке СИ
main:
	push ebp
	mov ebp, esp
	sub esp, 15
	
	mov [ebp-14], byte "H"
	mov [ebp-13], byte "e"
	mov [ebp-12], byte "l"
	mov [ebp-11], byte "l"
	mov [ebp-10], byte "o"
	mov [ebp-9], byte " "
	mov [ebp-8], byte "W"
	mov [ebp-7], byte "o"
	mov [ebp-6], byte "r"
	mov [ebp-5], byte "l"
	mov [ebp-4], byte "d"
	mov [ebp-3], byte "!"
	mov [ebp-2], byte 0xa
	mov [ebp-1], byte 0x0

	lea eax, [ebp-0xe]

	push eax
	call length
	inc esp

	mov edx, eax
	mov eax, 4
	mov ebx, 1
	lea ecx, [ebp-0xe]
	int 0x80 
	mov esp, ebp
	pop ebp
	ret
length:
	push ebp
	mov ebp, esp

	mov ecx, 0
	mov edx, [esp+8]
lp:
	movzx eax, byte [edx+ecx]
	cmp eax,  0
	je elp
	inc ecx
	jmp lp
elp:
	mov eax, ecx
	mov esp, ebp
	pop ebp
	ret
