## Q4 How the times changed !

### a) Review
* In this question you are supposed to implement matrix operations involving hadamard product and linear combination.
* You will be provided with the code required for I/O from stdin/stdout in x86. 
* Review the given code to understand the control flow of the program before proceeding to the next parts. 
* Several sections of the code have been marked with TODO which you are supposed to fill.
* **No changes are to be made to any other section of the code.**

### b) Compilation
(i) To compile the assembly files

- `nasm -felf64 io.asm -o io.o`
- `nasm -felf64 matrix-testbench.asm -o matrix-testbench.o`

(ii) For Column Major
- `nasm -felf64 my_LINCOMB_COL.asm -o my_LINCOMB_COL.o`
- `nasm -felf64 my_SUM_COL.asm -o my_SUM_COL.o`
- `nasm -felf64 my_PROD_COL.asm -o my_PROD_COL.o`

(iii) For Row Major
- `nasm -felf64 my_LINCOMB_ROW.asm -o my_LINCOMB_ROW.o`
- `nasm -felf64 my_SUM_ROW.asm -o my_SUM_ROW.o`
- `nasm -felf64 my_PROD_ROW.asm -o my_PROD_ROW.o`

(iv) To generate binaries
- `gcc -no-pie -g io.o my_PROD_COL.o my_SUM_COL.o my_LINCOMB_COL.o  matrix-testbench.o`
- `gcc -no-pie -g io.o my_PROD_ROW.o my_SUM_ROW.o my_LINCOMB_ROW.o  matrix-testbench.o`
  
### c) Running Instructions

#### Input Format (stdin)
```
Z
s1
s2
s3
s4
M1_11
M1_12
.
.
.
M1_21
M1_22
.
.
.
M2_11
M2_12
.
.
.
M2_21
M2_22
.
.
.
...
```
Where `Z` is the size of the square matrices that you would be dealing with. After that next 4 lines contains s1,s2,s3 and s4 which are the scalers you need to multiply element wise with matrix1, matrix2, matrix3 and matrix4 respectively. Following this the elements of `mat1` are provided in row-major format one in each line followed by the elements of `mat2` and so on. Note, M1_12 represents element present in 1st row and 2nd column of matrix 1, similarly you can understand what each symbol represents.

#### Output Format (stdout)
```
R
T
```
Where `T` is the number of cycles required to perform your matrix operation code. `R` prints the final value that would be the result of above operations on given matrices. Your code will be checked for validity of `R` and performance based on `T`.

### Sample testcase
Input : 
```
2
8
5
9
5
7
10 
6
3 
7
10 
6
3 
7
10 
6
3 
7
10 
6
3 
```
Output :
```
-14196
<Cycles in your device>
```

#### Constraints

* You are only allowed to use syscalls and are not allowed to use any C/C++ functionality!
* Also the testcases would be such that no integer overflow takes place.

### d) Memory management

You are required to implement the memory allocation for all of the input matrices, required intermediate matrices and a final matrix. Fill in the code segments required in matrix-testbench.asm. The required parameters are as following in the bss section:
```
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
        resb wordsize                  ; pointer to mat1
a2:
        resb wordsize                  ; pointer to mat2
a3:
        resb wordsize                  ; pointer to mat 3
a4:
        resb wordsize                  ; pointer to mat 4
b1:
        resb wordsize                  ; pointer to interim matrix 1
b2:
        resb wordsize                  ; pointer to interim matrix 2
f1:
        resb wordsize                  ; pointer to final matrix
```
These matrices should be accessible in the following manner: 
```
&mat1[i][j] = a1+i*c1+j
&mat1[0][0] = a1 i.e, the matrix is 0-indexed
```

### e) Matrix Operations
You will be given 4 matrices M1, M2, M3 and M4. You need to first compute s1*M1 + s2*M2 and s3*M3 + s4*M4 basically the linear combination of two matrices (Note that s1,s2,s3 and s4 are scalars whereas M1,M2,M3 and M4 are matrices of size ZxZ). Having computed that you would obtain two interim matrices namely B1 and B2. You need to compute the Hadamard product of B1 and B2 and store it in matrix F1 also referred above as final matrix. Having obtained that matrix, compute the alternate sum of the matrix, that is for any element present in ith row and jth column, its contribution to the sum would be (-1)^(i+j)*F1[i][j]. 

### f) Files to work with
For this part, you need to implement the appropriate functionalities in each of the following files:
* my_LINCOMB_COL.asm and my_LINCOMB_ROW.asm : Here you need to implement the code for finding the linear combination of matrices. Note the difference between the implementation of both files by reading the formula mentioned in the comments of TODO section.
* my_PROD_COL.asm and my_PROD_ROW.asm : Here you need to implement the code for computing the element wise product of two matrices. Note the difference between the implementation of both files by reading the formula mentioned in the comments of TODO section.
* my_SUM_COL.asm and my_SUM_ROW.asm : Here you need to implement the code to calculate the alternate sum of the matrix as mentioned above. Note the difference between the implementation of both files by reading the formula mentioned in the comments of TODO section.
* matrix-testbench.asm : Here you need to appropriately allocate the memory required to hold all the provided matrices.

### g) Expected Work and Submissions
* Read through all the files to understand the code written in them and complete the TODO sections in all files.
* You need to observe how row wise and column wise operation would result in observable change in cycles spent to do the required computation.
* Your matrix operation code for all of these parts will be validated for correctness followed by performance.
* Record the time required by each of these variants changing the size `N` of the matrices to `N=128,256,512,1024,2048` and plot them in a line graph with x-axis as size of the matrix and y-axis as time taken by each variant in seconds, note that you need to specify a legend mapping each variant to a color.
* You will also need to record the data used to plot your graphs, as variant, size, cycles taken, the TSC frequency in a tabular manner
* Make sure to include your approach with detailed explanation and the plots along with corresponding tables in the `report` file.
