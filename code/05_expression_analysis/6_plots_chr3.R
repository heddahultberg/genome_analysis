library(DSeq2)

# Recreating DESeq2 object (same as DESeq2 script, might need to rerun this before running the PCA plot)
dds <- DESeqDataSetFromMatrix(
  countData = round(count_matrix),
  colData = meta,
  design = ~ condition
)
dds <- dds[rowSums(counts(dds)) > 10, ]
dds <- DESeq(dds)
res <- results(dds)


# PCA plot
vsd <- vst(dds)
plotPCA(vsd, intgroup = "condition")

# MA plot
plotMA(res, ylim = c(-5, 5))

# Volcano plot
with(res, plot(log2FoldChange, -log10(padj),
               pch = 20, col = "grey",
               xlab = "log2 Fold Change",
               ylab = "-log10 adjusted p-value"))

with(subset(res, padj < 0.05),
     points(log2FoldChange, -log10(padj), pch = 20, col = "red"))


# Optional - Enhanced volcano plot, if the first one is of poorer quality
install.packages("EnhancedVolcano")
library(EnhancedVolcano)

EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0.05,
                FCcutoff = 1)

