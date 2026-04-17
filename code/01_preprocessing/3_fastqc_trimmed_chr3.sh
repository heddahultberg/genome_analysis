#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_trimmed_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load FastQC/0.12.1-Java-17

# Input files
INPUT=/home/hehu0346/genome_analysis/analyses/01_preprocessing/trimmed_chr3

# Output directory
OUTDIR=/home/hehu0346/genome_analysis/analyses/01_preprocessing/fastqc_trimmed_chr3

mkdir -p $OUTDIR

# Run FastQC
fastqc -t 2 \
  $INPUT/*_paired.fq.gz \
  -o $OUTDIR
