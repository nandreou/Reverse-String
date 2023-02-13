extern printf

section .data

msg db 10,"Hello World",10,0
msg_len equ $-msg-1
prin db "%i",10,0 

section .bss

section .text

global main

main:

push rbp
mov rbp, rsp

mov rax, 1
mov rsi, msg
mov rdi, 1
mov rdx, 12
syscall

xor rax, rax
xor rcx, rcx
xor r10, r10
xor rbx, rbx

mov rcx, msg_len

pushing:

mov al, [msg+r10] ;with registry needs cast mov al, byte [rbx+r10]
push rax
inc r10
dec rcx
cmp rcx, 1
jge pushing

xor rax, rax
xor rcx, rcx
xor r10, r10
xor rbx, rbx

mov rcx, msg_len

poping:

pop rax
mov [msg+r10], al
inc r10
dec rcx
cmp rcx, 1
jge poping

mov rax, 1
mov rsi, msg
mov rdi, 1
mov rdx, msg_len
syscall

xor rax, rax
xor rcx, rcx
xor r10, r10
xor rbx, rbx

mov rcx, msg_len

pushing_original:

mov al, [msg+r10] ;with registry needs cast mov al, byte [rbx+r10]
push rax
inc r10
dec rcx
cmp rcx, 1
jge pushing_original

xor rax, rax
xor rcx, rcx
xor r10, r10
xor rbx, rbx

mov rcx, msg_len

poping_original:

pop rax
mov [msg+r10], al
inc r10
dec rcx
cmp rcx, 1
jge poping_original

mov rax, 1
mov rsi, msg
mov rdi, 1
mov rdx, msg_len
syscall

exit:

mov rsp, rbp
pop rbp
ret
