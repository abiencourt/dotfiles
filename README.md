# My chezmoi dotfiles

[![Coding time over the last 30 days](https://wakapi.dev/api/badge/abiencourt/interval:30_days/label:chezmoi?label=last%2030d)](https://wakapi.dev/)

<!-- toc -->

- [Installation](#installation)
  - [1. Homebrew](#1-homebrew)
    - [1.1. Install Homebrew and required tools](#11-install-homebrew-and-required-tools)
    - [1.2. Install required dependencies](#12-install-required-dependencies)
  - [2. Setup ssh for GitHub](#2-setup-ssh-for-github)
    - [2.1. Create ssh key](#21-create-ssh-key)
    - [2.2. Associate the key with GitHub](#22-associate-the-key-with-github)
  - [3. Login to lastpass-cli](#3-login-to-lastpass-cli)
  - [4. Getting started with chezmoi](#4-getting-started-with-chezmoi)
  - [4. Additional steps based on OS](#4-additional-steps-based-on-os)
  - [5. Configure GitHub CLI](#5-configure-github-cli)
- [Tools](#tools)
- [KDE Plasma widgets](#kde-plasma-widgets)
- [Configure fingerprint](#configure-fingerprint)
- [To-Do](#to-do)
- [References](#references)
  - [Git multi user](#git-multi-user)
  - [Mount `/home` from a partition](#mount-home-from-a-partition)

<!-- tocstop -->

## Installation

### 1. Homebrew

#### 1.1. Install Homebrew and required tools

Install the [Homebrew dependencies for Linux](https://docs.brew.sh/Homebrew-on-Linux#requirements)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> [!WARNING]
> Make sure to follow the steps in "next steps" displayed after the installation.

#### 1.2. Install required dependencies

```bash
yay -S openssh \
    wl-clipboard

brew install chezmoi \
    jq \
    lastpass-cli
```

> [!NOTE]
> To install [hyprland](https://hyprland.org/) refer to the [hyprland documentation](docs/HYPRLAND.md).

### 2. Setup ssh for GitHub

#### 2.1. Create ssh key

```bash
mkdir ~/.ssh && cd $_
ssh-keygen -t ed25519 -C "adrien@bncrt.com" -f "github-abiencourt"

# Copy the public key to clipboard
if [[ $OSTYPE == 'darwin'* ]]; then
    pbcopy <~/.ssh/github-abiencourt.pub
else
    wl-copy <~/.ssh/github-abiencourt.pub # https://neovim.io/doc/user/provider.html#provider-clipboard
fi

# Start the ssh-agent and add the key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github-abiencourt

# Add the GitHub SSH key to known_host
curl --silent https://api.github.com/meta |
jq --raw-output '"github.com "+.ssh_keys[]' >>~/.ssh/known_hosts
```

#### 2.2. Associate the key with GitHub

Add the copied key in your [GitHub Profile SSH keys](https://github.com/settings/keys).

### 3. Login to lastpass-cli

```bash
lpass login --trust <email>
```

### 4. Getting started with chezmoi

```bash
chezmoi init --apply abiencourt
```

### 4. Additional steps based on OS

- [MacOS](docs/MACOS.md)
- [Arch](docs/ARCH.md)

### 5. Configure GitHub CLI

```sh
gh auth login
```
## Tools

List of tools used is available in [Tools](/docs/TOOLS.md).
Tools and dependencies will be automatically installed through [packages.yaml](home/.chezmoidata/packages.yaml).

## KDE Plasma widgets

[Thermal Monitor](https://store.kde.org/p/2100418)
[Apdatifier](https://store.kde.org/p/2135796)

## Configure fingerprint

`fprintd` as dependency for fingerprint and go to "user settings" to add finger print <https://forum.kde.org/viewtopic.php%3Ff=309&t=175570.html>

`sudo nano /etc/pam.d/sudo`

```
#%PAM-1.0
auth            sufficient      pam_fprintd.so
auth            include         system-auth
account         include         system-auth
session         include         system-auth
```

## To-Do

- [ ] Create a bootstrap script to install the brew bases and login to lastpass
- [ ] Look at Timeshift and find out how to partition properly
- [ ] Work on the format with `{{ end -}}`
- [ ] Delete `/home.orig/` when sure that nothing is broken
- [ ] Change `zsh/` to `exact_zsh/`
- [ ] Finish to setup `wtfutil`
- [ ] Finish setting up required tools for `lf` previewer => <https://github.com/NikitaIvanovV/ctpv>
- [ ] Install `howdy`, follow the steps on [this page](https://forum.endeavouros.com/t/tutorial-installing-howdy-now-its-personal/38095)
- [ ] Install and configure `swww` for wallpaper
- [ ] Finish the installation of `hyprland`
- [ ] add homebrew to `packages.yaml`
- [ ] Test [.first-install.sh](home/.chezmoiscripts/.first-install.sh) script, could it be that `--apply` while running `chezmoi init --apply` breaks it
- [ ] Rust installation with `rustup-init` fails at first install
- [ ] default nvim config has issue with `abiencourt.env` file
- [ ] write step to install plasma widget and Krohnkite manually

<https://mozilla.github.io/webrtc-landing/gum_test.html> => to test screensharing features

## References

### Git multi user

- <https://gist.github.com/alejandro-martin/aabe88cf15871121e076f66b65306610>
- <https://stackoverflow.com/a/74832574/13795415>
- <https://gist.github.com/rahularity/86da20fe3858e6b311de068201d279e3>

### Mount `/home` from a partition

Using a separate partition/drive as `/home` is really useful when distro hopping or reinstalling the OS. Below a great article going through each steps of the process.

> [!WARNING]
> As I use `brew` for most of my cli tools, I rely heavily on the `linuxbrew` user in `/home`.
> The command `mv /home /home.orig` in the tutorial will break a lot of things on the current logged in session.
> Best way to avoid this, is to open a new TTY (CTRL+ALT+F3) and run these commands in it.

```sh
sudo mv /home /home.orig
sudo mkdir /home
sudo mount /dev/nvme0n1p4 /home/
```

[How to Move Your Linux home Directory to Another Drive](https://www.howtogeek.com/442101/how-to-move-your-linux-home-directory-to-another-hard-drive/)
