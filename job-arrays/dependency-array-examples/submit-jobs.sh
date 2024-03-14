#!/bin/bash

# get the job id
jobid1=$(sbatch run-slurm-array.sbatch | cut -d ' ' -f 4)

# use job id as dependency
sbatch  --dependency=afterok:$jobid1 run-concat-results.sbatch
