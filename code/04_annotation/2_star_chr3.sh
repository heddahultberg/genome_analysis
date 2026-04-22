#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=32G
#SBATCH -t 12:00:00
#SBATCH -J star_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_star.out

module load STAR/2.7.11b-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0 

GENOME=/home/hehu0346/genome_analysis/analyses/04_annotation/repeatmasking_chr3/pilon_chr3.fasta.masked
READS=/home/hehu0346/genome_analysis/data/raw_data/rna_seq
STAR_INDEX=/home/hehu0346/genome_analysis/analyses/04_annotation/star_index_chr3
OUTDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/star_chr3

mkdir -p $STAR_INDEX $OUTDIR

echo "Building STAR index"

STAR \
  --runThreadN 2 \
  --runMode genomeGenerate \
  --genomeDir $STAR_INDEX \
  --genomeFastaFiles $GENOME \
  --genomeSAindexNbases 10

echo "STAR index complete"

echo "Starting STAR RNA-mapping"

cd $READS

for R1 in *f1.fq.gz; do
    SAMPLE=$(basename $R1 _f1.fq.gz)
    R2=${SAMPLE}_r2.fq.gz

    echo "Mapping sample: $SAMPLE"

    STAR \
        --runThreadN 2 \
        --genomeDir $STAR_INDEX \
        --readFilesIn $R1 $R2 \
        --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate \
        --outFileNamePrefix $OUTDIR/${SAMPLE}_

    samtools index $OUTDIR/${SAMPLE}_Aligned.sortedByCoord.out.bam
done

echo "Star RNA-mapping complete"
