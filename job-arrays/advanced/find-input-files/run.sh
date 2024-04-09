#!/bin/bash
#
# Find input files and launch the job array.
#
# Since the numbere of input files is not necessarily fixed, we need to
# programmatically find the number of input files before launching the
# job array.

# Find the input files. See the comments in job.slurm for explanation of how
# finding files works. Note that the file-finding code is duplicated between
# run.sh and job.slurm: run.sh needs to know the number of files, and job.slurm
# needs to know the actual file names.
TOPLEVEL_DATA_DIRECTORY="./"
FILE_EXT=".txt"

readarray -t files < <(find "${TOPLEVEL_DATA_DIRECTORY}" -type f -name "*${FILE_EXT}")

# Array indexing starts at 0, so we need to subtract 1 from the number of
# files to get the upper bound of the job array number.
job_array_upper_bound=$(( ${#files[@]} - 1))

sbatch --array=0-"${job_array_upper_bound}" job.slurm
