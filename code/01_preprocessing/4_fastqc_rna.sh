#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH --mem=16G
#SBATCH -t 01:00:00
#SBATCH -J fastqc_rna
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_fastqc_rna.out

module load FastQC

INPUT=/home/hehu0346/genome_analysis/data/raw_data/rna_seq
OUTDIR=/home/hehu0346/genome_analysis/analyses/01_preprocessing/fastqc_rna

mkdir -p $OUTDIR

for file in $INPUT/*.fq.gz
do
    fastqc -t 2 -o $OUTDIR $file
done
