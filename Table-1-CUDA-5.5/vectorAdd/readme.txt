Sample: Vector Addition
Minimum spec: SM 1.0

This CUDA Runtime API sample is a very basic sample that implements element by element vector addition. It is the same as the sample illustrating Chapter 3 of the programming guide with some additions like error checking.

Key concepts:



[Build]:

<symbolic mode>: 
gklee-nvcc -o vectorAdd vectorAdd.cu -D_SYM
<concrete mode>: 
gklee-nvcc -o vectorAdd vectorAdd.cu

[SESA]:
opt -load /path/to/libashwin_taint.so -scev-aa -taint < vectorAdd > vectorAdd.new 2>&1

[Run]:

gklee --symbolic-config vectorAdd
