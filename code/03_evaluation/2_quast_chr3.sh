#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 00:30:00
#SBATCH -J quast_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load QUAST/5.2.0 

FLYE=/home/hehu0346/genome_analysis/analyses/02_assembly/flye_chr3/assembly.fasta
PILON=/home/hehu0346/genome_analysis/analyses/02_assembly/pilon_chr3/pilon_chr3.fasta

OUTDIR=/home/hehu0346/genome_analysis/analyses/03_evaluation/quast_chr3

mkdir -p $OUTDIR

quast.py \
  -o $OUTDIR \
  -t 2 \
  -l FLYE,PILON \
  $FLYE \
  $PILON


