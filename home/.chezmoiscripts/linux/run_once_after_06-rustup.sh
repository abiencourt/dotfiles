#!/bin/bash

echo "----- start: 06-rustup.sh -----"

if [[ -f "$HOMEBREW_PREFIX/bin/rustup-init" ]]; then
    echo "Installing rustup..."
    rustup-init --no-modify-path -y
else
    tput setaf 3
    echo "No rustup-init found, impossible to install rustup" | tee -a /tmp/chezmoi_warnings.log
    tput sgr0
fi

echo "----- end: 06-rustup.sh -----"
