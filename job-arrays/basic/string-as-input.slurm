#!/bin/bash
##
## Example of passing strings as input to tasks in a job array.
## This is useful when the input to your program needs to be a string,
## such as the path to an input file.
##

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=0-00:01:00

#SBATCH --job-name=string-as-input
## %A is the slurm job number, and %a is the array number within the job.
## %x is the job name.
#SBATCH --output=%x-%A-%3a.out
#SBATCH --error=%x-%A-%3a.err

#SBATCH --array=0-2

# Define an array of strings to use as input for the program.
# In this case, the "program" is "echo", which will print the strings.
array=(
    "string0"
    "string1"
    "string2"
)

# Print out which node we are running on. Each job in an array might run on
# a different node.
echo "Hello from $(hostname)."

# Print the strings in the array.
# ${SLURM_ARRAY_TASK_ID} is the job array number set by slurm (0, 1, or 2, in this example).
# To access the string at a particular index in the array, we index into the array using
# ${SLURM_ARRAY_TASK_ID}.
echo "${array[${SLURM_ARRAY_TASK_ID}]}"

