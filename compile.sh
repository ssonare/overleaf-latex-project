#!/bin/bash

# Get the Git hash
GIT_HASH=$(./get-version.sh)
echo "Compiling with Git hash: $GIT_HASH"

# Find the main .tex file
TEX_FILE=$(find . -maxdepth 1 -name "*.tex" -type f | head -n 1)

if [ -z "$TEX_FILE" ]; then
    echo "Error: No .tex file found!"
    exit 1
fi

echo "Compiling: $TEX_FILE"

# Create a temporary file with version info
TEMP_FILE="temp_with_version.tex"
cp "$TEX_FILE" "$TEMP_FILE"

# Replace placeholders with actual values
sed -i "s/\\\\newcommand{\\\\githash}{unknown}/\\\\newcommand{\\\\githash}{$GIT_HASH}/g" "$TEMP_FILE"

# Compile with pdflatex (run twice for references)
pdflatex -interaction=nonstopmode "$TEMP_FILE" > /dev/null
pdflatex -interaction=nonstopmode "$TEMP_FILE" > /dev/null

# Get the PDF name
PDF_NAME="${TEMP_FILE%.tex}.pdf"
ORIGINAL_NAME="${TEX_FILE%.tex}.pdf"

# Rename to original name
if [ -f "$PDF_NAME" ]; then
    mv "$PDF_NAME" "$ORIGINAL_NAME"
    echo "✅ Compilation successful: $ORIGINAL_NAME"
    echo "✅ Git hash embedded: $GIT_HASH"
    
    # Cleanup auxiliary files
    rm -f temp_with_version.*
else
    echo "❌ Compilation failed!"
    pdflatex -interaction=nonstopmode "$TEMP_FILE"
    exit 1
fi
