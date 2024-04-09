# Programmatically find input files

This example is useful when you need to run a workload on a lot of different input files, such as running on many different datasets. This example shows you show to programmatically get the paths to all input files, even if the files are organized hiearchically in multiple subdirectories.

| File                      | Description                                   |
|---------------------------|-----------------------------------------------|
| `generate-input-files.sh` | Generate dummy input data.                    |
| `job.slurm`               | The sbatch job array file.                    |
| `run.sh`                  | Entrypoint for running the slurm jobs.        |
| `cleanup.sh`              | Delete input data and log files.              |

## Usage

0. Make sure all the `.sh` files have execute permissions; if not, run `chmod +x` on the relevant files. 
1. Run `./generate-input-files.sh` to generate dummy input files.
2. Submit the job by running `./run.sh`.
3. Once the example is done, you can cleanup all the generated files by running `./cleanup.sh`.