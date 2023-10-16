        global main

        extern exit
        extern alt_sum, lin_comb, hadarmard_prod, read_64, write_64

        section .text

main:
        push rbp

; INPUT - r1 \n s1 \n s2 \n s3 \n s4 \n
; Matrices are 0-indiced !!

        call read_64
        mov [r1], rax

        call read_64
        mov [s1], rax
        call read_64
        mov [s2], rax
        call read_64
        mov [s3], rax
        call read_64
        mov [s4], rax

        mov rax, [r1]                  ; rax is for column dimension
        mov rcx, [r1]                  ; rcx is for row dimension

; ; FOR MATRIX 1
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

        mov rcx, [r1]                   ; rcx is for row dimension
        mov rax, [r1]                   ; rax is for column dimension

; ; FOR MATRIX 2
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

        mov rcx, [r1]                   ; rcx is for row dimension
        mov rax, [r1]                   ; rax is for column dimension

; ; FOR MATRIX 3
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

        mov rcx, [r1]                   ; rcx is for row dimension
        mov rax, [r1]                   ; rax is for column dimension

; ; FOR MATRIX 4
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

        mov rcx, [r1]                   ; rcx is for row dimension
        mov rax, [r1]                   ; rax is for column dimension

; ; FOR INTERIM MATRIX 1
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

        mov rcx, [r1]                   ; rcx is for row dimension
        mov rax, [r1]                   ; rax is for column dimension

; ; FOR INTERIM MATRIX 2
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

        mov rcx, [r1]                   ; rcx is for row dimension
        mov rax, [r1]                   ; rax is for column dimension

; ; FOR FINAL MATRIX
; ; TODO - Fill code for allocating the matrix into memory, you have to use heap for this purpose
; ; Start of your code


; ; End of your code

; Matrix Input format(In ROW MAJOR format) - all elements of mat1 followed by all elements of mat2, all elements of mat3 and all elements of mat4 !!

        mov rcx, [r1]
        mov rax, [r1]
        mul rcx
        mov rcx, rax
        shl rcx, 3
        mov rdx, [a1]
        add rcx, rdx
mat1_read_loop:
        push rdx
        push rdx
        call read_64
        pop rdx
        pop rdx
        mov [rdx], rax
        add rdx, 8
        cmp rdx, rcx
        jne mat1_read_loop

        mov rcx, [r1]
        mov rax, [r1]
        mul rcx
        mov rcx, rax
        shl rcx, 3
        mov rdx, [a2]
        add rcx, rdx
mat2_read_loop:
        push rdx
        push rdx
        call read_64
        pop rdx
        pop rdx
        mov [rdx], rax
        add rdx, 8
        cmp rdx, rcx
        jne mat2_read_loop

        mov rcx, [r1]
        mov rax, [r1]
        mul rcx
        mov rcx, rax
        shl rcx, 3
        mov rdx, [a3]
        add rcx, rdx
mat3_read_loop:
        push rdx
        push rdx
        call read_64
        pop rdx
        pop rdx
        mov [rdx], rax
        add rdx, 8
        cmp rdx, rcx
        jne mat3_read_loop

        mov rcx, [r1]
        mov rax, [r1]
        mul rcx
        mov rcx, rax
        shl rcx, 3
        mov rdx, [a4]
        add rcx, rdx
mat4_read_loop:
        push rdx
        push rdx
        call read_64
        pop rdx
        pop rdx
        mov [rdx], rax
        add rdx, 8
        cmp rdx, rcx
        jne mat4_read_loop

processing_code:
        lfence
        rdtsc
        shl rdx, 32
        or rdx, rax
        mov r12, rdx
        lfence

        mov rdi, [a1]
        mov rsi, [s1]
        mov rdx, [a2]
        mov rcx, [s2]
        mov r8, [b1]
        mov r9, [r1]
        mov r11, 0
test_loop1:
        call lin_comb
        add r11, 1
        cmp r11, 10
        jne test_loop1

        mov rdi, [a3]
        mov rsi, [s3]
        mov rdx, [a4]
        mov rcx, [s4]
        mov r8, [b2]
        mov r9, [r1]
        mov r11, 0
test_loop2:
        call lin_comb
        add r11, 1
        cmp r11, 10
        jne test_loop2

        mov rdi, [b1]
        mov rdx, [b2]
        mov r8, [f1]
        mov r9, [r1]
        mov r11, 0

test_loop3:
        call hadarmard_prod
        add r11, 1
        cmp r11, 10
        jne test_loop3

        mov rdi, [f1]
        mov rdx, [r1]
        mov r11, 0

final_loop:
        call alt_sum
        add r11, 1
        cmp r11, 10
        jne final_loop
        call write_64
        lfence
        rdtsc
        shl rdx, 32
        or rdx, rax
        sub rdx, r12
        mov rax, rdx
        xor rdx, rdx
        mov rcx, 10
        div rcx
        call write_64
        lfence

code_end:
        jmp end

end:
        xor rdi, rdi
        call exit

        section .bss

        wordsize equ 8
        tempsize equ 10

s1:
        resb wordsize                  ; scaler for matrix 1
s2:
        resb wordsize                  ; scaler for matrix 2
s3:
        resb wordsize                  ; scaler for matrix 3
s4:
        resb wordsize                  ; scaler for matrix 4

r1:
        resb wordsize                  ; size of matrices

a1:
        resb wordsize                  ; pointer to matrix 1
a2:
        resb wordsize                  ; pointer to matrix 2
a3:
        resb wordsize                  ; pointer to matrix 3
a4:
        resb wordsize                  ; pointer to matrix 4
b1:
        resb wordsize                  ; pointer to interim matrix 1
b2:
        resb wordsize                  ; pointer to interim matrix 2
f1:
        resb wordsize                  ; pointer to final matrix


