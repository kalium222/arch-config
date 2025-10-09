# arch-config
Configuration and experience for arch linux.

First install the required packages mentioned below, then generate
config files by running `./synchronize.sh`, which will create soft links
in the `~` or `~/.config`. And there are some other system-wide
config file such as sddm theme conf and xorg touchpad conf needed to be
put the correspounding place by hand.


## TODO
Follow the wiki.
- [ ] virtual console settings.
- [x] multimedia. TODO: cannot share screen.
- [x] suspend/hibernate.
- [x] Network configuraion.
- [x] Proxy. Use `v2raya`. 
- [x] AUR helper.
    See [AUR](https://wiki.archlinux.org/title/Arch_User_Repository)
    and [AUR helper](https://wiki.archlinux.org/title/AUR_helpers).
    We use paru.
- [x] Console keymap. See
[wiki](https://wiki.archlinux.org/title/Linux_console/Keyboard_configuration).
- [x] Desktop environment / window manager / window compositor.
- [x] Display manager.
- [x] DE keymap.
- [x] grub theme.
- [x] Synchronization and backup. We use timeshift. Set a partition
for it.
- [x] Bluetooth. Just follow the 
[wiki](https://wiki.archlinux.org/title/Bluetooth).
- [x] cjk input.
- [x] color in `pacman`.
- [x] Shell.

### Network Configuration and Proxy

#### Network

~~First see
[wiki](https://wiki.archlinux.org/title/Network_configuration).
Chose [iwd](https://wiki.archlinux.org/title/Iwd).
Remember to set dynamic ip and dns.
For network configuration, see `man iwd.network`.~~

We give up iwd. Use
[NetworkManager](https://wiki.archlinux.org/title/NetworkManager).
iwd will bring some problem unexpectively. Maybe it is because the
supported protocol is limited.

#### Proxy

V2raya gives some local sockets for proxy. 
Set proxy in every application settings, or the environment variables,
or just do it in NetworkManager.


### DE/WM/WC

#### Leftwm
##### Xorg settings
TODO:
- dpi settings in .Xresources
- touchpad gestures
- .xinitrc

#### [Hyprland](https://hyprland.org/)
Use [wayland](https://wiki.archlinux.org/title/Wayland).
Use [waybar](https://github.com/Alexays/Waybar) as status bar.
- keymap in hyprland:
    First we modified the `/usr/share/X11/xkb/keycodes/evdev`. 
    But this may be bad.
    It is very strange that there is no relative configuration for keymapping in wayland.
    Wayland still uses something about xkb, which is complicated and verbose.
    Fortunately, hyprland provide us with some simple variables such as `input:kb_xxx`.

### Grub theme
First see [wiki of kernel parameter for grub](https://wiki.archlinux.org/title/Kernel_parameters#GRUB).
Then we should be able to do this. 

### Suspend/Hibernate

Follow the [wiki](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate).
We can `suspend` and `hybrid-sleep` now, but still cannot `hibernate`.

### Shell

#### Bash
Just write in `.bashrc`

#### Zsh
Check the path of the plugins with `pacman -Fl *package_name*` and source them in `.zshrc`.

### Container
First install docker engine, docker compose, docker buildx.
To run docker in rootless mode, install docker-rootless-extras.
Set a context for rootless daemon.
For the configuration of the dockerd, see [manual](https://docs.docker.com/config/daemon/).

TODO:
some application in docker, such as wechat, feishu, ...

TODO:
cannot open wechat in docker.

move to podman. see arch wiki

### Enable color in the output of `pacman`
`man pacman.conf`. Then uncoment the relative line.

## Troubleshooting
### glmark2 got low score on xorg
TODO: 

### Cannot connect to the proxy server through v2raya
When connecting to subscribe address with iwd, we got
```
failed to resolve subscription address: Get "xxxxxx": dial tcp: lookup u.cdncloud.uk on [::1]:53: read udp [::1]:41407->[::1]:53: read: connection refused
```
Change to NetworkManager solved this.

### swapping caps and esc behave strange in `vim/nvim` plugins in `vscode`
Some configuraion in vscode. I forgot. Just search online.
See [this issue](github.com/vscode-neovim/vscode-neovim/issues/124)

### Can't open timeshift-launcher in xorg
TODO:

### Can't open timeshift-launcher in wofi or terminal
We run timeshift-laucher in terminal, and it complained that there is not xhost.
Just install xorg-xhost.
I wish one of wayland and xorg can completely substitute another one day.

polkit.

### Mic with pipewire
Can't pipewire handle mics? Just install pipewire-pulse.
Idk.

### Virtual camera in obs
When building the kernel module, got error.
Using -git package can avoid this.

### Fingerprint reader
The avaliable driver doesn't support my device.

