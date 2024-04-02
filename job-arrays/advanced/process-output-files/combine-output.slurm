#!/bin/bash
##
## Minimal working example of combining the output files from a job array. 
##

#SBATCH --account=group-rci
#SBATCH --partition=test
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=0-00:01:00

#SBATCH --job-name=combine-output
## %x is the job name.

# We don't use the job's output file here since this job won't print
# anything to stdout. Note that you could intentionally print the combined
# output to stdout, then the job's output file would have the combined output
# of all the tasks in the job array.
#SBATCH --output=%x.out
#SBATCH --error=%x.err

OUTPUT_FILE="combined.out"

# Make sure the output file is empty before appending the outputs to it.
# Note that this essentially overwrites the output file if it already exists;
# if you don't want to overwrite the file, you need to do something else, e.g.,
# check if the file exists, add the job id to the combined output file name, etc.

# The output file names are of the form job-array-<jobID>-<taskID>.out.
# To combine the files, we concatenate them together using cat and redirecting
# stdout to a file.
cat job-array-*.out >> "${OUTPUT_FILE}"

# Optionally, cleanup the job array output and error files.
rm job-array-*.out job-array-*.err
