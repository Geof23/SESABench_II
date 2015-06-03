#SESABench/Table-2-Performance-Improve/wordSearch
#another multi-option kernel x 2 -- we'll do 2^4 + 2^5 & 2^5 + 2^4
GKS_FLAGS ?= --symbolic-config --race-prune

GN_FLAGS += -DNUM1=16 -DNUM2=16
TARGET = wordSearch_16X16
include ../../Makefile.common

# GN_FLAGS += -DNUM1=16 -DNUM2=32
# TARGET = wordSearch_16X32
# include ../../Makefile.common

# GN_FLAGS += -DNUM1=32 -DNUM2=16
# TARGET = wordSearch_32X16
# include ../../Makefile.common

