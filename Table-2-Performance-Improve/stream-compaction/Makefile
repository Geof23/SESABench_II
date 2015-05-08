#SESABench/Table-2-Performance-Improve/stream-compaction
#another multi-option kernel -- we'll do 2^4 & 2^8
GKS_FLAGS = --symbolic-config --race-prune --avoid-oob-check

GN_FLAGS = -DN=16
TARGET = stream-compaction_16
include ../../Makefile.common

GN_FLAGS = -DN=256
TARGET = stream-compaction_256
include ../../Makefile.common

