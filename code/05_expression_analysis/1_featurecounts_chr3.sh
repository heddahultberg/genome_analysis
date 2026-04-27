#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=12G
#SBATCH -t 02:00:00
#SBATCH -J featurecount_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_featurecount.out

module load Subread/2.1.1-GCC-13.3.0

SORTED_BAMS=/home/hehu0346/genome_analysis/analyses/04_annotation/hisat2_chr3
GTF=/home/hehu0346/genome_analysis/analyses/04_annotation/braker3_chr3/braker.gtf
OUTDIR=/home/hehu0346/genome_analysis/analyses/05_expression_analysis

mkdir -p $OUTDIR

featureCounts \
    -T 2 \
    -p \
    -t exon \
    -g gene_id \
    -a $GTF \
    -o $OUTDIR/featurecounts_chr3.txt \
    $SORTED_BAMS/*sorted.bam
