#!/bin/bash
set -e
Linter=${INPUT_LINTER:-proselint}

find . -type f -name "*.md" | while IFS= read -r file; do
	echo "Linting $file with $LINTER"
	if ["$LINTER" = "proselint" ]; then
		proselint "$file" || exit_code=$?
	else
		write-good "$file" || exit_code=$?
	fi
done

exit ${exit_code:-0}
