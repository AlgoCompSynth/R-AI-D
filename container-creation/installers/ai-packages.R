#! /usr/bin/env Rscript

# tools I use for R package development / documentation / AI
# see https://r-pkgs.org/

print("** R AI Packages **")
# detonate on first uninstallable
options(warn=2)
already_installed <- rownames(installed.packages())
required_packages <- c(
  "ellmer",
  "localLLM",
  "mcptools",
  "ollamar",
  "ragnar",
  "shinychat",
  "vitals"
)
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()
localLLM::install_localLLM()
print("** Finished R AI Packages **")
