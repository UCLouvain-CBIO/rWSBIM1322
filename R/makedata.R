##' @title Generate data
##' 
##' @param noma `character(1)` that can be coerced into a numeric
##' 
##' @return A SummarizedExperimet
##'
##' @export
##'
##' @import SummarizedExperiment
##'
##' @import S4Vectors
##'
##' @importFrom utils data
##'
##' @examples
##' make_data("123")
make_data <- function(noma) {
    if (!is.character(noma))
        stop("'noma' must be a character.")
    stopifnot(length(noma) == 1)
    
    noma <- as.numeric(noma)
    set.seed(noma)

    ## aa <- readAAStringSet("./up.fasta.gz")
    ## names(aa) <- sub("\\|.+$", "", sub("sp\\|", "", names(aa)))
    aaf <- dir(system.file("extdata", package = "rWSBIM1322"),
               full.names = TRUE, pattern = "aanames.rds")
    aanames <- readRDS(aaf)

    ## prepare expression data
    data(cptac_se_prot, package = "rWSBIM1322", envir = environment())
    x <- cptac_se_prot
    metadata(x) <- list()

    ## change row data
    rownames(x) <- sample(aanames, nrow(x))
    rowData(x) <- DataFrame(proteins = rownames(x),
                            row.names = rownames(x))

    ## change col data
    colnames(x) <- paste0("S", 1:6)
    colData(x) <- DataFrame(row.names = colnames(x))
    x$group <- rep(c("CTRL", "DRUGA"), each = 3)
    x$replicate <- rep(1:3, 2)
    x <- x[, sample(6)]
    x <- x[sample(nrow(x)), ]

    return(x)
}
