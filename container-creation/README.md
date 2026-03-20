# Container Creation Scripts

This directory contains scripts for building and running the xen.assist container images.

## Overview

The xen.assist project uses a two-stage container build process:
1. Base image with R development environment, audio packages, and AI tools
2. Server image with user environment and configuration

## Prerequisites

- Podman installed on your system
- NVIDIA GPU drivers (for GPU acceleration)
- Sufficient disk space for container images

## Build Process

### 1. Build Base Image

```bash
./1-build-base-image.sh
```

This script builds the base container image that includes:
- R development environment
- Audio packages for music composition
- OLLAMA AI tools
- FAUST audio signal processing framework

### 2. Build Server Image

```bash
./2-build-server-image.sh <username> <password>
```

This script builds the server container image with:
- User account setup
- Configuration files
- Environment variables
- Shell scripts for initialization

### 3. Run Server Container

```bash
./3-run-server.sh
```

This script runs the xen.assist container with:
- GPU access enabled
- Host networking
- OLLAMA models volume mounted

## Environment Variables

The `set_envars` script sets up necessary environment variables:
- `CONTAINER_NAME` - Name of the container
- `BASE_IMAGE_TAG` - Base image tag
- `SERVER_IMAGE_TAG` - Server image tag
- `OLLAMA_MODELS_HOST` - Host path for OLLAMA models
- `OLLAMA_MODELS_CONTAINER` - Container path for OLLAMA models

## Container Structure

### Base Image (`Containerfile.base`)
- Ubuntu toolbox base image
- R development tools
- Audio packages
- OLLAMA installation
- FAUST compilation

### Server Image (`Containerfile.server`)
- Inherits from base image
- User account creation
- Configuration files
- Shell script setup
- Systemd initialization

## Usage

1. Build base image:
   ```bash
   ./1-build-base-image.sh
   ```

2. Build server image:
   ```bash
   ./2-build-server-image.sh myuser mypassword
   ```

3. Run container:
   ```bash
   ./3-run-server.sh
   ```

## Troubleshooting

### Common Issues
- **Podman not found**: Install Podman with `sudo dnf install podman` (Fedora) or equivalent
- **GPU access denied**: Ensure NVIDIA drivers are properly installed
- **Insufficient disk space**: Clean up old containers and images with `podman system prune`

### Debugging
- Check container logs: `podman logs xen-assist`
- Inspect container: `podman inspect xen-assist`
- Enter container shell: `podman exec -it xen-assist /bin/bash`
