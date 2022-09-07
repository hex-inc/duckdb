#!/usr/bin/env bash

set -Eeuo pipefail

aws s3 sync ./sync s3://hex-internal-pypi-index/duckdb/
