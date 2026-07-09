#! /usr/bin/env -S bash -l

set -eu

# https://docs.ollama.com/linux#install
if [[ "$(ollama list 2>&1 || true)" =~ "run 'ollama serve'" ]]
then
  echo "..Starting Ollama server - logfile is $HOME/Logfiles/serve-ollama.log"
  mkdir --parents $HOME/Logfiles
  ollama serve > $HOME/Logfiles/serve-ollama.log 2>&1 &
  sleep 5

fi

echo ""
echo "ollama list:"
ollama list | sort -k 3 -n
