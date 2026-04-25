#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=64G
#SBATCH -t 24:00:00
#SBATCH -J eggnog_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_eggnog.out

module load eggnog-mapper/2.1.13-gfbf-2024a

PROTEINS=/home/hehu0346/genome_analysis/analyses/04_annotation/braker3_chr3/braker.aa
OUTDIR=/home/hehu0346/genome_analysis/analyses/04_annotation/eggnog_chr3

mkdir -p $OUTDIR

cd $OUTDIR

echo "Running eggNOG-mapper (HMMER mode) on:"
echo $PROTEINS

emapper.py \
    -i $PROTEINS \
    -o eggnog_chr3 \
    --output_dir $OUTDIR \
    --cpu 2 \
    --itype proteins \
    --search_mode hmmer \
    -d viridiplantae \
    --sensmode ultra-sensitive \
    --go_evidence all \
    --pfam_realign realign \
    --usemem \
    --data_dir /sw/data/eggNOG/5.0.0/rackham/ \
    --override

echo "eggNOG-mapper finished"
