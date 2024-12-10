# Tools

<!-- toc -->

- [Chezmoi](#chezmoi)
  - [Overview](#overview)
  - [my-flatpak-apps](#my-flatpak-apps)
- [Rust](#rust)
- [Terminal](#terminal)
- [Browsers](#browsers)
  - [Work browser](#work-browser)
  - [Personal browser](#personal-browser)
- [Presentation](#presentation)
  - [To consider](#to-consider)
- [To-Do](#to-do)

<!-- tocstop -->

## Chezmoi

[Chezmoi](https://github.com/twpayne/chezmoi) is the tool used to manage my dotfiles. I use it to keep track of my config files and bootstrap/re-install my softwares/tools on different machines effortlessly.
Chezmoi allows the use of scripts which are triggered only once, on a file change or every time a sync is applied.

### Overview

- Scripts and files are applied based on the machine OS. This is done through [.chezmoiignore.tmpl](../home/.chezmoiignore.tmpl)
- Scripts are running in numerical order
- Some scripts are a bootstrap install of a few tools and will run only once

### my-flatpak-apps

The file [my-flatpak-apps.txt](../home/dot_config/flatpak/my-flatpak-apps.txt) is used to install flatpak apps. Once I am happy with a flatpak app, I will add its name in this file and will be automatically installed across my machines.

The apps below were facing issues when installed through flatpak, hence installing them through `yay`.

```sh
yay -S android-studio \
postman-bin \
visual-studio-code-bin

```

## Rust

Rust tools are installed using [rustup](https://rustup.rs/).

`rustup` is installed automatically through chezmoi via the [Brewfile_Basics.tmpl](../home/dot_config/exact_homebrew/Brewfile_Basics.tmpl).
It is then run once via the [run_once_after_06-rustup.sh](../home/.chezmoiscripts/linux/run_once_after_06-rustup.sh) script.

To uninstall :

```sh
rm -rf $RUSTUP_HOME
rm -rf $CARGO_HOME
```

## Terminal

Default terminal is [Kitty](https://sw.kovidgoyal.net/kitty/)

## Browsers

Both personal and work browsers are installed.
Default browser is set based on the machine type (personal or work).

### Work browser

Microsoft Edge is set as the default browser on work machines.

### Personal browser

Brave is the default browser for personal use.

## Presentation

- [Slides](https://github.com/maaslalani/slides) - Terminal based presentation tool
- [slidev](https://sli.dev/) - Extremely powerful presentation tool

### To consider

- [ ] <https://github.com/ralexander-phi/marp-to-pages/>

## To-Do

- [ ] Add Vimium key mappings
- [ ] When adding edge application, if it doesn't show in wofi, use the create shortcut from edge settings
- [ ] Finishing describing the chezmoi scripts
- [ ] Review the install of `clamav` with brew

```
To finish installation & run clamav you will need to edit
the example conf files at /home/linuxbrew/.linuxbrew/etc/clamav/

To start clamav now and restart at startup:
  sudo brew services start clamav
Or, if you don't want/need a background service you can just run:
  /home/linuxbrew/.linuxbrew/opt/clamav/sbin/clamd --foreground
```
