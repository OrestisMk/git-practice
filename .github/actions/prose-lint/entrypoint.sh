#!/bin/bash

set -e

# Get the chosen linter (proselint or write-good)
LINTER=${INPUT_LINTER:-proselint}

# Find all .md files and run the selected linter on each
for file in $(find . -type f -name "*.md"); do
  echo "Linting $file with $LINTER"
  if [ "$LINTER" = "proselint" ]; then
    proselint "$file" || exit_code=$?
  else
    write-good "$file" || exit_code=$?
  fi
done

exit ${exit_code:-0}
