# arch-config
Configuration and experience for arch linux.
Use hard links in this repo to synchronize the configurations.

## Things to do
Follow the wiki.
- [x] Network configuraion.
- [x] Proxy. Use `v2raya`. 
- [x] AUR helper.
    See [AUR](https://wiki.archlinux.org/title/Arch_User_Repository)
    and [AUR helper](https://wiki.archlinux.org/title/AUR_helpers).
    We use paru.
- [ ] console.
- [x] Console keymap. See [wiki](https://wiki.archlinux.org/title/Linux_console/Keyboard_configuration).
- [x] DE.
- [x] Display manager.
- [x] DE keymap.
- [x] grub theme.
- [x] Synchronization and backup.
- [x] Bluetooth. Just follow the [wiki](https://wiki.archlinux.org/title/Bluetooth).
- [x] input Chinese.
- [ ] multimedia. TODO: cannot share screen.
- [x] color in `pacman`.
- [ ] suspend/hibernate.
- [x] Shell.

### Enable color in the output of `pacman`
`man pacman.conf`. Then uncoment the relative line.

### Network Configuration and Proxy
This is alway the most fucked.

#### Network

First see [wiki](https://wiki.archlinux.org/title/Network_configuration).
Chose [iwd](https://wiki.archlinux.org/title/Iwd).
Remember to set dynamic ip and dns.
For network configuration, see `man iwd.network`.

We give up iwd. Use [NetworkManager](https://wiki.archlinux.org/title/NetworkManager).
iwd will bring some problem unexpectively. 

#### Proxy

When connecting to subscribe address with iwd, we got
```
failed to resolve subscription address: Get "xxxxxx": dial tcp: lookup u.cdncloud.uk on [::1]:53: read udp [::1]:41407->[::1]:53: read: connection refused
```
Use NetworkManager. V2raya gives some local sockets for proxy. 
Set proxy in every application settings, or the environment variables,
or just do it in nm.


### DE
Use [wayland](https://wiki.archlinux.org/title/Wayland).
We chose [Hyprland](https://wiki.archlinux.org/title/Hyprland).
Use [waybar](https://github.com/Alexays/Waybar) as status bar.

#### Keymap in DE
First we modified the `/usr/share/X11/xkb/keycodes/evdev`. 
But this may be bad.

It is very strange that there is no relative configuration for keymapping in wayland.
Wayland still uses something about xkb, which is complicated and verbose.
Fortunately, hyprland provide us with some simple variables such as `input:kb_xxx`.

TODO: But both will lead to a strange behaviour of `vim/nvim` plugins in the `vscode`.

### Grub theme
First see [wiki of kernel parameter for grub](https://wiki.archlinux.org/title/Kernel_parameters#GRUB).
Then we should be able to do this. 

### Synchronization and backup
First we use `timeshift`, but cannot open the GUI.
That's because some relative env wasn't kept when
we enter `su -` or `sudo`. Launch it in `su`.

### Suspend/Hibernate
TODO:
Follow the [wiki](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate).
We can `suspend` and `hybrid-sleep` now, but still cannot `hibernate`.

### Shell

#### Bash
Just write in `.bashrc`

#### Zsh
Check the path of the plugins with `pacman -Fl *package_name*` and source them in `.zshrc`.

### Docker
First install docker engine, docker compose, docker buildx.
To run docker in rootless mode, install docker-rootless-extras.
Set a context for rootless daemon.
For the configuration of the dockerd, see [manual](https://docs.docker.com/config/daemon/).

TODO:
some application in docker, such as wechat, feishu, ...

TODO:
cannot open wechat in docker.

## Troubleshooting

### Can't open timeshift-launcher in wofi or terminal
We run timeshift-laucher in terminal, and it complained that there is not xhost.
Just install xorg-xhost.
I wish one of wayland and xorg can completely substitute another one day.

### Mic with pipewire
Can't pipewire handle mics? Just install pipewire-pulse.
Idk.
Using -git package can avoid this.

### Can not Hibernate
TODO:

### Can't share screen
TODO:

### Virtual camera in obs
TODO: when building the kernel module, got error.

### Fingerprint reader
TODO:

### Cannot connect to xbox controller with bluetooth
TODO:

