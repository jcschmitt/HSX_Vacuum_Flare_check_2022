#!/bin/bash -l
# Standard output and error:
#SBATCH -o ./job.out.%j
#SBATCH -e ./job.err.%j
# Initial working directory:
#SBATCH -D ./
# Job Name:
#SBATCH -J test_slurm
#
# Number of MPI Tasks, e.g. 8:
#SBATCH --ntasks=72
# Memory usage [MB] of the job is required, e.g. 3000 MB per task:
#SBATCH --mem=240000
#
#
# Wall clock limit (max. is 24 hours):
#SBATCH --time=00:30:00

# Load compiler and MPI modules (must be the same as used for compiling the code)
module purge
module use /u/hfrerich/software/modules
module load flare/2022.4

# Run the program:
#flare -n 72 run
flare -n 72 run -c poincare_map.ctr


