# Immersed config

## Notes

These steps are written and tested only on EndeavourOS with KDE Plasma X11 and Wayland

## Post-installation

### Create a service to start the v4l2loopback at boot

```sh
sudo vim /etc/systemd/system/v4l2loopback.service
```

```
[Unit]
Description=v4l2loopback

[Service]
ExecStart=/bin/modprobe v4l2loopback video_nr=9 card_label="ImmersedVR" exclusive_caps=1
ExecStop=/bin/rmmod v4l2loopback
Type=simple
RemainAfterExit=yes

[Install]
WantedBy=default.target
```

Start and run the service

```sh
systemctl enable --now v4l2loopback
```

## Usage

1. Start KDE X11 session
2. Enable/Disable displays in the KDE display settings (wide screens creates a bit of lag)
3. Plug in the headset and accept the notification to connect the laptop through USB
4. <Meta> + <Space> to toggle Immersed
5. Make sure in the `Settings > Advanced > USB wired mode` the headset is ticked

## References

Steps taken from this [blog post](https://richarddecal.com/posts/2024-02-01-immersed-vr-ubuntu.html)
Steps to action on headset to [enable USC-C mode](https://immersed.helpscoutdocs.com/article/40-usb-c-mode-on-meta-quest-beta)
