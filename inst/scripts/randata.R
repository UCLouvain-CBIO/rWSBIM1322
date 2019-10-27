make_data <- function(n, p,
                      groups = c("A", "B"),
                      row_names = "feature",
                      m = 0, sd = 1,
                      seed = NA) {
    if (!is.na(seed))
        set.seed(seed)
    x <- matrix(rnorm(n * p, m, sd), ncol = p)    
    rownames(x) <- paste0(row_names, 1:n)
    colnames(x) <- paste0(rep(groups, each = p/2), 1:(p/2))
    2^x
}

tdata1 <- make_data(100, 6, m = 10, sd = 2, seed = 123)

save(tdata1, file = "../../data/tdata1.rda")
