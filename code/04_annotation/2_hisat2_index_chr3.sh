#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 8
#SBATCH --mem=64G
#SBATCH -t 02:00:00
#SBATCH -J hisat2_index_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_hisat2_index.out

module load HISAT2/2.2.1-gompi-2024a

GENOME=/home/hehu0346/genome_analysis/analyses/04_annotation/repeatmasking_chr3/pilon_chr3.fasta.masked
OUTDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/hisat2_index_chr3

mkdir -p $OUTDIR

cd $OUTDIR

hisat2-build -p 8 $GENOME chr3_index
