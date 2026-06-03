#! /usr/bin/env bash

set -e

ollama --version

for model in \
	gemma4:31b-it-q4_K_M \
	granite4.1:30b-q5_1 \
	qwen3.6:27b-mtp-q4_K_M

do
	/usr/bin/time ollama pull $model

done

ollama list
