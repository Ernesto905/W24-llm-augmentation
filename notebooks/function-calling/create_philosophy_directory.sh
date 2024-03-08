#!/bin/bash

# Create the directory if it does not exist.
mkdir -p philosophy_docs

# Function to download a file if it does not exist.
download_if_not_exist() {
  local url=$1
  local file="philosophy_docs/$2"

  if [ ! -f "$file" ]; then
    wget -O "$file" "$url"
  else
    echo "The file $file already exists, skipping download."
  fi
}

# Usage: download_if_not_exist "URL" "filename.html"

download_if_not_exist "https://plato.stanford.edu/entries/epistemology/index.html" "epistemology.html"
download_if_not_exist "https://plato.stanford.edu/entries/moral-theory/index.html" "moral-theory.html"
download_if_not_exist "https://plato.stanford.edu/entries/metaphysics/index.html" "metaphysics.html"
download_if_not_exist "https://plato.stanford.edu/entries/linguistics/index.html" "linguistics.html"
download_if_not_exist "https://plato.stanford.edu/entries/value-theory/index.html" "axiology.html"
download_if_not_exist "https://plato.stanford.edu/entries/aesthetic-concept/index.html" "aesthetics.html"
download_if_not_exist "https://plato.stanford.edu/entries/philosophy-religion/index.html" "theology.html"
download_if_not_exist "https://plato.stanford.edu/entries/authority/index.html" "political-philosophy.html"

