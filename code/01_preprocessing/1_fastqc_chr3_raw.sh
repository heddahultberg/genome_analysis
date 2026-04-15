#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J fastqc_chr3_raw
#SBATCH -o logs/slurm-%j.out

module load FastQC

mkdir -p /home/hehu0346/genome_analysis/analyses/01_preprocessing/fastqc_raw_chr3/illumina
mkdir -p /home/hehu0346/genome_analysis/analyses/01_preprocessing/fastqc_raw_chr3/nanopore

#QC Illumina
fastqc -t 2 \
/home/hehu0346/genome_analysis/data/raw_data/chr3_illumina_R1.fastq.gz \
/home/hehu0346/genome_analysis/data/raw_data/chr3_illumina_R2.fastq.gz \
-o /home/hehu0346/genome_analysis/analyses/01_preprocessing/fastqc_raw_chr3/illumina

#QC Nanopore
fastqc -t 2 \
/home/hehu0346/genome_analysis/data/raw_data/chr3_clean_nanopore.fq.gz \
-o /home/hehu0346/genome_analysis/analyses/01_preprocessing/fastqc_raw_chr3/nanopore
