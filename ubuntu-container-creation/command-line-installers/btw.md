---
client:
  provider: ollama
  model: "gemma4:31b-it-qat"
  echo: output
  base_url: "http://localhost:11434"
tools:
  - docs
  - env
  - files
  - git
  - github
  - ide
  - search
  - session
  - web
---

Follow these important style rules when writing R code:

* Prefer solutions that use {data.table}
* Always use `<-` for assignment
* Always use the native base-R pipe `|>` for piped expressions
