# R-AI-D - R AI Distrobox

## Introduction

R-AI-D is a [Distrobox](https://distrobox.it/) pet container for
artificially intelligent sound analysis and synthesis. R-AI-D features:

- the Ubuntu 24.04 LTS "Noble Numbat" operating system,
- the R programming language,
- R packages for package development: <https://r-pkgs.org/>,
- R packages for sound analysis and synthesis:
  <https://link.springer.com/book/10.1007/978-3-319-77647-7>,
- R packages for interfacing with AI tools:
 <https://ellmer.tidyverse.org/>
- the [Ollama](https://docs.ollama.com/) framework for managing local
  models, and
- a modern command line including Ollama-supported coding assistants.

R-AI-D was developed on [Bluefin DX](https://projectbluefin.io), but
should run on any Linux host system supporting Distrobox. I test on a
Raspberry Pi 5, so the release includes scripts that should work on any
recent Debian or Ubuntu host. On `x86_64` systems, an NVIDIA GPU will
be detected and used automatically.

Like its Bluefix DX inspiration, the R-AI-D command line features
[Homebrew](https://brew.sh/) and the [Starship](https://starship.rs/)
cross-shell prompt generator. The
[Cascaydia Cove nerd font](https://www.nerdfonts.com/) is included and
other nerd fonts are available. The Ollama-launchable coding assistants
[OpenCode](https://opencode.ai/), [Codex](https://openai.com/codex/),
and [Claude CLI](https://www.claudecli.org/) are also included.

## Licensing, contributing, roadmap, etc.

R-AI-D uses the
[Creative Commons CC0](https://creativecommons.org/public-domain/cc0/)
license, which is a bunch of words that say mostly "R-AI-D is public
domain." R-AI-D is just some `bash` scripts that download some open
source software and build it into a container. Why would I copyright
that?

Contributing? Forks,
[bug reports and feature requests](https://github.com/AlgoCompSynth/R-AI-D/issues/new)
are welcome. Pull requests, on the other hand, probably not. I don't
have the time to review other peoples' code beyond fixing typos.

The roadmap is mostly determined by what I need and when. The only
feature I want to add is a "native" port to Ubuntu running in Windows
Subsystem for Linux. Hosting setup scripts for Fedora, CentOS Stream,
Arch Linux and openSUSE Tumbleweed are easy to do but I have no need
for them. If you do, open an issue and I'l put them in.

Later in my exploration of AI I will probably need some AI engineering
tools like JupyterLab, PyTorch, and CUDA, but the image is pretty big
already, so I won't add them until I need them. And the R packages
cover a lot of the bases already, such as interfacing with Ollama,
retrieval augmented generation (RAG), and model context protocol (MCP).

One final note:
[RStudio Desktop](https://posit.co/download/rstudio-desktop/)
and [Positron](https://positron.posit.co/) will run in the container
and come up on your host system. I've installed them and used them. The
reason they aren't on the image is that you need to agree to a license
to use them, so I don't think it's appropriate to download them as
part of the build process.
