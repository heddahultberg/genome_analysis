res <- read.csv("/home/hehu0346/genome_analysis/analyses/05_expression_analysis/deseq2/deseq2_chr3_results.csv",
                row.names = 1)

annotation <- read.table("/home/hehu0346/genome_analysis/analyses/04_annotation/eggnog_chr3/eggnog_chr3.emapper.annotations",
                   header = TRUE,
                   sep = "\t",
                   comment.char = "#",
                   fill = TRUE,
                   quote = "")

header_line <- readLines("/home/hehu0346/genome_analysis/analyses/04_annotation/eggnog_chr3/eggnog_chr3.emapper.annotations")
header <- header_line[grep("^#query", header_line)]
header <- sub("^#", "", header)  # remove leading "#"
header <- strsplit(header, "\t")[[1]]

raw <- read.delim(
  "/home/hehu0346/genome_analysis/analyses/04_annotation/eggnog_chr3/eggnog_chr3.emapper.annotations",
  header = FALSE,
  sep = "\t",
  comment.char = "",
  quote = "",
  fill = TRUE,
  check.names = FALSE
)

colnames(raw) <- header

annotation <- raw

colnames(annotation)

wanted_cols <- intersect(
  c("query", "Description", "GOs", "KEGG_ko", "PFAMs"),
  colnames(annotation)
)


merged <- merge(
  as.data.frame(res),
  annotation[, wanted_cols, drop = FALSE],
  by.x = "row.names",
  by.y = "query",
  all.x = TRUE
)


write.csv(
  merged,
  "/home/hehu0346/genome_analysis/analyses/05_expression_analysis/deseq2/merged_deseq2_annotated_results_chr3.csv",
  row.names = FALSE
)

