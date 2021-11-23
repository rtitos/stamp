# ==============================================================================
#
# Defines.common.mk
#
# ==============================================================================

# ARCH must be set before calling make
#ARCH = { aarch64 , x86, riscv}

# Need symlink to gem5 in STAMP root directory to locate handlers/m5 objects
GEM5_ROOT := $(realpath ../gem5)

ifeq ($(GEM5_ROOT),)
$(error GEM5_ROOT not set)
endif

ifndef ARCH
$(error ARCH not set)
else
$(info $$ARCH is [${ARCH}])
endif
# ARCH set via make ARCH=xxx when building this library as part of the
# build process of STAMP (see common/Defines.common.mk)

M5_ARCH = ${ARCH}

ifeq ($(ARCH),aarch64)

ifdef AARCH64_CROSS_GCC_PREFIX
GCC_PREFIX := ${AARCH64_CROSS_GCC_PREFIX}
else
# gcc 7.5 cross installed from Ubuntu packages
GCC_PREFIX := aarch64-linux-gnu-
endif

# gcc 10.2 cross built from source (recall: export PATH=/opt/cross/bin:$PATH)
#GCC_PREFIX := aarch64-linux-
M5_ARCH = arm64

else ifeq ($(ARCH),x86)

GCC_PREFIX := ${X86_CROSS_GCC_PREFIX}

else ifeq ($(ARCH),riscv)

ifdef RISCV_CROSS_GCC_PREFIX
GCC_PREFIX := ${RISCV_CROSS_GCC_PREFIX}
else
GCC_PREFIX := riscv64-unknown-linux-gnu-
endif
CFLAGS	+= -fcommon

endif

HANDLERS  := $(GEM5_ROOT)/gem5_path/benchmarks/benchmarks-htm/libs/handlers
M5        := $(GEM5_ROOT)/util/m5/build/$(M5_ARCH)/out

CC       := $(GCC_PREFIX)gcc
CFLAGS   +=  -Wall -pthread
CFLAGS   += -O3
CFLAGS   += -I$(LIB)
CFLAGS   += -I$(HANDLERS)
CFLAGS   += -I$(M5)
CFLAGS   += -I$(GEM5_ROOT)
CPP      := $(GCC_PREFIX)g++
LD       := $(GCC_PREFIX)g++
LIBS     += -lpthread
LDFLAGS  += -static

CFLAGS += -I$(GEM5_ROOT)/include


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
