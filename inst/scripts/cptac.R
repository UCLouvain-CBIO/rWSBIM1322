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
cptac <- selectFeatureData(cptac,
                           fcol = c("Proteins",
                                    "Sequence",
                                    "nNA"))

## Remove peptides with only missing values in cptac_na
cptac_na <- cptac
cptac_na <- cptac_na[!apply(is.na(exprs(cptac_na)), 1, all), ]
## Remove peptides with missing values in cptac
cptac <- filterNA(cptac)

cptac_se <- as(cptac, "SummarizedExperiment")
cptac_na_se <- as(cptac_na, "SummarizedExperiment")

## table(grepl("UPS", rowData(cptac_na_se)$Proteins),
##       rowSums(is.na(assay(cptac_na_se))))

save(cptac, file = "../../data/cptac.rda")
save(cptac_se, file = "../../data/cptac_se.rda")
save(cptac_na_se, file = "../../data/cptac_na_se.rda")

library("magrittr")

cptac_prot <- cptac %>%
    log(base = 2) %>%
    normalise(method = "quantiles") %>%
    combineFeatures(fcol = "Proteins",
                    method = "robust",
                    na.rm = TRUE,
                    cv = FALSE)

set.seed(123)
i <- c(1:14, ## UPS spike ins
       sample(15:1125, 100))

cptac_prot <- cptac_prot[i, ]
cptac_se_prot <- as(cptac_prot, "SummarizedExperiment")

save(cptac_prot, file = "../../data/cptac_prot.rda")
save(cptac_se_prot, file = "../../data/cptac_se_prot.rda")
