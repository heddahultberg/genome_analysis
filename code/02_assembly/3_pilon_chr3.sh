#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=64G
#SBATCH -t 24:00:00
#SBATCH -J pilon_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j.out

module load Pilon/1.24-Java-17
module load SAMtools/1.22.1-GCC-13.3.0

#Paths
ASSEMBLY=/home/hehu0346/genome_analysis/analyses/02_assembly/flye_chr3/assembly.fasta

BAM=/home/hehu0346/genome_analysis/analyses/02_assembly/bwa_chr3/alignment.sorted.bam

OUTDIR=/home/hehu0346/genome_analysis/analyses/02_assembly/pilon_chr3

mkdir -p $OUTDIR

#Index
samtools index $BAM

#Run Pilon
java -Xmx16G -jar $EBROOTPILON/pilon.jar \
  --genome $ASSEMBLY \
  --frags $BAM \
  --output pilon_chr3 \
  --outdir $OUTDIR \
  --threads 2 \

