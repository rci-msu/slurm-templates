#!/bin/bash
##
## Lines starting with #SBATCH are read by Slurm. Lines starting with ## are comments.
## All other lines are read by the shell.
##
## Basic parameters
##
##SBATCH --account=priority-<name>      # specify the account to use if using a priority partition
#SBATCH --partition=test                # queue partition to run the job in
#SBATCH --cpus-per-task=2               # number of cores to allocate
#SBATCH --mem=2G                        # ammount of Memory allocated
#SBATCH --time=0-01:00:00               # maximum job run time in days-hours:minutes:secconds
#SBATCH --job-name=example              # job name
#SBATCH --output=example-%j.out         # standard output from job
#SBATCH --error=example-%j.err          # standard error from job
#SBATCH --mail-user=email@mail.com      # enter your email to recieve email notifications
#SBATCH --mail-type=ALL                 # specify conditions on which to recieve emails

date                                    # print out the date
echo "hello from $(hostname -s)"        # print a message from the compute node
date                                    # print the date again