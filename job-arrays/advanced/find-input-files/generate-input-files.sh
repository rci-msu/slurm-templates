#!/bin/bash

TOPLEVEL_DIRS=("top1"  "top2"  "top3")
SUBDIRS=("sub1"  "sub2"  "sub3"  "sub4")
N_FILES_PER_SUBDIR=10

for toplevel_dir in "${TOPLEVEL_DIRS[@]}"; do
    for subdir in "${SUBDIRS[@]}"; do
        # make the directory
        mkdir -p "${toplevel_dir}/${subdir}"

        for i in $(seq "${N_FILES_PER_SUBDIR}"); do
            # generate dummy file with filepath as it's content
            filepath="${toplevel_dir}/${subdir}/file${i}.txt"
            echo "${filepath}" > "${filepath}"
        done
    done
done

