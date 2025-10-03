#!/bin/bash
set -e

if [ $# -lt 1 ]; then
    echo "Usage: latex_setup.sh <file.tex>"
    exit 1
fi

TEX_FILE="$1"

if [ ! -f "$TEX_FILE" ]; then
    echo "Error: File $TEX_FILE not found."
    exit 1
fi

TEX_DIR=$(dirname "$TEX_FILE")
BASENAME=$(basename "$TEX_FILE")

echo "Compiling $TEX_FILE..."
pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$TEX_DIR" "$TEX_FILE"

echo "Done. PDF created at $TEX_DIR/${BASENAME%.tex}.pdf"
