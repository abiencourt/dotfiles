#!/bin/bash

echo "----- start: 02-package-manager.sh -----"
if command -v pacman >/dev/null 2>&1; then
    if ! command -v yay >/dev/null 2>&1; then
        mkdir -p ~/Coding/Personal
        cd ~/Coding/Personal || exit 1

        git clone https://aur.archlinux.org/yay.git
        cd yay || exit 1
        makepkg -si
        cd ../
        rm -rf yay
        yay -Y --gendb
        yay -Syu --devel
        yay -Y --devel --save

        # Make yay/pacman colourful
        sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
    else
        echo "yay is already installed"
    fi
fi
echo "----- end: 02-package-manager.sh -----"
