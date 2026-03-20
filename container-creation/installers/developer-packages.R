#! /usr/bin/env Rscript

# tools I use for R package development / documentation
# see https://r-pkgs.org/

print("** R Developer Packages **")
# detonate on first uninstallable
options(warn=2)
already_installed <- rownames(installed.packages())
required_packages <- c(
  "data.table",
  "devtools",
  "distill",
  "ellmer",
  "mcptools",
  "ollamar",
  "quarto",
  "ragnar",
  "Rdpack",
  "reticulate",
  "rmarkdown",
  "shiny",
  "shinychat",
  "tinytex",
  "vitals"
)
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()
print("** Finished R Developer Packages **")
