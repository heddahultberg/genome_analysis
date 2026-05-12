res <- read.csv("/home/hehu0346/genome_analysis/analyses/05_expression_analysis/deseq2/deseq2_chr3_results.csv",
                row.names = 1)

sig <- res[!is.na(res$padj) & res$padj < 0.05, ]

sig_strict <- sig[abs(sig$log2FoldChange) > 1, ]

write.csv(sig, "/home/hehu0346/genome_analysis/analyses/05_expression_analysis/deseq2/sig_genes_padj0.05.csv")
write.csv(sig_strict, "/home/hehu0346/genome_analysis/analyses/05_expression_analysis/deseq2/sig_genes_padj0.05_log2FC1.csv")
