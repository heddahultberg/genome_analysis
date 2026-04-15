# Pre-processing

This folder contains results from the pre-processing steps:

## Content
* FastQC reports for both Illumina short reads (prior to trimming) and Nanopore long reads
* Trimmomatic trimming outputs for Illumina short reads
* FastQC report for Illumina short reads after trimming

## Workflow summery
1. Ran quality control on short reads (Illumina) and long reads (Nanopore) with FastQC
2. Trimmed adapters and low-quality bases off the short reads, using Trimmomatic
3. Ran quality control once more on short reads with FastQC
