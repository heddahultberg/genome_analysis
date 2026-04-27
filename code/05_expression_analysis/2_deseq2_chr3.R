library(DESeq2)

fc_path <- "/home/hehu0346/genome_analysis/analyses/05_expression_analysis/featurecounts_chr3.txt"


fc <- read.table(
  fc_path,
  header = TRUE,
  sep = "\t",
  comment.char = "#",
  check.names = FALSE
)

count_matrix <- fc[, 7:ncol(fc)]
rownames(count_matrix) <- fc$Geneid

sample_names <- colnames(count_matrix)

sample_names <- basename(sample_names)

sample_names <- sub("\\.sorted\\.bam$", "", sample_names)
sample_names <- sub("\\.bam$", "", sample_names)

sample_names <- trimws(clean_names)

colnames(count_matrix) <- sample_names

meta_file <- "/home/hehu0346/genome_analysis/data/meta_data/rna_seq.tsv"

meta <- read.table(
  meta_file,
  header = TRUE,
  sep = "\t",
  stringsAsFactors = FALSE
)

rownames(meta) <- meta$sample
meta$sample <- NULL
rownames(meta) <- trimws(rownames(meta))

meta <- meta[colnames(count_matrix), , drop = FALSE]

if (!all(colnames(count_matrix) == rownames(meta))) {
  stop("ERROR: Sample names in metadata do not match count matrix.")
}

dds <- DESeqDataSetFromMatrix(
  countData = round(count_matrix),
  colData = meta,
  design = ~ condition
)

dds <- dds[rowSums(counts(dds)) > 10, ]

dds <- DESeq(dds)
res <- results(dds)
res <- res[order(res$padj), ]

out_dir <- "/home/hehu0346/genome_analysis/analyses/05_expression_analysis/deseq2"
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

write.csv(
  as.data.frame(res),
  file = file.path(out_dir, "deseq2_chr3_results.csv")
)

summary(res)


