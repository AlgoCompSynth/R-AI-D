#! /usr/bin/env Rscript

# tools I use for R package development / documentation / AI
# see https://r-pkgs.org/

# detonate on first uninstallable
options(warn=2)
already_installed <- rownames(installed.packages())
# https://opensource.posit.co/about/ai/
# https://luisdva.github.io/llmsr-book/
required_packages <- c(
  "btw",
  "ellmer",
  "mcptools",
  "ollamar".
  "querychat",
  "ragnar",
  "rollama",
  "shinychat",
  "vitals"
)
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()
cat("\n** Finished R AI Packages **\n")
