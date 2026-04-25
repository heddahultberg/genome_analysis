#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 16
#SBATCH --mem=64G
#SBATCH -t 24:00:00
#SBATCH -J hisat2_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_hisat2.out

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

INDEX=/home/hehu0346/genome_analysis/analyses/04_annotation/hisat2_index_chr3/chr3_index
READS=/home/hehu0346/genome_analysis/data/raw_data/rna_seq
OUTDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/hisat2_chr3

mkdir -p $OUTDIR

SAMPLES=(
Control_1
Control_2
Control_3
Heat_treated_42_12h_1
Heat_treated_42_12h_2
Heat_treated_42_12h_3
)

for s in "${SAMPLES[@]}"; do
    echo "Sample being processed: $s"

    R1=$READS/${s}_f1.fq.gz
    R2=$READS/${s}_r2.fq.gz

    OUTBAM=$OUTDIR/${s}.sorted.bam

    hisat2 -p 16 -x $INDEX -1 $R1 -2 $R2 \
        | samtools sort -@ 16 -o $OUTBAM

    samtools index $OUTBAM
done
