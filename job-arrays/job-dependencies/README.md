TLDR: run submit-jobs.sh from the directory where the .sbatch files are.

Files and what they do
 -  run-slurm-array.sbatch - launches job array that makes output from Julia
 -  run-concat-results.sbatch - concatenates all the .julia-out files that were made
 -  submit-jobs.sh - launches the job array and set the concat-results to be dependency
 -  in-out-jl - print first input argument for julia (data generator)
 -  clean-up.sh - deletes files in current directory that ends in .out , .err or .julia-out (files no longer needed)
 -  concat_julia - file where all the julia-out output went (may not be there until jobs ran)
 -  *.out - the output from the jobs (may not be there until jobs ran)
 -  *.err - the error from the jobs (may not be there until jobs ran)
 -  *.julia-out - output from each Julia instance (may not be there until jobs ran)

If you a need anymore help or explanation please let me know. We can schedule a meeting if you want.
P.S. NIH has a good tutorial [HERE] (https://hpc.nih.gov/docs/job_dependencies.html) if you want learn some more

-Alexander Salois-

