#!/bin/bash
#SBATCH --account=group-rci        #specify the account to use
#SBATCH --job-name=slurmArray            # job name
#SBATCH --partition=legacy             # queue partition to run the job in
#SBATCH --nodes=1                       # number of nodes to allocate
#SBATCH --ntasks-per-node=1             # number of descrete tasks - keep at one except for MPI
#SBATCH --cpus-per-task=2              # number of cores to allocate
#SBATCH --mem=2000M           # 2000 MB of Memory allocated; set --mem with care
#SBATCH --time=0-00:10:00                 # Maximum job run time
#SBATCH --array=1-10                 # Number of jobs in array
#SBATCH --output=%x_%A_%3a.out
#SBATCH --error=%x_%A_%3a.err


date
echo "Hello from $(hostname)"
module load Julia/1.9.0-linux-x86_64 
echo ${SLURM_JOBID}
echo ${SLURM_ARRAY_TASK_ID}
julia in-out.jl ${SLURM_ARRAY_TASK_ID} > ${SLURM_JOBID}_${SLURM_ARRAY_TASK_ID}.julia-out
echo "Ended batch processing at `date`."
