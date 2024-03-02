# arch-config
Configuration and experience for arch linux.
Use hard links in this repo to synchronize the configurations.

## Things to do
Follow the wiki.
- [x] Network configuraion.
- [x] AUR helper.
    See [AUR](https://wiki.archlinux.org/title/Arch_User_Repository)
    and [AUR helper](https://wiki.archlinux.org/title/AUR_helpers).
    We use paru.
- [ ] Proxy.
- [ ] console.
- [ ] console keymap.
- [x] DE.
- [ ] Display manager.
- [ ] DE keymap.
- [x] grub theme.
- [ ] Synchronization and backup.
- [x] Bluetooth. Just follow the [wiki](https://wiki.archlinux.org/title/Bluetooth).
- [ ] input Chinese.
- [ ] multimedia.
- [ ] mail server.
- [ ] webcam.
- [x] color in `pacman`.
- [ ] suspend/hibernate.

### Enable color in the output of `pacman`
`man pacman.conf`. Then uncoment the relative line.

### Network Configuration
First see [wiki](https://wiki.archlinux.org/title/Network_configuration).
Chose [iwd](https://wiki.archlinux.org/title/Iwd).
For network configuration, see `man iwd.network`.

### DE
We chose [Hyprland](https://wiki.archlinux.org/title/Hyprland).
Use [waybar](https://github.com/Alexays/Waybar) as status bar.

#### Keymap in DE
TODO:
First we modified the `/usr/share/X11/xkb/keycodes/evdev`. 
But this may be bad.

### Grub theme
First see [wiki of kernel parameter for grub](https://wiki.archlinux.org/title/Kernel_parameters#GRUB).
Then we should be able to do this. 

### Synchronization and backup
TODO:
First we use `timeshift`, but cannot open the GUI.
Choose to use cli or change to another.

### Suspend/Hibernate
TODO:
Follow the [wiki](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate).
We can `suspend` and `hybrid-sleep` now, but still cannot `hibernate`.
