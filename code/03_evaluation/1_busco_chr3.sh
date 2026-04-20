#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=16G
#SBATCH -t 01:00:00
#SBATCH -J busco_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load BUSCO/5.8.2-gfbf-2024a

POLISHED=/home/hehu0346/genome_analysis/analyses/02_assembly/pilon_chr3/pilon_chr3.fasta

OUTDIR=/home/hehu0346/genome_analysis/analyses/03_evaluation/busco_chr3

mkdir -p $OUTDIR

busco \
  -i $POLISHED \
  -l embryophyta_odb10 \
  -o busco_chr3 \
  --out_path $OUTDIR \
  -m genome \
  -c 2
