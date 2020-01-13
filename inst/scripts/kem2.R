e <- as.matrix(read.delim(rWSBIM1207::kem2.tsv()[1], row.names = 1))
pd <- readr::read_tsv(rWSBIM1207::kem2.tsv()[2]) %>%
    mutate(sample_id = sub("-", ".", sample_id))
pd$jurkat <- NULL

library("SummarizedExperiment")

kem2_se <- SummarizedExperiment(assays = SimpleList(e),
                                colData = DataFrame(pd))

set.seed(1)
e <- log2(assay(kem2_se) + 1)
rowData(kem2_se)$class <- paste0("cl", kmeans(e, centers = 10, nstart = 10)$cl)
rowData(kem2_se)$class[sample(nrow(kem2_se), 500)] <- "unknown"

save(kem2_se, file = "~/wrk/rWSBIM1322/data/kem2_se.rda",
     compress = "xz", compression_level = 9)
