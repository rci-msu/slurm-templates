#!/bin/bash
#
# Copy slurm templates to Open OnDemand's job templates, which can be accessed
# via the Job Composer.

readonly TEMPEST_WEB_HOSTNAME="tempest-web.msu.montana.edu"
readonly TEMPEST_WEB_JOB_TEMPLATE_DIR="/etc/ood/config/apps/myjobs/templates"
readonly REPO_JOB_TEMPLATE_DIR="ood"

cd "${REPO_JOB_TEMPLATE_DIR}"

# Copy all the template directories to tempest-web
# We explicitly set the permissions because these files may be rsync'd from a
# Windows machine, in which case the permissions will be incorrect.
echo "copying templates..."

rsync \
  --recursive \
  --perms \
  --chmod=D775,F644 \
  --links \
  --copy-unsafe-links \
  --exclude="README.md" \
  ./* \
  "root@${TEMPEST_WEB_HOSTNAME}:${TEMPEST_WEB_JOB_TEMPLATE_DIR}/"
