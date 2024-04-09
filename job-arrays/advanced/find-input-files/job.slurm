#!/bin/bash
##
## Example of passing strings as input to tasks in a job array.
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


# Define where the files are located and what their file extension is.
TOPLEVEL_DATA_DIRECTORY="./"
FILE_EXT=".txt"

# Find the files.
# The `find` command recursively searches through all files and folders inside
# the TOPLEVEL_DATA_DIRECTORY to find all files that end with the desired FILE_EXT.
# `find` returns a list of the file paths. `readarray` is used to conver that list
# strings into a bash array, which we can then index into to get the individual file paths.
readarray -t files < <(find "${TOPLEVEL_DATA_DIRECTORY}" -type f -name "*${FILE_EXT}")

# Print out which node we are running on. Each job in an array might run on
# a different node.
echo "Hello from $(hostname)."

# Print the content of the input file.
# ${SLURM_ARRAY_TASK_ID} is the job array number set by slurm (0, 1, or 2, in this example).
# To access the file path at a particular index in the files array, we index
# into the array using ${SLURM_ARRAY_TASK_ID}.
cat "${files[${SLURM_ARRAY_TASK_ID}]}"

