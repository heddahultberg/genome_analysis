#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J deseq2_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_deseq2.out

module load R/4.4.2-gfbf-2024a

export R_LIBS_USER=/gorilla/home/hehu0346/R/x86_64-pc-linux-gnu-library/4.4

mkdir -p $R_LIBS_USER

Rscript /home/hehu0346/genome_analysis/code/05_expression_analysis/2_deseq2_chr3.R
