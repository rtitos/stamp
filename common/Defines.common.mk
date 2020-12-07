# ==============================================================================
#
# Defines.common.mk
#
# ==============================================================================

#ARCH = { aarch64 , x86}
ARCH      := aarch64

# Need symlink to gem5 in STAMP root directory to locate handlers/m5 objects
GEM5_ROOT := $(realpath ../gem5)
HANDLERS  := $(GEM5_ROOT)/gem5_path/benchmarks/benchmarks-htm/libs/handlers

ifndef ARCH
$(error ARCH not set)
else
$(info $$ARCH is [${ARCH}])
endif
# ARCH set via make ARCH=xxx when building this library as part of the
# build process of STAMP (see common/Defines.common.mk)

ifeq ($(ARCH),aarch64)

GCC_PREFIX := aarch64-linux-gnu-

else ifeq ($(ARCH),x86)

GCC_PREFIX :=

endif


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
