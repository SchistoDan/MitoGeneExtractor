#!/bin/bash
#SBATCH --job-name=MGE-test
#SBATCH --partition=hour
#SBATCH --output=5x.out
#SBATCH --mem-per-cpu=10G
#SBATCH --cpus-per-task=16
#SBATCH --error=5x.err

# Activate conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda init bash
conda activate mge_env

snakemake \
   --snakefile Snakefile \
   --cores 16
