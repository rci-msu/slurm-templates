#!/bin/bash

TOPLEVEL_DATA_DIRECTORY="./"
FILE_EXT=".txt"

readarray -t files < <(find "${TOPLEVEL_DATA_DIRECTORY}" -type f -name "*${FILE_EXT}")

n_files=$(( ${#files[@]} - 1))

sbatch --array=0-"${n_files}" job.slurm
