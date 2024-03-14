#!/bin/bash
#SBATCH --account=group-rci        #specify the account to use
#SBATCH --job-name=concatResults          # job name
#SBATCH --partition=legacy             # queue partition to run the job in
#SBATCH --nodes=1                       # number of nodes to allocate
#SBATCH --ntasks-per-node=1             # number of descrete tasks - keep at one except for MPI
#SBATCH --cpus-per-task=2              # number of cores to allocate
#SBATCH --mem=2000M           # 2000 MB of Memory allocated; set --mem with care
#SBATCH --time=0-00:10:00                 # Maximum job run time
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err


date
echo "Hello from $(hostname)"
cat *.julia-out > concat_julia
echo "Ended batch processing at `date`."
