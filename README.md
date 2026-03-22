# R-AI-D: R AI Distrobox

## Introduction

R-AI-D is the latest incarnation of my main scientific computing toolset.
I built it as a tool for exploring AI as applied to scientific applications
programming in general and audio analysis in particular.

Software bill of materials:

- Linux: Ubuntu 24.04 LTS "Noble Numbat". I plan to upgrade to 26.04 when
Canonical release their upgrade-in-place.

- R: I'm using the
[bspm: Bridge to System Package Manager](https://cran4linux.github.io/bspm/)
to install R, a selection of tools for package development, and a selection
of tools for audio processing.

- Command line: I'm using a few packages from the Ubuntu repositories but
the bulk of the command line utilities come from
[Homebrew](https://cran4linux.github.io/bspm/). Most notably I'm using the
[Starship](https://starship.rs/) cross-shell prompt generator and the
[Cascaydia Cove nerd font](https://www.nerdfonts.com/).

- AI: The
[Ollama](https://docs.ollama.com/) framework for managing local large language
models, and the
[OpenCode](https://opencode.ai/), [Codex](https://openai.com/codex/) and
[Claude CLI](https://www.claudecli.org/) command line coding assistants.

## Distrobox

I developed and maintain R-AI-D on a desktop system running
[Bluefin DX](https://projectbluefin.io). Bluefin DX is a variant of Linux
designed for container-based developer workflows.
[Distrobox](https://distrobox.it/) is one of the workflows available.

A distrobox is a container that runs in a Linux container host system. It uses
the host's Linux kernel, network, display, audio, and USB devices, and it can
use the host's GPU if there is one. 

A distrobox can also read from and write to the user's home directory. This has
both conveniences and annoyances. It's convenient because the distrobox can use
your data and code just like your host can. It's annoying because the operating
system running in the distrobox may not be the same as the one in the host! 

In particular, the Bluefin OS is based on Fedora or CentOS Stream, whilst R-AI-D
is based on Ubuntu; the defaults for `.bashrc` and other dotfiles in your home
directory are different. Fortunately, Distrobox provides an option for a 
container-managed home directory at create time, and R-AI-D uses it.

## What if I don't have Bluefin?

I've included a set of scripts to set up container hosting on systems that use
the `apt` package management system. I have a Raspberry Pi 5 that I test these
on. but they should work on Ubuntu 24.04 and later and Debian 13; like R-AI-D,
they get most of their binary packages from Homebrew. Then again, Bluefin is
cool and has dinosaurs.

## Licensing, contributing, etc.

R-AI-D uses the
[Creative Commons CC0](https://creativecommons.org/public-domain/cc0/) license,
which is a bunch of words that say mostly "it's public domain." R-AI-D is just
some `bash` scripts that download some open source software and build it into
a container. Why would I copyright that?

Contributing? Forks,
[bug reports and feature requests](https://github.com/AlgoCompSynth/R-AI-D/issues/new)
are welcome. Pull requests, on the other hand, probably not. I don't have the time
to review other peoples' code beyond fixing typos. Hosting for Fedora, CentOS Stream,
Arch Linux and openSUSE Tumbleweed is something I know how to do; if someone requests
it I'll do it but I don't have a use case for those at the moment.

Another thing I know how to do and might actually use is a "native" port to Ubuntu
on Windows Subsystem for Linux.
