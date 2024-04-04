#!/bin/bash
##
## Example of passing strings as input to tasks in a job array.
## This is useful when the input to your program needs to be a string,
## such as the path to an input file.
##

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=0-00:01:00

#SBATCH --job-name=find-files
## %A is the slurm job number, and %a is the array number within the job.
## %x is the job name.
#SBATCH --output=log/%x-%A-%3a.out
#SBATCH --error=log/%x-%A-%3a.err

##SBATCH --array=0-2

TOPLEVEL_DATA_DIRECTORY="./"
FILE_EXT=".txt"

readarray -t files < <(find "${TOPLEVEL_DATA_DIRECTORY}" -type f -name "*${FILE_EXT}")

# Print out which node we are running on. Each job in an array might run on
# a different node.
echo "Hello from $(hostname)."

# Print the strings in the array.
# ${SLURM_ARRAY_TASK_ID} is the job array number set by slurm (0, 1, or 2, in this example).
# To access the string at a particular index in the array, we index into the array using
# ${SLURM_ARRAY_TASK_ID}.
echo "${files[${SLURM_ARRAY_TASK_ID}]}"

