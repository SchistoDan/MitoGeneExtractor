#!/bin/bash
set -euo pipefail

# Build with the compiler and flags provided by the conda build environment.
make CXX="${CXX}"

# Install the versioned binary plus a stable "MitoGeneExtractor" command
# into ${PREFIX}/bin (see the `install` target in the makefile).
make install PREFIX="${PREFIX}"
