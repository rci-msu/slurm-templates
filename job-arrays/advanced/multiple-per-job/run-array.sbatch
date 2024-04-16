#!/bin/bash
##
## Example to run multiple programs in a single job in a job array
## 
## Xargs was used to make this work as we set the number of cpus to use
## Also xargs is a tool that is program language angnostic and it is present on our nodes 

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=8
#SBATCH --mem=2G
#SBATCH --time=0-00:02:00

#SBATCH --job-name=multiple-per-job
## %A is the slurm job number, and %a is the array number within the job.
## %x is the job name.
#SBATCH --output=%x-%A-%3a.out
#SBATCH --error=%x-%A-%3a.err

## Array range doesn't have to start at 0.
#SBATCH --array=0-3

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

# run multiple instances of a program within a job in parallel
# the number in parallel is the set by slurm's cpus-per-task
# 
# seq start stop with return a list starting with start and ending with stop
#
# xargs
# -P sets the number of cpus to use 
# -I set the character that represents the input
# for us we set the number of cpus we used in slurm
# and we are usin '{}' as the input character replacement
seq $start $stop | xargs -P ${SLURM_CPUS_PER_TASK} -I {} \
	printf "task %s from slurm array task %s\n" "{}" "${SLURM_ARRAY_TASK_ID}"

