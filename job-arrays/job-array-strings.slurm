#!/bin/bash
##
#SBATCH --account=group-rci 		    # priority account to use
#SBATCH --job-name=array             # job name
#SBATCH --partition=test                # queue partition to run the job in
#SBATCH --nodes=1                       # number of nodes to allocate
#SBATCH --ntasks-per-node=1             # number of descrete tasks - keep at one except for MPI
#SBATCH --cpus-per-task=1		        # number of cores to allocate - do not allocate more than 16 cores per GPU
#SBATCH --mem=2000M                     # 2000 MB of Memory allocated - do not allocate more than 128000 MB mem per GPU
#SBATCH --time=0-00:10:00               # Maximum job run time
#SBATCH --output=array_%A_%3a.out 	# standard output file (%A = jobid, %a = arrayid)
#SBATCH --error=array_%A_%3a.err 	# standard error file
#SBATCH --array=0-2
##SBATCH --mail-user=<email address>	# email address to recieve job updates
##SBATCH --mail-type=ALL			# conditions to recieve emial notifications for job
## Run 'man sbatch' for more information on the options above.

strings=("string0" "string1" "string2")

echo "Hello from $(hostname)."

echo "${strings[${SLURM_ARRAY_TASK_ID}]}"

