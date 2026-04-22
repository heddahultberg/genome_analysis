#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=32G
#SBATCH -t 08:00:00
#SBATCH -J repeatmasking_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_repeatmasker.out

module load RepeatMasker

ASSEMBLY=/home/hehu0346/genome_analysis/analyses/02_assembly/pilon_chr3/pilon_chr3.fasta

OUTDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/repeatmasking_chr3

mkdir -p $OUTDIR

RepeatMasker \
  -pa 2 \
  -species embryophyta \
  -xsmall \
  -dir $OUTDIR \
  $ASSEMBLY
