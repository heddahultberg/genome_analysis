#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH --mem=64G
#SBATCH -t 02:00:00
#SBATCH -J bwa_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load BWA/0.7.19-GCCcore-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0 

#Paths
ASSEMBLY=/home/hehu0346/genome_analysis/analyses/02_assembly/flye_chr3/assembly.fasta

R1=/home/hehu0346/genome_analysis/analyses/01_preprocessing/trimmed_chr3/chr3_R1_paired.fq.gz
R2=/home/hehu0346/genome_analysis/analyses/01_preprocessing/trimmed_chr3/chr3_R2_paired.fq.gz

OUTDIR=/home/hehu0346/genome_analysis/analyses/02_assembly/bwa_chr3

mkdir -p $OUTDIR

#Index assembly
bwa index $ASSEMBLY

#Aligning reads
bwa mem -t 2 $ASSEMBLY $R1 $R2 > $OUTDIR/alignment.sam

# Convert, sort, index
samtools view -@ 2 -bS $OUTDIR/alignment.sam | samtools sort -@ 2 -o $OUTDIR/alignment.sorted.bam
samtools index $OUTDIR/alignment.sorted.bam

# Clean up
rm $OUTDIR/alignment.sam
