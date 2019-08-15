library("Hiiragi2013")
data("x", package = "Hiiragi2013")

hiiragi2013df1 <- data.frame(t(Biobase::exprs(x)), pData(x))
cn <- c("X1426642_at", "X1418765_at", "X1420085_at", "X1418863_at",
        "X1425463_at", "X1416967_at", names(pData(x)))
hiiragi2013df1 <- hiiragi2013df1[, cn]
save(hiiragi2013df1, file = "../../data/hiiragi2013df1.rda",
     compress = "xz", compression_level = 9)


dfx <- as.data.frame(Biobase::exprs(x))
hiiragi2013df2 <- dfx[, c("59 E4.5 (PE)", "92 E4.5 (FGF4-KO)")]
save(hiiragi2013df2, file = "../../data/hiiragi2013df2.rda",
     compress = "xz", compression_level = 9)
