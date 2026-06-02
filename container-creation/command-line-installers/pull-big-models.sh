#! /usr/bin/env bash

set -e

ollama --version

for model in \
	gemma4:31b \
	qwen3.6:27b

do
	/usr/bin/time ollama pull $model

done

ollama list
