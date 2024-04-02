# Process output files from job array

Having to process the output from multiple runs of a program is a common task; for example, you may want to compute some statistics or select the best-performing parameter.

This example just concatenates the output files together, but this shows you how to use job dependencies to process the output files from a job array.

| File                      | Description                                   |
|---------------------------|-----------------------------------------------|
| `job-array.slurm`         | Launches the job array.                       |
| `combine-output.slurm`    | Launches the job that combines output files.  |
| `run.sh`                  | Entrypoint for running the slurm jobs.        |

## Usage
1. Make sure the `run.sh` script has execute permissions:
    `chmod +x run.sh`
2. Run the `run.sh` script:
    `./run.sh`
