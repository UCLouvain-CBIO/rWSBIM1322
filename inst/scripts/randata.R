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


set.seed(42)
x <- rnorm(15, 10, 2)
tdata2 <- data.frame(before = x,
                     after = x - abs(rnorm(15, 0, 0.1)),
                     row.names = paste0("patient", 1:15))

save(tdata2, file = "../../data/tdata2.rda")


tdata3 <- log2(make_data(100, 6, m = 9, sd = 2, seed = 123))
set.seed(123)
sc <- rnorm(3, 3, 0.5)
tdata3[, 4:6] <- tdata3[, 4:6] + sc
save(tdata3, file = "../../data/tdata3.rda")