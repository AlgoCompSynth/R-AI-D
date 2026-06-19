#! /usr/bin/env Rscript

# detonate on first uninstallable
options(warn=2)
already_installed <- rownames(installed.packages())
required_packages <- c(
  "DBI",
  "GA",
  "Rdpack",
  "audio",
  "av",
  "btw",
  "data.table",
  "devtools",
  "diffviewer",
  "duckdb",
  "fractional",
  "monitoR",
  "music",
  "NatureSounds",
  "numbers",
  "ollamar",
  "phonTools",
  "rstudiothemes",
  "seewave",
  "shinychat",
  "signal",
  "soundecology",
  "soundgen",
  "tinytex",
  "tuneR",
  "warbleR"
)
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()
