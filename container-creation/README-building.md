# Container Creation Scripts

This directory contains scripts for building and running the R-AI-D image
and container.

## Overview

The R-AI-D project uses a two-stage container build process:
1. Base image with R development environment, audio packages, and AI tools
2. Distrobox container with user environment and configuration

## Prerequisites

- Distrobox and Podman installed on your system. Docker can also be used.
- NVIDIA GPU drivers (for GPU acceleration), and
- Sufficient disk space for container images.

## Build Process

### 1. Edit environment variables

There are a number of environment variables that control the
building of the image and container. They are set in the file
`set_container_envars`. Most of them can be left as is, but the
two you will definitely need to attend to are

- `OLLAMA_MODELS_HOST`, which specifies where Ollama will
store downloaded models on your system, and
- `DBX_CONTAINER_HOME_PREFIX`, which specifies where Distrobox
will store the home directory for the container.

See the comments in `set_container_envars` for the details.

### 2. Build Base Image

```bash
./1-squash-base-image.sh
```

This script builds the base container image that includes:
- R development environment, including AI interface packages,
- R packages for audio analysis and synthesis, and
- OLLAMA AI tools

### 2. Create Distrobox Container

```bash
./2-create-distrobox.sh
```

This script creates the Distrobox container
`R-AI-D-${COMPUTE_MODE}` where `COMPUTE_MODE` is either `CPU`
or `CUDA`. The container has

- R and R packages for development, audio analysis / synthesis and AI,
- The Ollama server, and
- A dedicated container `$HOME` directory with
    - Directories `Logfiles`, `Projects` and `Scripts`, plus
`.local/bin` for storing user-specific executables,
    - A command line featuring Homebrew, the Starship cross-shell
prompt, Ollama-launchable coding assistants `opencode`, `codex` and
`claude`, and
    - The Cascaydia Cove nerd font.

After creating the container, the script creates a startup script
in the ***host*** `$HOME/.local/bin` with the name of the container,
either `R-AI-D-CPU` or `R-AI-D-CUDA`.

### 3. Run the Container

```bash
R-AI-D-CUDA
```

or

```bash
R-AI-D-CPU
```

These scripts make sure the Ollama server is running and then enter the container.
You will be at the container command line in whatever directory you were in
when you issued the start command.

You are in an Ubuntu 24.04 LTS container. The container has its own system files
`/usr`, `/etc`, `/opt`, and has its own `systemd` / init infrastructure.
