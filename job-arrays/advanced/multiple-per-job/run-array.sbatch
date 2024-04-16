#!/bin/bash
##
## Minimal working example to run multiple programs in a job in an array
## Uses XARGS to acomplish this
##

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=8
#SBATCH --mem=2G
#SBATCH --time=0-00:02:00

#SBATCH --job-name=multiple-task-id
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
# ${SLURM_ARRAY_TASK_ID} is the job array number set by slurm (1, 2, or 3 in this example).
echo "Task ID: ${SLURM_ARRAY_TASK_ID}"

# the step size to set how many to run in a single job
step=10

# do some math to count up from 
# step*SLURM_ARRAY_TASK_ID (10*1 = 10) to
# start + step - 1 (10 + 10 - 1 = 19) 
start=$(( $step * SLURM_ARRAY_TASK_ID ))
stop=$(( start + step - 1))

# print out the numbers in the list
echo $(seq $start $stop)

my_func () {
  echo $1 "task from slurm task ${SLURM_ARRAY_TASK_ID}"
}

# run multiple instances of a program within a job in parallel
# the number in parallel is the set by slurm up top
seq $start $stop | xargs -P ${SLURM_CPUS_PER_TASK} -I _ echo my_func _


