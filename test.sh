#!/bin/bash

# Example script for shellcheck testing

# Define a variable (shellcheck will warn about this unused variable)
name="ShellCheck Test"

# Missing quotes around variable (shellcheck will suggest adding quotes)
echo Hello, $name

# Useless use of cat (shellcheck will recommend avoiding cat in this way)
cat /etc/os-release | grep "NAME"

# Using 'ls' without specifying an option, which shellcheck will flag for potential issues
for file in $(ls); do
    echo "Found file: $file"
done

# Empty if statement (shellcheck will recommend removing or adding logic)
if [ "$name" = "test" ]; then
    # Do nothing
fi
