#!/bin/bash

echo "----- start: 04-neovim-post-install.sh -----"
echo "Installing pynvim..."
python3 -m pip install --user --upgrade pynvim
echo "Done installing pynvim"
echo "Install npm neovim"
npm -g install neovim
echo "Done installing neovim"
echo "----- end: 04-neovim-post-install.sh -----"
