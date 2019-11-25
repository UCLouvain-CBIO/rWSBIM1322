#' @import graphics
blank_plot <- function() {
    plot(1:10, 1:10, type = "n",
         xaxt = "n", yaxt = "n",
         xlab = "", ylab = "",
         bty = "n")
}

quant_data <- function() {
    rect(1, 1, 9, 9)
    segments(2:8, rep(1, 6),
             2:8, rep(9, 6))
    segments(rep(1, 6), 2:8,
             rep(9, 6), 2:8)
}

quant_data_2 <- function() {
    rect(1, 7, 9, 9)
    segments(1, 8, 9, 8)
    segments(2:8, rep(7, 7),
             2:8, rep(9, 7))
}

ul_input <- function(main = "Clustering (input)") {
    blank_plot()
    title(main = main)
    quant_data()
}

ul_output <- function() {
    ul_input(main = "")
    title(main = "Clustering (output)")
    rect(9.2, 1, 10.2, 2, col = "red")
    rect(9.2, 2, 10.2, 3, col = "steelblue")
    rect(9.2, 3, 10.2, 4, col = "steelblue")
    rect(9.2, 4, 10.2, 5, col = "green")
    rect(9.2, 5, 10.2, 6, col = "green")
    rect(9.2, 6, 10.2, 7, col = "red")
    rect(9.2, 7, 10.2, 8, col = "green")
    rect(9.2, 8, 10.2, 9, col = "steelblue")
}

ul_summary <- function() {
    par(mfrow = c(1, 2))
    ul_input()
    ul_output()
}

dr_input <- function(main = "Dimensionality reduction (input)") {
    blank_plot()
    title(main = main)
    quant_data()
}

dr_output <- function(main = "Dimensionality reduction (input)") {
    blank_plot()
    title(main = "Dimensionality reduction (output)")
    quant_data_2()
}

dr_summary <- function() {
    par(mfrow = c(1, 2))
    dr_input()
    dr_output()
}

ht_input <- function(main = "Hypothesis testing (input)") {
    blank_plot()
    title(main = main)
    quant_data()
    rect(1, 9.2, 5, 10.2, col = "orange")
    rect(5, 9.2, 9, 10.2, col = "steelblue")
}

ht_output <- function() {
    ht_input(main = "")
    title(main = "Hypothesis testing (output)")
    rect(9.2, 1, 10.2, 2)
    rect(9.2, 2, 10.2, 3)
    rect(9.2, 3, 10.2, 4)
    rect(9.2, 4, 10.2, 5)
    rect(9.2, 5, 10.2, 6)
    rect(9.2, 6, 10.2, 7)
    rect(9.2, 7, 10.2, 8)
    rect(9.2, 8, 10.2, 9)
}


ht_summary <- function() {
    par(mfrow = c(1, 2))
    ht_input()
    ht_output()
}

sl_input_cols <- function(main = "Classification (input)") {
    blank_plot()
    title(main = main)
    quant_data()
    rect(1, 9.2, 2, 10.2, col = "orange")
    rect(2, 9.2, 3, 10.2, col = "steelblue")
    rect(5, 9.2, 6, 10.2, col = "steelblue")
    rect(8, 9.2, 9, 10.2, col = "orange")
}

sl_output_cols <- function() {
    sl_input_cols(main = "")
    title(main = "Classification (output)")
    rect(3, 9.2, 4, 10.2, col = "#FFA50430")
    rect(4, 9.2, 5, 10.2, col = "#4582B430")
    rect(6, 9.2, 7, 10.2, col = "#FFA50430")
    rect(7, 9.2, 8, 10.2, col = "#4582B430")
}

sl_cols_summary <- function() {
    par(mfrow = c(1, 2))
    sl_input_cols()
    sl_output_cols()
}

sl_input_rows <- function(main = "Classification (input)") {
    blank_plot()
    title(main = main)
    quant_data()
    rect(9.2, 1, 10.2, 2, col = "red")
    ## rect(9.2, 2, 10.2, 3, col = "steelblue")
    rect(9.2, 3, 10.2, 4, col = "steelblue")
    ## rect(9.2, 4, 10.2, 5, col = "green")
    rect(9.2, 5, 10.2, 6, col = "green")
    rect(9.2, 6, 10.2, 7, col = "red")
    ## rect(9.2, 7, 10.2, 8, col = "green")
    rect(9.2, 8, 10.2, 9, col = "steelblue")
}

sl_output_rows <- function() {
    sl_input_rows(main = "")
    title(main = "Classification (output)")
    ## rect(9.2, 1, 10.2, 2, col = "red")
    rect(9.2, 2, 10.2, 3, col = "#4582B430")
    ## rect(9.2, 3, 10.2, 4, col = "steelblue")
    rect(9.2, 4, 10.2, 5, col = "#00FF0030")
    ## rect(9.2, 5, 10.2, 6, col = "green")
    ## rect(9.2, 6, 10.2, 7, col = "red")
    rect(9.2, 7, 10.2, 8, col = "#00FF0030")
    ## rect(9.2, 8, 10.2, 9, col = "steelblue")
}

sl_rows_summary <- function() {
   par(mfrow = c(1, 2))
    sl_input_rows()
    sl_output_rows()
}

sl_summary <- function() {
    par(mfrow = c(2, 2))
    sl_input_cols()
    sl_output_cols()
    sl_input_rows()
    sl_output_rows()
}
