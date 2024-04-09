#!/bin/bash
##
## Minimal working example of passing the task ID to your program in a job array.
## This is useful when the input to your code can be an integer or the parameter
## you're sweeping over can be mapped to / indexed by an integer.
##

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=0-00:01:00

#SBATCH --job-name=task-id-as-input
## %A is the slurm job number, and %a is the array number within the job.
## %x is the job name.
#SBATCH --output=%x-%A-%3a.out
#SBATCH --error=%x-%A-%3a.err

## Array range doesn't have to start at 0.
#SBATCH --array=1-3

# Print out which node we are running on. Each job in an array might run on
# a different node.
echo "Hello from $(hostname)."

# Print the task ID
# ${SLURM_ARRAY_TASK_ID} is the job array number set by slurm (0, 1, or 2, in this example).
echo "Task ID: ${SLURM_ARRAY_TASK_ID}"

