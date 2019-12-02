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
$(PROGRAM_PREFIX).serial: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(PROGRAM_PREFIX)_serial
$(PROGRAM_PREFIX).openmp: $(SRCS)
	$(CC) $(CFLAGS) $(OPENMP_FLAGS) $(SRCS) -o $(PROGRAM_PREFIX)_openmp

$(PROGRAM_PREFIX).mpi: $(SRCS)
	$(MPICC) $(CFLAGS) $(MPI_FLAGS) $(SRCS) -o $(PROGRAM_PREFIX)_mpi


$(PROGRAM_PREFIX).hybrid: $(SRCS)
	$(MPICC) $(CFLAGS) $(HYBRID_FLAGS) $(SRCS) -o $(PROGRAM_PREFIX)_hybrid

clean:
	rm -f $(EXECUTABLES) *.o game_serial

serial:
	make $(PROGRAM_PREFIX).serial

openmp:
	make $(PROGRAM_PREFIX).openmp

mpi:
	make $(PROGRAM_PREFIX).mpi

hybrid:
	make $(PROGRAM_PREFIX).hybrid
