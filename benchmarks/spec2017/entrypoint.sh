#!/bin/bash

set -e

# Path to SPEC root (adjust if needed)
SPEC_ROOT=/opt/spec
CONFIG_NAME=myconfig

# Ensure argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 <benchmark_name>"
  echo "Example: $0 600.perlbench_s	"
  exit 1
fi

BENCHMARK="$1"

# Source SPEC environment
source "${SPEC_ROOT}/shrc"

# Run the benchmark
echo "Running SPEC benchmark: $BENCHMARK (size=ref, config=$CONFIG_NAME)"
runcpu --config="$CONFIG_NAME" --size=ref --tune=base "$BENCHMARK"