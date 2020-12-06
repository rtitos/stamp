# ==============================================================================
#
# Defines.common.mk
#
# ==============================================================================

# Symlink to gem5/handlers in benchmarks root dir to locate m5 objects
GEM5_ROOT = $(realpath ../gem5)
HANDLERS = $(GEM5_ROOT)/gem5_path/benchmarks/benchmarks-htm/libs/handlers

GCC_PREFIX := aarch64-linux-gnu-

CC       := $(GCC_PREFIX)gcc
CFLAGS   +=  -Wall -pthread
CFLAGS   += -O3
CFLAGS   += -I$(LIB)
CFLAGS   += -I$(HANDLERS)
CFLAGS   += -I$(GEM5_ROOT)
CPP      := $(GCC_PREFIX)g++
LD       := $(GCC_PREFIX)g++
LIBS     += -lpthread
LDFLAGS  += -static


# Remove these files when doing clean
OUTPUT +=

LIB := ../lib

# STAMP's simple thread-local memory allocator
SRCS += $(LIB)/memory.c

STM := ../../tl2

LOSTM := ../../OpenTM/lostm


# ==============================================================================
#
# End of Defines.common.mk
#
# ==============================================================================
