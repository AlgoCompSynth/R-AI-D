#! /usr/bin/env bash

source set_container_envars

podman container start \
  --attach \
  --interactive \
  $CONTAINER_NAME
