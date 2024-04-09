#!/bin/bash
#
# Launch the job-array and combine-output sbatch jobs.
# combine-output will run after the job-array is finished.

# We need to get the job id of the job array so we can tell the combine-output
# job to only run after the job array is finished. cut is used to grab the job id
# from the output of sbatch, which is of the form "Submitted batch job <job id>".
# This line also submits the job array.
jobid="$(sbatch job-array.slurm | cut -d ' ' -f 4)"

# Run the combine-output job once the job array is finished.
# The job will remain queued until the job array finishes sucessfully.
sbatch --dependency=afterok:"${jobid}" combine-output.slurm

