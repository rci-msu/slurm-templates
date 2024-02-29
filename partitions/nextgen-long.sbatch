#!/bin/bash
##
## Nextgen long partition sbatch example.
##
## Lines starting with #SBATCH are read by Slurm. Lines starting with ## are comments.
## All other lines are read by the shell.

## Specify the account to use; you must use your group account.
#SBATCH --account=group-rci

## Use the nextgen partition.
#SBATCH --partition=nextgen-long

## Number of CPUs to allocate. Note that in the slurm, CPUs correspond to
## logical processors, not physical cores.
#SBATCH --cpus-per-task=2

#SBATCH --mem=2G

## Maximum job run time. Format is days-HH:MM:SS.
#SBATCH --time=0-00:01:00

## Set job name.
#SBATCH --job-name=nextgen-long-example

## Set output log and error log filenames. %j is the job number.
#SBATCH --output=nextgen-long-example-%j.out
#SBATCH --error=nextgen-long-example-%j.err

## Remove one # and fill out the following lines if you want to receive emails.
##SBATCH --mail-user=      # enter your email to recieve email notifications
##SBATCH --mail-type=ALL                 # specify conditions on which to recieve emails

## Run 'man sbatch' for more information on the options above.
## Below, enter commands needed to execute your workload

# Print out the date
date
# Print which partition we are using
echo $SLURM_JOB_PARTITION
# Print the compute node's name
hostname -s
# Print the date again
date
