#' CPTAC data
#'
#' The data stems from the 6th study of the Clinical Proteomic Technology
#' Assessment for Cancer (CPTAC). The authors spiked the Sigma Universal Protein
#' Standard mixture 1 (UPS1) containing 48 different human proteins in a protein
#' background of 60 ng/microL Saccharomyces cerevisiae strain BY4741. Two
#' different spike-in concentrations were used: 6A (0.25 fmol UPS1
#' proteins/microL) and 6B (0.74 fmol UPS1 proteins/microL). In this suset, we
#' limited ourselves to the data of LTQ-Orbitrap W at site 56. The data were
#' searched with MaxQuant version 1.5.2.8, and detailed search settings were
#' described in Goeminne et al. (2016). Three replicates peptide quantitation
#' data are available for each concentration.
#'
#' The data are available as `MSnSet` or `SummarizedExperiment` objects.
#'
#' See the proteomics tutorial from the Bioinformatics Summer School 2019
#' (https://lgatto.github.io/bioc-ms-prot/bss-lab.html) for scripts on how these
#' data were processed.
#'
#' @md
#' @rdname cptac
#' @aliases cptac_se cptac_prot cptac_se_prot
#'
#' @examples
#' library("MSnbase")
#' data(cptac)
#' cptac
#'
#' ## data processing
#' library("magrittr")
#' cptac_prot <- cptac %>%
#'    log(base = 2) %>%                    ## log2 transformation
#'    normalise(method = "quantiles") %>%  ## normalisation
#'    combineFeatures(fcol = "Proteins",   ## peptide aggregation
#'                    method = "robust",
#'                    na.rm = TRUE)
#' cptac_prot
#'
#' ## To load a subset of that protein-level data
#' data(cptac_prot)
#' cptac_prot
#'
#' ## Same data as SummarizedExperiment object
#' library("SummarizedExperiment")
#' data(cptac_se)
#' cptac_se
#' data(cptac_se_prot)
#' cptac_se_prot
"cptac"


#' Example data for t-tests illustration
#'
#' See `scripts/randata.R` for how these data were generated.
#'
#' @md
#'
#' @aliases tdata2 tdata3 tdata4
#'
#' @examples
#' data(tdata1)
#' head(tdata1)
#'
#' data(tdata2)
#' tdata2
#'
#' data(tdata3)
#' tdata3
#'
#' data(tdata4)
#' tdata4
"tdata1"

#' Example data for PCA illustration
#'
#' See `man/xy.R` for how these data were generated. `xy` is scaled,
#' `xy0` is the orginal data.
#'
#' @md
#'
#' @aliases xy0
#'
#' @examples
#' data(xy)
#'
#' xy0
#'
#' xy
#' pca <- prcomp(xy)
#' summary(pca)
#' plot(pca)
#' biplot(pca)
"xy"

#' Metabolomics data (from MSMB)
#'
#' This data comes from the Modern *Statistics for Modern Biology* book and was
#' originally called `mat1` from the `mat1xcms.RData` file. It contains
#' quantitation data for 399 metabolites and 6 knock-out and 6 wild-type
#' samples.
#'
#' @md
#' @examples
#' data(metab1)
#'
#' dim(metab1)
#' metab1[1:10, 1:3]
"metab1"


#' Expression data
#'
#' This data is a copy of the `iris` data, reframed for biomedical
#' course. It illustrates the expression of 4 genes, BRCA1, BRCA2,
#' TP53 and A1CF, in 150 patients, that have been categorised in 3
#' catégories, A, B and C.
#'
#' @md
#'
#' @examples
#' head(giris)
#' pairs(giris, col = giris$GRADE)
