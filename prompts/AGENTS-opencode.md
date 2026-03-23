# AGENTS.md

Guidelines for AI coding assistants (opencode, Claude Code, etc.) working with the R-AI-D repository.

## Build, Lint, Test Commands

This repository contains Bash scripts for provisioning an R AI Distrobox environment. There is no traditional build system, linter, or test suite.

### Running Setup Scripts

Scripts must be executed in order on the target system:

```bash
# 1. Build the base container image
cd container-creation
./1-squash-base-image.sh

# 2. Create and configure the Distrobox container
./2-create-distrobox.sh
```

### Entering the Container

```bash
# Using the entry script (created by 2-create-distrobox.sh)
~/.local/bin/R-AI-D-CUDA    # or R-AI-D-CPU for CPU-only

# Or use distrobox directly
distrobox enter R-AI-D-CUDA
```

### Running Scripts Inside Container

```bash
# Setup development tools
bash ~/Scripts/linuxbrew.sh
bash ~/Scripts/starship.sh
bash ~/Scripts/coding-assistants.sh
bash ~/Scripts/nerd-fonts.sh

# Pull AI models (by size category)
bash ~/Scripts/small_models.sh
bash ~/Scripts/medium_models.sh
bash ~/Scripts/large_models.sh
```

### Validation

- No automated tests exist
- Scripts are idempotent and safe to re-run
- Check log files for debugging (created by scripts)
- Use `set -e` in all scripts for fail-fast behavior

## Code Style Guidelines

### Bash Scripts

**Shebang and Error Handling:**

```bash
#! /usr/bin/env bash
set -e
```

- Always include shebang line with `#!/usr/bin/env bash`
- Use `set -e` to exit on first error
- Scripts should be idempotent (safe to re-run)

**Logging:**

```bash
export LOGFILES=$HOME/Logfiles
mkdir --parents $LOGFILES
export LOGFILE=$LOGFILES/<script-name>.log
```

- Log output to `$LOGFILES/<script>.log`
- Redirect stdout and stderr: `>> $LOGFILE 2>&1`
- Include descriptive echo statements for user feedback

**Commands:**

- Quote variables: `"$VAR"` prevents word splitting
- Use `mkdir --parents` for idempotent directory creation
- Prefer `--force`, `--recursive` over `-rf` for clarity
- Use `[[ ]]` for conditionals (bash-specific, safer)

**Environment Variables:**

```bash
source set_script_envars    # Load environment setup
export VAR_NAME="${VALUE}"  # Always quote export values
```

**Conditional Logic:**

```bash
if [[ "$(which brew | wc -l)" == "0" ]]
then
  # Not installed
else
  # Already installed
fi
```

- Check command existence with `which` or `command -v`
- Compare with `wc -l` to count matches

### R Scripts

**Shebang:**

```r
#! /usr/bin/env Rscript
```

**Error Handling:**

```r
options(warn=2)  # Warnings as errors
```

**Package Installation:**

```r
already_installed <- rownames(installed.packages())
to_install <- setdiff(required_packages, already_installed)
cat("\nInstalling:\n")
print(to_install)
install.packages(to_install, quiet = TRUE, repos = "https://cloud.r-project.org/")
warnings()  # Display warnings at end
```

### Containerfile Guidelines

Follow the existing `Containerfile.base` structure:

```dockerfile
FROM quay.io/toolbx/ubuntu-toolbox:24.04
LABEL maintainer="Name <email@example.com>"
USER root
WORKDIR /usr/local/src/workdir
```

- Set WORKDIR to `/usr/local/src/workdir`
- Compress logs with `gzip -9c` for artifacts
- Run installers: `COPY installers/script.sh ./` then `RUN ./script.sh 2>&1 | gzip -9c > log.gz`

### Project Structure

```
R-AI-D/
├── container-creation/
│   ├── Containerfile.base        # Dockerfile for base image
│   ├── 1-squash-base-image.sh    # Build base image
│   ├── 2-create-distrobox.sh     # Create Distrobox container
│   ├── set_container_envars      # Environment variables
│   ├── installers/               # Scripts run during image build
│   │   ├── r-devel-base.sh       # Install R
│   │   ├── developer-packages.R  # Install R packages
│   │   ├── ollama.sh             # Install Ollama
│   │   └── cuda.sh               # Install CUDA toolkit
│   └── Scripts/                  # Scripts run inside container
│       ├── set_script_envars     # Environment setup
│       ├── 1_command_line_setup.sh
│       ├── linuxbrew.sh
│       ├── starship.sh
│       ├── coding-assistants.sh
│       ├── nerd-fonts.sh
│       ├── small_models.sh
│       ├── medium_models.sh
│       └── large_models.sh
└── prompts/                      # AI agent configuration
```

### Idempotency

All scripts must be safe to run multiple times:

- Check for existing installations before installing
- Use `--parents` with `mkdir` to avoid missing parent errors
- Remove log files before re-running if needed: `rm --force $LOGFILE`
- Remove existing containers before recreating

### Naming Conventions

- Script filenames: `<number>_<description>.sh` (ordered execution)
- Log files: `<script-name>.log` or `<script-name>.log.gz`
- Environment files: `set_*_envars`
- Exported variables: `UPPER_CASE_WITH_UNDERSCORES`

### Safety

- Scripts contain no destructive operations
- Use `sudo` explicitly where required
- Temporary files stored under `$HOME/Scripts` and `$HOME/Logfiles`
- Container scripts run inside isolated environments

## Common Tasks

### Add a new apt package

Edit `container-creation/installers/r-devel-base.sh`:

```bash
sudo apt-get install -y --no-install-recommends \
  existing-package \
  new-package      # Add here
```

### Add a new R package

Edit `container-creation/installers/developer-packages.R`:

```r
required_packages <- c(
  "existing-package",
  "new-package"    # Add here
)
```

### Add a new Ollama model

Edit the appropriate model script:
- `container-creation/Scripts/small_models.sh` (~2GB)
- `container-creation/Scripts/medium_models.sh` (~5GB)
- `container-creation/Scripts/large_models.sh` (10+GB)

```bash
for model in \
  existing-model:tag \
  new-model:tag     # Add here
do
  ollama pull $model
done
```

### Add a new setup script

1. Create `container-creation/Scripts/new-script.sh`
2. Make executable: `chmod +x new-script.sh`
3. Add to `container-creation/Scripts/1_command_line_setup.sh` in the appropriate location
4. Rebuild container: `./2-create-distrobox.sh`