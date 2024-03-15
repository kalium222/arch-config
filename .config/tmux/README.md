# Configuration for Tmux

## Path

Everything should be put in the `~/.config/tmux`. 
After a certain version of `tmux`, we can put the configuration file to `~/.config/tmux/tmux.conf`,
so we just put everything in `~/.config/tmux`. 

## Plugins

Use [tpm](https://github.com/tmux-plugins/tpm) as the plugins manager.
Clone this repo to `~/.config/tmux/plugins/tpm`. 
Then run `./bindings/install_plugins` when tmux is running.
Uses
1. [`tmux-powerline`](https://github.com/erikw/tmux-powerline). 
