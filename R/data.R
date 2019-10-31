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
#' @aliases cptac_se
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
#' library("SummarizedExperiment")
#' data(cptac_se)
#' cptac_se
"cptac"


#' Example data for t-tests illustration
#'
#' See `scripts/randata.R` for how these data were generated.
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
