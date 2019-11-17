utils::data(iris, package = "datasets")
giris <- iris
names(giris) <- c("BRCA1", "BRCA2", "TP53", "A1CF", "GRADE")
levels(giris$GRADE) <- LETTERS[1:3]

save(giris, file = "../../data/giris.rda")
