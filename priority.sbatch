#!/bin/bash
##
## Priority partition sbatch example.
##
## Lines starting with #SBATCH are read by Slurm. Lines starting with ## are comments.
## All other lines are read by the shell.

## Specify the account to use; you must use your priority account.
#SBATCH --account=priority-<name>        

## Use the priority partition.
#SBATCH --partition=priority

## Number of CPUs to allocate. Note that in the slurm, CPUs correspond to
## logical processors, not physical cores.
#SBATCH --cpus-per-task=2

## Amount of memory to allocate.
#SBATCH --mem=2G

## Maximum job run time. Format is days-HH:MM:SS.
#SBATCH --time=0-00:01:00

## Set job name.
#SBATCH --job-name=priority-example

## Set output log and error log filenames. %j is the job number.
#SBATCH --output=priority-example-%j.out
#SBATCH --error=priority-example-%j.err

## Remove one # and fill out the following lines if you want to receive emails.
##SBATCH --mail-user=      # enter your email to recieve email notifications
##SBATCH --mail-type=ALL                 # specify conditions on which to recieve emails

## Run 'man sbatch' for more information on the options above.
## Below, enter commands needed to execute your workloadKKKKKKKKKKKKKKK

# print out the date
date
# print the compute node's name
hostname -s
# print the date again
date
