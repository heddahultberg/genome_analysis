#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 16
#SBATCH --mem=64G
#SBATCH -t 5:00:00
#SBATCH -J flye_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load Flye/2.9.6-GCC-13.3.0

#Paths for INPUT and OUTPUT
INPUT=/home/hehu0346/genome_analysis/data/raw_data/chr3_clean_nanopore.fq.gz

OUTDIR=/home/hehu0346/genome_analysis/analyses/02_assembly/flye_chr3

mkdir -p $OUTDIR

#Run the Flye assembly
flye \
--nano-raw $INPUT \
--out-dir $OUTDIR \
--threads 16

