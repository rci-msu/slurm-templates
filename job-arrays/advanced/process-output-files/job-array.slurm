#!/bin/bash
##
##

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=0-00:01:00

#SBATCH --job-name=job-array
## %A is the slurm job number, and %a is the array number within the job.
## %x is the job name.
#SBATCH --output=%x-%A-%3a.out
#SBATCH --error=%x-%A-%3a.err

## Array range doesn't have to start at 0.
#SBATCH --array=1-3

# Print the task ID
# ${SLURM_ARRAY_TASK_ID} is the job array number set by slurm (1, 2, or 3, in this example).
echo "Task ID: ${SLURM_ARRAY_TASK_ID}"

# The task ID will end up in the .out file for each task in the job array. combine-outputs.slurm
# is used to combine all the output files into a single file.

