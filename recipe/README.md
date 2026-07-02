# Bioconda recipe for MitoGeneExtractor

This directory stages a [Bioconda](https://bioconda.github.io/) recipe for
MitoGeneExtractor. It is **not** built from this repository directly — Bioconda
builds packages from a tagged release tarball of the upstream project
(`cmayer/MitoGeneExtractor`).

## Contents

- `meta.yaml` — package metadata, dependencies and tests.
- `build.sh` — compiles the tool and installs it into `$PREFIX/bin`.

## Dependencies

- **Build:** a C++ compiler (`{{ compiler('cxx') }}`) and `make`. TCLAP is
  header-only and vendored in the source tree, so there are no host libraries.
- **Run:** `exonerate 2.4.0` — a core runtime dependency. It is installed
  automatically with the package, so `conda install -c bioconda mitogeneextractor`
  pulls in Exonerate too.

## Installed commands

`build.sh` installs both the versioned binary (`MitoGeneExtractor-v1.9.6`) and a
stable `MitoGeneExtractor` symlink.

## Submitting to Bioconda

1. Fill in `source.sha256` in `meta.yaml` with the checksum of the release
   tarball:

   ```
   wget -O v1.9.6.tar.gz https://github.com/cmayer/MitoGeneExtractor/archive/refs/tags/v1.9.6.tar.gz
   sha256sum v1.9.6.tar.gz
   ```

2. Copy this directory into a clone of
   [`bioconda/bioconda-recipes`](https://github.com/bioconda/bioconda-recipes)
   as `recipes/mitogeneextractor/`, then open a pull request. Bioconda CI builds
   and tests the recipe on Linux and macOS.
