#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=64G
#SBATCH -t 24:00:00
#SBATCH -J braker3_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_braker3.out

module load SAMtools/1.22-GCC-13.3.0

GENOME=/home/hehu0346/genome_analysis/analyses/04_annotation/repeatmasking_chr3/pilon_chr3.fasta.masked
BAMDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/hisat2_chr3
OUTDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/braker3_chr3
BRAKER=/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif 

mkdir -p $OUTDIR
export TMPDIR=$OUTDIR/tmp
mkdir -p $TMPDIR

BAMS=$(ls $BAMDIR/*.sorted.bam | tr '\n' ',' | sed 's/,$//')

echo "Using BAM files:"
echo $BAMS

singularity exec \
-B /home/hehu0346:/home/hehu0346 \
-B /home/hehu0346/bin/augustus_config:/opt/Augustus/config \
-B /proj/uppmax2026-1-61:/proj/uppmax2026-1-61 \
$BRAKER braker.pl \
    --genome=$GENOME \
    --bam=$BAMS \
    --softmasking \
    --species=hehu0346_chr3_moss \
    --threads=2 \
    --workingdir=$OUTDIR

echo "BRAKER3 finished"
