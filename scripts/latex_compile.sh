#!/bin/bash
set -e

if [ $# -lt 1 ]; then
    echo "Usage: latex_compile.sh <file.tex>"
    exit 1
fi

TEX_FILE="$1"

if [ ! -f "$TEX_FILE" ]; then
    echo "Error: File $TEX_FILE not found."
    exit 1
fi

TEX_DIR=$(dirname "$TEX_FILE")
BASENAME=$(basename "$TEX_FILE")
OUTPUT_DIR="$TEX_DIR/compile-output"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Compiling $TEX_FILE..."
pdflatex -interaction=nonstopmode -halt-on-error -output-directory="$OUTPUT_DIR" "$TEX_FILE"

echo "Done. PDF created at $OUTPUT_DIR/${BASENAME%.tex}.pdf"
