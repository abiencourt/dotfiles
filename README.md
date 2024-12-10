# My chezmoi dotfiles

<!-- toc -->

- [Installation](#installation)
  - [1. Homebrew](#1-homebrew)
    - [1.1. Install Homebrew and required tools](#11-install-homebrew-and-required-tools)
    - [1.2. Install dependencies](#12-install-dependencies)
  - [2. Setup ssh for GitHub](#2-setup-ssh-for-github)
    - [2.1. Create ssh key](#21-create-ssh-key)
    - [2.2. Associate the key with GitHub](#22-associate-the-key-with-github)
    - [2.3. Add the GitHub SSH key to known_host](#23-add-the-github-ssh-key-to-known_host)
  - [3. Getting started with chezmoi](#3-getting-started-with-chezmoi)
  - [4. Install node through fnm](#4-install-node-through-fnm)
  - [5. Additional steps based on OS](#5-additional-steps-based-on-os)
- [Tools](#tools)
- [To-Do](#to-do)
- [References](#references)
  - [Git multi user](#git-multi-user)

<!-- tocstop -->

## Installation

### 1. Homebrew

#### 1.1. Install Homebrew and required tools

Install the [Homebrew dependencies for Linux](https://docs.brew.sh/Homebrew-on-Linux#requirements)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Warning**: Make sure to follow the steps in "next steps" displayed after the installation.

#### 1.2. Install dependencies

```bash
brew install jq lastpass-cli fnm
lpass login --trust USERNAME

mkdir -p ~/Coding/Personal

if [[ ! $OSTYPE == 'darwin'* ]]; then
 # Make sure yay is installed
 if [[ ! -x "$(command -v yay)" ]]; then
  cd ~/Coding/Personal
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ../
  rm -rf yay
  yay -Y --gendb
  yay -Syu --devel
  yay -Y --devel --save
 fi

 # Make yay/pacman colourful
 sudo sed -i 's/^#Color/Color/' /etc/pacman.conf

 yay -S openssh wl-clipboard flatpak zsh kitty --noconfirm
 yay -S akm --noconfirm        # great tool for kernel selection
 yay -S xmlstarlet --noconfirm # used by apdatifier

 # Install docker
 yay -S docker docker-compose --noconfirm
 systemctl enable --now docker
 sudo usermod -aG docker $USER
 newgrp docker # switch to docker group straight away

 # Additional tools from the AUR
 yay -S naps2-bin windsurf-bin postman-bin android-studio

 # Sway dependencies
 # yay -S sway rofi swayidle waybar playerctl kanshi light swaync
 # swaybg swaylock kvantum waybar-updates bluetuith swappy cliphist inotify-tools catppuccin-gtk-theme-macchiato ttf-roboto-mono-nerd ttf-roboto-mono

 # hyprland dependencies
 yay -S hyprland xdg-desktop-portal-hyprland wofi swaync --noconfirm
 yay -S grimblast-git swappy showmethekey wf-recorder --noconfirm # Need to implement shortcuts in hyprland
 yay -S waybar ttf-roboto-mono-nerd ttf-roboto-mono hyprland-autoname-workspaces-git waybar-updates bluetuith --noconfirm
 yay -S hyprlock hypridle kanshi --noconfirm # To finish
 # to review: waybar-mpris swww

 # Delete the swaync systemd, otherwise it clashes with KDE plasma notification service
 systemctl --user disable --now swaync
 sudo rm /usr/lib/systemd/user/swaync.service

 cargo install pokeget
 cargo install cargo-update # used by topgrade

 # theme: install and run both nwg-look and qt6ct to set as you're liking, however config should be saved already
 yay -S catppuccin-gtk-theme-macchiato nwg-look qt6ct
fi
```

### 2. Setup ssh for GitHub

#### 2.1. Create ssh key

```bash
mkdir ~/.ssh && cd $_
ssh-keygen -t ed25519 -C "adrien.goodshort@gmail.com" -f "github-agoodshort"

if [[ $OSTYPE == 'darwin'* ]]; then
    pbcopy <~/.ssh/github-agoodshort.pub # copy public key to clipboard
else
    wl-copy <~/.ssh/github-agoodshort.pub # https://neovim.io/doc/user/provider.html#provider-clipboard
fi
```

#### 2.2. Associate the key with GitHub

Add the copied key in your [GitHub Profile SSH keys](https://github.com/settings/keys).

#### 2.3. Add the GitHub SSH key to known_host

```bash
curl --silent https://api.github.com/meta |
 jq --raw-output '"github.com "+.ssh_keys[]' >>~/.ssh/known_hosts
```

### 3. Getting started with chezmoi

Install Visual Studio Code before installing `chezmoi` as `brew` will fail to install Visual Studio Code extensions during the first run.

```bash
if [[ ! -x "$(command -v code)" ]]; then

 if [[ $OSTYPE == 'darwin'* ]]; then
  brew install --cask visual-studio-code
 else
  sudo yay -S visual-studio-code-bin --noconfirm
 fi
fi

brew install chezmoi
chezmoi init --apply agoodshort
```

### 4. Install node through fnm

```bash
fnm install lts/iron
fnm use lts/iron
```

### 5. Additional steps based on OS

- [MacOS](/docs/MACOS.md)
- [Arch](/docs/ARCH.md)

## Tools

List of tools used is available in [Tools](/docs/TOOLS.md).

## To-Do

- [ ] List cargo
- [ ] Create a bootstrap script to install the brew bases and login to lastpass
- [ ] Look at Timeshift and find out how to partition properly
- [ ] Work on the format with `{{ end -}}`
- [ ] Mount [secondary drive as home folder](https://www.howtogeek.com/442101/how-to-move-your-linux-home-directory-to-another-hard-drive/)
- [ ] Change `zsh/` to `exact_zsh/`
- [ ] Finish to setup `wtfutil`
- [ ] Finish setting up required tools for `lf` previewer => <https://github.com/NikitaIvanovV/ctpv>
- [ ] Install `howdy`, follow the steps on [this page](https://forum.endeavouros.com/t/tutorial-installing-howdy-now-its-personal/38095)
- [ ] Install and configure `swww` for wallpaper
- [ ] Finish the installation of `hyprland`

![image](https://github.com/agoodshort/dotfiles/assets/33832653/f9eaa504-ca26-4b2b-bd64-a3a4da49b793)

![image](https://github.com/agoodshort/dotfiles/assets/33832653/c0a70690-0ea0-4842-890a-8b85a028b6f6)

![image](https://github.com/agoodshort/dotfiles/assets/33832653/9c983bb1-1872-4e86-b08b-51ff29c18a18)

<https://mozilla.github.io/webrtc-landing/gum_test.html> => to test screensharing features

## References

### Git multi user

- <https://gist.github.com/alejandro-martin/aabe88cf15871121e076f66b65306610>
- <https://stackoverflow.com/a/74832574/13795415>
- <https://gist.github.com/rahularity/86da20fe3858e6b311de068201d279e3>
