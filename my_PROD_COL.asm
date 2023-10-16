        section .text
        global hadarmard_prod

hadarmard_prod:
        push rdi                       ; pointer to mat1
        push rdx                       ; pointer to mat2
        push r8                        ; pointer to mat3
        push r9                        ; number of rows/ columns of the matrix (n)
        push r11


; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Compute hadarmard product of of mat1, mat2 and save the result in mat3
; ; Note : mat1, mat2 and mat3 here are not the same as one given in problem statement.
; ; They are just placeholders for any three matrices using this functionality.

; ; TODO - Fill your code here performing the hadarmard product in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){mat3[j][i] = mat1[j][i] * mat2[j][i];}}

; ; End of code to be filled
        pop r11
        pop r9
        pop r8
        pop rdx
        pop rdi
        ret
