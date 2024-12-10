#!/bin/bash

echo "----- start: 20-nvim-update.sh -----"

if [[ -f $HOME/.config/nvim/lazy-lock.json ]]; then
    echo "Updating Neovim plugins to the state in the lockfile..."
    if [[ -x "$(command -v npm)" ]]; then
        nvim --headless "+Lazy! restore" +qa
        echo "Updating Mason tools..."
        nvim --headless "+MasonToolsUpdateSync" +qa
        echo "Done updating Neovim"
    else
        echo "npm is not installed. npm is required by Mason"
    fi
else
    echo "lazy-lock.json does not exist, impossible to update Neovim plugins"
fi

echo "----- end: 20-nvim-update.sh -----"
