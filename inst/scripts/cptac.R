library("MSnbase")
library("SummarizedExperiment")

## wget https://raw.githubusercontent.com/lgatto/bioc-ms-prot/master/data/cptac_peptides.txt
f <- "./cptac_peptides.txt"
e <- grepEcols(f, "Intensity ", split = "\t") ## careful at the space!

cptac <- readMSnSet2(f, ecol = e,
                      fnames = "Sequence",
                     sep = "\t")


cptac$group <- rep(c("6A", "6B"), each = 3)
cptac$sample <- rep(7:9, 2)
sampleNames(cptac) <- sub("Intensity.", "", sampleNames(cptac))
table(sel_conts <- fData(cptac)$Potential.contaminant != "+")
table(sel_rev <- fData(cptac)$Reverse != "+")
cptac <- cptac[sel_conts & sel_rev, ]

exprs(cptac)[exprs(cptac) == 0] <- NA
fData(cptac)$nNA <- apply(exprs(cptac), 1, function(x) sum(is.na(x)))
pData(cptac)$nNA <- apply(exprs(cptac), 2, function(x) sum(is.na(x)))
cptac <- filterNA(cptac)

cptac <- selectFeatureData(cptac,
                           fcol = c("Proteins",
                                    "Sequence",
                                    "nNA"))
cptac_se <- as(cptac, "SummarizedExperiment")

save(cptac, file = "../../data/cptac.rda")
save(cptac_se, file = "../../data/cptac_se.rda")