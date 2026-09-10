#!/usr/bin/env bash
# Uso: ./compile.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT/src"

mkdir -p "$ROOT/build"

latexmk \
  --pdf \
  --lualatex \
  --interaction=nonstopmode \
  --halt-on-error \
  "plano_trabalho.tex"

cp -f plano_trabalho.pdf "$ROOT/build/plano_trabalho.pdf"
echo ""
echo "✔ PDF gerado: build/plano_trabalho.pdf"
