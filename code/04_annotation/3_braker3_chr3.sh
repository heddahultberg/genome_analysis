#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -n 2
#SBATCH --mem=64G
#SBATCH -t 08:00:00
#SBATCH -J star_braker3_chr3
#SBATCH -o /home/hehu0346/genome_analysis/logs/slurm-%j_braker3.out#
