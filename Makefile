# Code prefix
PROGRAM_PREFIX=game

# Compilers and flags
CC=gcc
MPICC=mpicc
CFLAGS=-Wall --pedantic # Uncomment to show warnings
CFLAGS+=-DSHOW_RESULTS # Uncomment to make the program print its results

# Source files
SRCS=$(PROGRAM_PREFIX).c

# OpenMP
OPENMP_FLAGS=-fopenmp

# MPI
MPI_FLAGS=-DMPI

# Hybrid MPI/OpenMP
HYBRID_FLAGS=$(MPI_FLAGS) $(OPENMP_FLAGS)

# Make rules
$(PROGRAM_PREFIX).serial: game_serial.c
	$(CC) $(CFLAGS) utils.c game_serial.c -o $(PROGRAM_PREFIX)_serial

$(PROGRAM_PREFIX).mpi: game_mpi.c
	$(MPICC) $(CFLAGS) $(MPI_FLAGS) utils.c  game_mpi.c -o $(PROGRAM_PREFIX)_mpi

$(PROGRAM_PREFIX).openmp: $(SRCS)
	$(CC) $(CFLAGS) $(OPENMP_FLAGS) utils.c  game_openmp.c  -o $(PROGRAM_PREFIX)_openmp


$(PROGRAM_PREFIX).hybrid: $(SRCS)
	$(MPICC) $(CFLAGS) $(HYBRID_FLAGS) utils.c game_hybrid.c -o $(PROGRAM_PREFIX)_hybrid

clean:
	rm -f $(EXECUTABLES) *.o game_serial game_mpi game_hybrid game_openmp

serial:
	make $(PROGRAM_PREFIX).serial

openmp:
	make $(PROGRAM_PREFIX).openmp

mpi:
	make $(PROGRAM_PREFIX).mpi

hybrid:
	make $(PROGRAM_PREFIX).hybrid
