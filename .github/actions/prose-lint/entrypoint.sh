#!/bin/bash

set -e
set -o pipefail  # Make sure any error in a pipeline causes the script to fail

# Get the chosen linter (proselint or write-good)
LINTER=${INPUT_LINTER:-proselint}

# Initialize exit code
exit_code=0

# Find all .md files and run the selected linter on each
find . -type f -name "*.md" | while IFS= read -r file; do
  echo "Linting $file with $LINTER"
  
  if [ "$LINTER" = "proselint" ]; then
    proselint "$file"
    exit_code=$?  # Capture the exit code after running proselint
  else
    write-good "$file"
    exit_code=$?  # Capture the exit code after running write-good
  fi
  
  if [ $exit_code -ne 0 ]; then
    echo "Linter failed for $file"
  fi
done

exit $exit_code  # Return the captured exit code
