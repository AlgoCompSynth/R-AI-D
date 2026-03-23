#! /usr/bin/env bash

set -e

echo ""
ollama list | sort -nr -k 3
echo ""
