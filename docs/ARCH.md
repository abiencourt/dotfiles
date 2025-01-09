# Notes dedicated to Arch Linux

<!-- toc -->

- [Post-installation](#post-installation)
  - [Configure dock](#configure-dock)
- [How-to](#how-to)
  - [Screen recording](#screen-recording)
  - [AUR](#aur)
  - [Downgrade](#downgrade)
  - [iPhone Hotspot](#iphone-hotspot)

<!-- tocstop -->

## Post-installation

### Configure dock

To use laptop with dock, make sure to remove security in BIOS and allow Enhanced USB support. Also read through [this](https://community.frame.work/t/arch-caldigit-ts4-dock-xfce4-trials-tribulations-and-fixes/29117) if issues and [configure Kernel parameters in GRUB](https://forum.manjaro.org/t/how-could-i-edit-a-kernel-parameter/63241/3).

## How-to

### Screen recording

```bash
wf-recorder -f screen_recording.mp4 -g "$(slurp)"
```

drun `show me the key` to display keystrokes

### AUR

| Command   | Description               |
| --------- | ------------------------- |
| `yay -Yc` | remove unneeded packages  |
| `yay -Qm` | list all AUR packages     |
| `yay -Qi` | list info about a package |

### Downgrade

Used to Downgrade previously working packages

```bash
sudo downgrade code
```

### iPhone Hotspot

Make sure that `usbmuxd` is installed and start the service. Plug the iPhone and enable hotspot. More info here: <https://wiki.archlinux.org/title/IPhone_tethering>

```bash
yay -S usbmuxd

systemctl start usbmuxd.service
```
