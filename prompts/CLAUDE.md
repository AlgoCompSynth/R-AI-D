# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the **R-AI-D** (R AI Development) project - a Distrobox-based container environment for R development with AI/ML tooling (Ollama, FAUST, etc.). The repository contains Bash scripts and R scripts for provisioning and managing containerized development environments with Podman/Distrobox.

## Directory Structure

```
R-AI-D/
├── container-creation/
│   ├── Containerfile.base        # Dockerfile for base Ubuntu+R+Ollama image
│   ├── 1-squash-base-image.sh    # Builds the base container image
│   ├── 2-create-distrobox.sh     # Creates and configures the Distrobox container
│   ├── set_container_envars      # Environment variables for container creation
│   ├── installers/               # Scripts run during container image build
│   │   ├── r-devel-base.sh       # Installs R and development packages
│   │   ├── developer-packages.R  # R packages for AI/ML work (ollamar, ellmer, etc.)
│   │   ├── ollama.sh             # Ollama installation
│   │   └── cuda.sh               # CUDA toolkit installation
│   └── Scripts/                  # Scripts copied into container for user setup
│       ├── set_script_envars     # Environment variables for scripts
│       ├── 1_command_line_setup.sh
│       ├── linuxbrew.sh
│       ├── starship.sh
│       ├── coding-assistants.sh
│       ├── nerd-fonts.sh
│       ├── small_models.sh
│       ├── medium_models.sh
│       └── large_models.sh       # Ollama model downloads
└── prompts/                      # AI agent configuration (this file)
```

## Common Commands

### Build and Create Container

```bash
cd container-creation

# Build the base image (with R, Ollama, FAUST)
./1-squash-base-image.sh

# Create Distrobox container and run initial setup
./2-create-distrobox.sh
```

### Enter Container

```bash
# The entry script is created at ~/.local/bin/R-AI-D-CUDA (or R-AI-D-CPU)
~/.local/bin/R-AI-D-CUDA

# Or use distrobox directly
distrobox enter R-AI-D-CUDA
```

### Pull AI Models (from inside container)

```bash
bash ~/Scripts/small_models.sh    # 1-2 GB models
bash ~/Scripts/medium_models.sh   # 2-5 GB models
bash ~/Scripts/large_models.sh    # 5+ GB models (qwen3.5:27b, deepseek-r1:32b, etc.)
```

### Install Development Tools (from inside container)

```bash
bash ~/Scripts/linuxbrew.sh       # Install Homebrew for Linux
bash ~/Scripts/starship.sh        # Starship prompt
bash ~/Scripts/coding-assistants.sh  # opencode, codex, claude-code
bash ~/Scripts/nerd-fonts.sh      # Nerd fonts
```

## Architecture

### Base Image (Containerfile.base)

- **Base**: `quay.io/toolbx/ubuntu-toolbox:24.04`
- **WORKDIR**: `/usr/local/src/workdir`
- Installs R development environment via `r-devel-base.sh`
- Installs R packages via `developer-packages.R` (devtools, quarto, ollamar, ellmer, reticulate, shinychat, etc.)
- Installs Ollama via `ollama.sh`
- Logs are compressed to `.log.gz` in WORKDIR

### Distrobox Container

- Created with `distrobox create` via `2-create-distrobox.sh`
- Mounts `~/.ollama` from host to `/usr/share/ollama/.ollama` in container
- Supports NVIDIA GPU via `--device=nvidia.com/gpu=all`
- Entry script enables `ollama.service` and drops into container shell

### Environment Detection

The `set_container_envars` script auto-detects:
- **ARCH**: `x86_64` or `aarch64`
- **COMPUTE_MODE**: `CUDA` (if nvidia-smi found) or `CPU`
- Container name becomes `R-AI-D-CUDA` or `R-AI-D-CPU`

## Script Patterns

### Error Handling

```bash
#! /usr/bin/env bash
set -e  # Exit on first error
```

### Idempotency (check before install)

```bash
if [[ "$(which brew | wc -l)" == "0" ]]
then
  echo "Installing Linuxbrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Linuxbrew is installed"
fi
```

### Logging

```bash
export LOGFILES=$HOME/Logfiles
export LOGFILE=$LOGFILES/<script-name>.log
# Redirect output: command >> $LOGFILE 2>&1
```

### Environment Variables

Source `set_script_envars` in scripts to get:
- `LOCALBIN` = `$HOME/.local/bin`
- `LOGFILES` = `$HOME/Logfiles`
- `SCRIPTS` = `$HOME/Scripts`
- `PROJECTS` = `$HOME/Projects`

## R Script Pattern (developer-packages.R)

```r
#! /usr/bin/env Rscript
options(warn=2)  # Warnings as errors
already_installed <- rownames(installed.packages())
to_install <- setdiff(required_packages, already_installed)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()
```

## Key R Packages

The container includes AI/ML packages:
- `ollamar` - Ollama R client
- `ellmer` - LLM interface
- `reticulate` - Python/R integration
- `shinychat` - Chat UI for Shiny
- `quarto` - Scientific publishing
- `devtools`, `Rdpack` - Package development
- `tinytex` - TeX/LaTeX support

## Ollama Models

Scripts organize models by size:
- **Small** (`small_models.sh`): phi4, gemma3, etc. (~2GB)
- **Medium** (`medium_models.sh`): qwen3.5:8b, llama3.2 (~5GB)
- **Large** (`large_models.sh`): qwen3.5:27b, deepseek-r1:32b, cogito:32b, glm-4.7-flash (10+ GB)

Models persist in `~/.ollama` on host, mounted into container.

## Safety Notes

- Scripts use `set -e` for fail-fast behavior
- No destructive operations (no `rm -rf /`)
- Container scripts run in isolated environment
- Use `sudo` only where explicitly required
- Check log files in `~/.local/bin/logfile.log` for debugging

## Tips for Claude Code

- When modifying scripts, preserve the `#! /usr/bin/env bash` shebang and `set -e`
- Scripts in `Scripts/` are copied into the container by `2-create-distrobox.sh`
- Environment variables should be sourced from `set_script_envars`
- Container image is rebuilt with `1-squash-base-image.sh` (uses `--squash-all`)
- Check git status before committing: `git status` shows modified scripts

## Troubleshooting

- **Podman not found**: `sudo dnf install podman` (Fedora)
- **GPU access denied**: Ensure NVIDIA drivers installed, check `nvidia-smi`
- **Model pull fails**: Check internet connectivity, restart `ollama serve`
- **Script fails**: Check `~/.local/bin/<script>.log` for details