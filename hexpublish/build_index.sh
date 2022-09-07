#!/usr/bin/env bash

set -Eeuo pipefail

mkdir -p sync

# merge any wheels in wheelhouse into package list
cat packages > packages.$$ && ls -1 wheelhouse >> packages.$$ && cat packages.$$ | sort | uniq > packages && rm packages.$$

# render package list into pypi-style index
jq --raw-input --slurp '{ packages: split("\n") | .[0:-1] }' packages | poetry run jinja -f json -d - index.template.html > sync/index.html

# copy wheels into dir to sync with s3
cp wheelhouse/*.whl sync
