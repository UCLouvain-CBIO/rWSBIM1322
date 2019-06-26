.onAttach <- function(libname, pkgname) {
    packageStartupMessage(paste("\nThis is 'rWSBIM1322' version",
                                utils::packageVersion("rWSBIM1322"), "\n"))
}
