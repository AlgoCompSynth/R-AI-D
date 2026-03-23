R-AI-D (R AI Distrobox) - Rtificially Intelligent Sound Analysis and
Synthesis
================

## Introduction

R-AI-D is a [Distrobox](https://distrobox.it/) pet container for
artificially intelligent sound analysis and synthesis. R-AI-D features:

- the Ubuntu 24.04 LTS “Noble Numbat” operating system,
- the R programming language (R Core Team 2026),
- bspm: Bridge to System Package Manager (Ucar 2026),
- the [Quarto](https://quarto.org/) scientific and technical publishing
  system,
- R packages for package development (H. Wickham and Bryan 2023),
- R packages for sound analysis and synthesis (Sueur 2018),
- R packages for interfacing with AI tools (Hadley Wickham et al. 2025),
- the [Ollama](https://docs.ollama.com/) framework for managing local
  models, and
- a modern command line including Ollama-supported coding assistants.

R-AI-D was developed on [Bluefin DX](https://projectbluefin.io), but
should run on any Linux host system supporting Distrobox. I test on a
Raspberry Pi 5, so the release includes scripts that should work on any
recent Debian or Ubuntu host. On `x86_64` systems, an NVIDIA GPU will be
detected and used automatically.

Like its Bluefix DX inspiration, the R-AI-D command line features
[Homebrew](https://brew.sh/) and the [Starship](https://starship.rs/)
cross-shell prompt generator. The [Cascaydia Cove nerd
font](https://www.nerdfonts.com/) is included and other nerd fonts are
available. The Ollama-launchable coding assistants
[OpenCode](https://opencode.ai/), [Codex](https://openai.com/codex/),
and [Claude CLI](https://www.claudecli.org/) are also included.

## Licensing, contributing, roadmap, etc.

R-AI-D uses the [Creative Commons
CC0](https://creativecommons.org/public-domain/cc0/) license, which is a
bunch of words that say mostly “R-AI-D is public domain.” R-AI-D is just
some `bash` scripts that download some open source software and build it
into a container. Why would I copyright that?

Contributing? Forks, [bug reports and feature
requests](https://github.com/AlgoCompSynth/R-AI-D/issues/new) are
welcome. Pull requests, on the other hand, probably not. I don’t have
the time to review other peoples’ code beyond fixing typos.

The roadmap is mostly determined by what I need and when. The only
feature I want to add is a “native” port to Ubuntu running in Windows
Subsystem for Linux. Hosting setup scripts for Fedora, CentOS Stream,
Arch Linux and openSUSE Tumbleweed are easy to do but I have no need for
them. If you do, open an issue and I’ll put them in.

Later in my exploration of AI I will probably need some AI engineering
tools like JupyterLab, PyTorch, and CUDA, but the image is pretty big
already, so I won’t add them until I need them. And the R AI packages
cover a lot of the bases already, such as interfacing with Ollama,
retrieval augmented generation (RAG), and model context protocol (MCP).

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-r-base" class="csl-entry">

R Core Team. 2026. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.
<https://www.R-project.org/>.

</div>

<div id="ref-sueur2018sound" class="csl-entry">

Sueur, J. 2018. *Sound Analysis and Synthesis with r*. Use r! Springer
International Publishing.

</div>

<div id="ref-ucar2026" class="csl-entry">

Ucar, Iñaki. 2026. *Bspm: Bridge to System Package Manager*.
<https://cran4linux.github.io/bspm/>.

</div>

<div id="ref-wickham2026" class="csl-entry">

Wickham, Hadley, Joe Cheng, Aaron Jacobs, Garrick Aden-Buie, and Barret
Schloerke. 2025. *Ellmer: Chat with Large Language Models*.
<https://ellmer.tidyverse.org>.

</div>

<div id="ref-wickham2023r" class="csl-entry">

Wickham, H., and J. Bryan. 2023. *R Packages: Organize, Test, Document,
and Share Your Code*. O’Reilly Media.
<https://books.google.com/books?id=kTHFEAAAQBAJ>.

</div>

</div>
