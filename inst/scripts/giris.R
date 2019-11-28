utils::data(iris, package = "datasets")
giris <- iris
names(giris) <- c("BRCA1", "BRCA2", "TP53", "A1CF", "GRADE")
levels(giris$GRADE) <- LETTERS[1:3]

save(giris, file = "../../data/giris.rda")

set.seed(321)
n <- 100
i <- sample(150, n)
unlab <- giris[i, 1:4]
unlab[, 1] <- unlab[, 1] + rnorm(n, 0, 0.4)
unlab[, 2] <- unlab[, 2] + rnorm(n, 0, 0.3)
unlab[, 3] <- unlab[, 3] + rnorm(n, 0, 0.5)
unlab[, 4] <- unlab[, 4] + rnorm(n, 0, 0.05)
unlab$GRADE <- NA
rownames(unlab) <- (nrow(giris) + 1):(nrow(giris) + n)
giris2 <- rbind(giris, unlab)


save(giris2, file = "../../data/giris2.rda")
