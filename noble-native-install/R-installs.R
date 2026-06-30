#! /usr/bin/env Rscript

# detonate on first uninstallable
update.packages(ask = FALSE, repos = "https://cloud.r-project.org/")

options(warn=2)
already_installed <- rownames(installed.packages())
required_packages <- c(
  "bslib",
  "btw",
  "data.table",
  "devtools",
  "duckdb",
  "ellmer",
  "fractional",
  "knitr",
  "markdown",
  "numbers",
  "ollamar",
  "pkgdown",
  "quarto",
  "Rdpack",
  "rmarkdown",
  "shiny",
  "shinychat",
  "testthat",
  "tinytex",
  "tuneR",
  "withr"
)
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()
