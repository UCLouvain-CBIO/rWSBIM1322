library(wsbimtools)
library(SummarizedExperiment)

## SE with several groups, useful for PCA and many pairs of t-tests
set.seed(123)
recapSE1 <- simulate_proteomics_data(
    n = 1550,
    p = 5,
    prop_outliers = 0.01,
    group = c("CTRL", "DRUGA", "DRUGB", "DRUGC"),
    log_transform = FALSE,
    impute = "knn")
assay(recapSE1)[, 1] <- assay(recapSE1)[, 1] * 2
assay(recapSE1)[, 4] <- assay(recapSE1)[, 1] * 1.5
assay(recapSE1)[, 7] <- assay(recapSE1)[, 1] * 0.9
assay(recapSE1)[, 11] <- assay(recapSE1)[, 1] * 0.85
assay(recapSE1)[, 15] <- assay(recapSE1)[, 1] * 1.2
assay(recapSE1)[, 16] <- assay(recapSE1)[, 1] * 0.9
assay(recapSE1)[, 19] <- assay(recapSE1)[, 1] * 0.7
save(recapSE1, file = "../../data/recapSE1.rda")

## SE to identify an outlier and try t-test with/without outlier

set.seed(1234)
recapSE2 <- simulate_proteomics_data(
    n = 1550,
    p = 5,
    prop_outliers = 0.1,
    group = c("CTRL", "COND"),
    log_transform = FALSE,
    impute = "knn")

## Remove the 1 value < 0
assay(recapSE2) <- abs(assay(recapSE2))
save(recapSE2, file = "../../data/recapSE2.rda")
