#!/bin/bash
set -e
set -o pipefail
Linter=${INPUT_LINTER:-proselint}

exit_code=0

find . -type f -name "*.md" | while IFS= read -r file; do
	echo "Linting $file with $LINTER"
	if [ "$LINTER" = "proselint" ]; then
		proselint "$file" || exit_code=1
	else
		write-good "$file" || exit_code=1
	fi
done

exit $exit_code
