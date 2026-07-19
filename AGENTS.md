# R-AI-D Agent Instructions

## Project Overview
R-AI-D is a Distrobox container (Ubuntu 26.04 LTS) for algorithmic music composition using R. It includes two R packages: `consonaR` and `eikosany`.

## Infrastructure & Setup
The root contains orchestration scripts to build the environment:
- Build image: `./1-build-image.sh` (builds image with Podman)
- Re-create container: `./2-re-create-distrobox.sh` (creates container with Distrobox and populates it with `bash` scripts)
- Set password: `./3-set-user-password.sh` (sets a password so user can log into RStudio Server)
- Environment variables are defined in `set-host-envars`.
- The setup process involves copying `agent-installers`, `model-pullers`, and `populate-container` into the container home directory.

## Development Conventions
Apply these rules to all R code in this repository:
- **Assignment**: Always use `<-`.
- **Piping**: Use native base-R pipe `|>`.
- **Data Handling**: Prefer `{data.table}` for data manipulation.
- **UI/Shiny**: Use Bootstrap 5 Bootswatch `darkly` theme for dashboards.
- **Documentation**: Write `roxygen2` comments immediately during implementation.

## Package Structure
- `/consonaR`: Consonance-based algorithmic composition.
- `/eikosany`: Xentonal scales and synthesis.
Each package follows standard R package structure (`R/`, `tests/`, `man/`, etc.).

## Environment Notes
- **Compute**: Support for both CPU and CUDA (NVIDIA GPU detected via `nvidia-ctk` - requires NVIDIA Container Toolkit).
- **Tooling**: Includes Ollama local inference, RStudio Server, and the `{btw}` package for AI workflows.
- **AI Integration**: Check `ollama list` inside the container to see available models.
