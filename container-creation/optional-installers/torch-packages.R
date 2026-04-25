#! /usr/bin/env Rscript

# tools I use for R package development / documentation / AI
# see https://r-pkgs.org/

print("** R Torch Packages **")
# detonate on first uninstallable
options(warn=2)
already_installed <- rownames(installed.packages())
required_packages <- c(
  "luz",
  "torch",
  "torchaudio",
  "torchvision"
)
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()

torch::install_torch()

print("** Finished R Torch Packages **")
