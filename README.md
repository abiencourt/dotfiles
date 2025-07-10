# My chezmoi dotfiles

[![Coding time over the last 30 days](https://wakapi.dev/api/badge/abiencourt/interval:30_days/label:chezmoi?label=last%2030d)](https://wakapi.dev/)

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
  - [4. Additional steps based on OS](#4-additional-steps-based-on-os)
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

> [!WARNING]
> Make sure to follow the steps in "next steps" displayed after the installation.

#### 1.2. Install dependencies

Dependencies will be automatically installed through [packages.yaml](home/.chezmoidata/packages.yaml).

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
```

#### 2.2. Associate the key with GitHub

Add the copied key in your [GitHub Profile SSH keys](https://github.com/settings/keys).

#### 2.3. Add the GitHub SSH key to known_host

```bash
brew install jq
curl --silent https://api.github.com/meta |
    jq --raw-output '"github.com "+.ssh_keys[]' >>~/.ssh/known_hosts
```

### 3. Getting started with chezmoi

```bash
brew install chezmoi
chezmoi init --apply abiencourt
```

### 4. Additional steps based on OS

- [MacOS](docs/MACOS.md)
- [Arch](docs/ARCH.md)

## Tools

List of tools used is available in [Tools](/docs/TOOLS.md).

## To-Do

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
- [ ] add homebrew to `packages.yaml`

![image](https://github.com/agoodshort/dotfiles/assets/33832653/f9eaa504-ca26-4b2b-bd64-a3a4da49b793)

<https://mozilla.github.io/webrtc-landing/gum_test.html> => to test screensharing features

## References

### Git multi user

- <https://gist.github.com/alejandro-martin/aabe88cf15871121e076f66b65306610>
- <https://stackoverflow.com/a/74832574/13795415>
- <https://gist.github.com/rahularity/86da20fe3858e6b311de068201d279e3>
