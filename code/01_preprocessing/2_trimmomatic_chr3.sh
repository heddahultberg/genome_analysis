#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH -J trimmomatic_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load Trimmomatic/0.39-Java-17

# Input
R1=/home/hehu0346/genome_analysis/data/raw_data/chr3_illumina_R1.fastq.gz
R2=/home/hehu0346/genome_analysis/data/raw_data/chr3_illumina_R2.fastq.gz

# Output dir
OUTDIR=/home/hehu0346/genome_analysis/analyses/01_preprocessing/trimmed_chr3

mkdir -p $OUTDIR

# Run Trimmomatic
trimmomatic PE -threads 2 \
$R1 \
$R2 \
$OUTDIR/chr3_R1_paired.fq.gz \
$OUTDIR/chr3_R1_unpaired.fq.gz \
$OUTDIR/chr3_R2_paired.fq.gz \
$OUTDIR/chr3_R2_unpaired.fq.gz \
ILLUMINACLIP:$EBROOTTRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
