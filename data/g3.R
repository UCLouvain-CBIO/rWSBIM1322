## toy example: 3 genes, 5 samples from Olga Vitek
gene1 <- c(1, 6, 2, 4, 7)
gene2 <- gene1 + 4
gene3 <- gene2/3 + c(0, 2, 0, 4, 0)
g3 <- rbind(gene1, gene2, gene3)
rm(gene1, gene2, gene3)
dimnames(g3) <- list(paste0("gene", 1:3),
                     paste0("sample", 1:5))
