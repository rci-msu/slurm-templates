#!/bin/bash
#
# Copy slurm templates to Open OnDemand's job templates, which can be accessed
# via the Job Composer.

readonly TEMPEST_WEB_HOSTNAME="tempest-web.msu.montana.edu"
readonly TEMPEST_WEB_JOB_TEMPLATE_DIR="/etc/ood/config/apps/myjobs/templates"
readonly REPO_JOB_TEMPLATE_DIR="ood"

cd "${REPO_JOB_TEMPLATE_DIR}"

# Copy all the template directories to tempest-web
echo "copying templates..."
scp -q -r * "root@${TEMPEST_WEB_HOSTNAME}:${TEMPEST_WEB_JOB_TEMPLATE_DIR}/"

# We explicitly set the permissions because these files may be scp'd from a
# Windows machine, in which case the permissions might be incorrect.
echo "setting permissions..."
ssh "root@${TEMPEST_WEB_HOSTNAME}" chmod -R u=rwX,g=rwX,o=rX "${TEMPEST_WEB_JOB_TEMPLATE_DIR}"
