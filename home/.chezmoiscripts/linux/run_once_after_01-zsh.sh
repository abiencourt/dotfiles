#!/bin/bash

echo "----- start: 01-zsh.sh -----"
if [[ $SHELL != *"zsh"* ]]; then
    if [[ ! $OSTYPE == 'darwin'* && ! -x "$(command -v zsh)" ]]; then
        sudo pacman -S zsh --noconfirm
    fi
    echo "Changing shell to zsh..."
    if  ! grep -q "$(which zsh)" /etc/shells; then
        sudo sh -c "echo $(which zsh) >> /etc/shells"
    fi
    chsh -s "$(which zsh)"
    chezmoi_warnings+=("/!\ Default shell changed to zsh /!\ ")
    chezmoi_warnings+=("/!\ Log out and log back in to use zsh /!\ ")
else
    echo "zsh is already the default shell"
fi
echo "----- end: 01-zsh.sh -----"
