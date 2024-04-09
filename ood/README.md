# OOD Job Composer Templates
This directory contains job templates for use in Open OnDemand.

Templates consist of an sbatch script and `manifest.yml` file that describes the template. For more information, see the [custom job composer templates documentation](https://osc.github.io/ood-documentation/latest/customizations.html#custom-job-composer-templates).

> :warning: The sbatch files for the Job Composer templates should be *symlinks* to files elsewhere in this repository. This avoids duplication of files that need to be deployed to tempest-web and to the Tempest home filesystem.

## Deployment
These templates are deployed to tempest-web via the `deploy-to-ood.sh` script. Run this script from your local machine.
