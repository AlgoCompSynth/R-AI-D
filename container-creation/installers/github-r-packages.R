#! /usr/bin/env Rscript

print("** GitHub R Packages **")
devtools::install_github("AlgoCompSynth/eikosany", dependencies = TRUE, build_vignettes = TRUE)
devtools::install_github("AlgoCompSynth/consonaR", dependencies = TRUE, build_vignettes = TRUE)
devtools::install_github("Computational-Cognitive-Musicology-Lab/humdrumR", dependencies = TRUE, build_vignettes = TRUE)
print("** Finished GitHub R Packages **")
