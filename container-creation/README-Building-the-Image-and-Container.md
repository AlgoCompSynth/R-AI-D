Building the Image and Container
================

This directory contains scripts for building the R-AI-D image and
container.

## Prerequisites

- Distrobox and either Podman or Docker installed on your system. R-AI-D
  was developed on [Bluefin
  DX](https://projectbluefin.io "Bluefin Project Home Page"), which has
  the hosting built in, but Distrobox and Podman are available in most
  current Linux distributions. Scripts for installing hosting on the
  Raspberry Pi 5 are available in the directory `R-AI-D/hosting-setup`.
  These scripts should work on any `x86_64` / `amd54` or `aarch64` /
  `arm64` system running Debian 13 or Ubuntu 24.04 LTS.
- If you have an NVIDIA GPU, you will need the drivers. The R-AI-D image
  / container build script will detect the GPU and install the required
  software.
- Sufficient disk space for container images. The current image requires
  about 8 gigabytes. You will also need to have space for all of the
  models you will be downloading to disk.

## Build Process

### 1. Edit environment variables

There are a number of environment variables that control the building of
the image and container. They are set in the file
`set_container_envars`. Most of them can be left as is, but there are
two you will need to attend to:

- `DBX_CONTAINER_HOME_PREFIX`, which specifies where Distrobox stores
  container home directories, and
- `DBX_CONTAINER_MANAGER`, which specifies whether Distrobox will use
  Podman or Docker images and containers.

#### `DBX_CONTAINER_HOME_PREFIX`

To avoid conflicts between host and container configuration files
(“dotfiles”) in the user’s home directory, Distrobox can allocate a
separate home directory for each container it creates. This is
especially useful when the host and container run different Linux
distros, as is the case in my development environment (Bluefin DX or
Raspberry Pi 5 host, Ubuntu 24.04 LTS container).

The environment variable that controls this is called
`DBX_CONTAINER_HOME_PREFIX`; the R-AI-D container’s home directory will
be `$DBX_CONTAINER_HOME_PREFIX/R-AI-CD-CPU` or
`$DBX_CONTAINER_HOME_PREFIX/R-AI-CD-CUDA`. `DBX_CONTAINER_HOME_PREFIX`
must be an absolute path; you can put it anywhere you have read and
write permissions.

The default is `$HOME/dbx-homes` -

``` bash
export DBX_CONTAINER_HOME_PREFIX="$HOME/dbx-homes"
```

which makes moving between the container and host home directories easy.
If the directory does not exist, Distrobox will create it.

#### `DBX_CONTAINER_MANAGER`

Distrobox can use either Podman or Docker containers. The default is
Podman, as can be seen in `set_container_envars`:

``` bash
export DBX_CONTAINER_MANAGER="podman"
```

If you want to use Docker, you’ll need to install it and change `podman`
to `docker` in this environment variable definition.

### 2. Build image and container

``` bash
./create-distrobox.sh
```

This script first builds the base container image that includes:

- Ubuntu 24.04.LTS,
- R development environment, including AI interface packages,
- R packages for audio analysis and synthesis,
- Quarto,
- Faust, and
- OLLAMA AI tools

Once the image is built, the script creates the Distrobox container
`R-AI-D-${COMPUTE_MODE}`, where `COMPUTE_MODE` is either `CPU` or
`CUDA`. `COMPUTE_MODE` is automatically set to `CUDA` if the host is
`x86_64` and an NVIDIA GPU is detected; otherwise it is set to `CPU`.

The container has all of the software on the base image, plus a
dedicated container `$HOME` directory with sub-directories
`$HOME/Logfiles`, `$HOME/Projects`, `$HOME/Scripts`, plus
`$HOME/.local/bin` for storing user-specific executables.

The command line in the container features

- Homebrew,
- the Starship cross-shell prompt,
- the Ollama-launchable coding assistant `opencode`, and
- the Cascaydia Cove nerd font.

After creating the container, the script creates a startup script in the
***host*** `$HOME/.local/bin` with the name of the container, either
`R-AI-D-CPU` or `R-AI-D-CUDA`.

### 3. Running the container

Once the container is built, simply enter

``` bash
R-AI-D-CUDA
```

or

``` bash
R-AI-D-CPU
```

depending on whether you have an NVIDIA GPU or not. When you enter the
container, you will be at the container command line in the
***container*** home directory.
