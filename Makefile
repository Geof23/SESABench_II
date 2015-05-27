#SESABench
SHELL := /bin/bash
.SHELLFLAGS := -c
DIRS := LoneStar Table-1-CUDA-5.5 Table-2-Performance-Improve Table-3-Parboil
LEVEL = ../
CUDA_INCLUDE ?= /usr/local/cuda-5.5/samples/common/inc
include Makefile.dir.common
