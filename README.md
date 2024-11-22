# Dragoon 🗡🐉
<p align="center">
<img  height="50%" width="50%" src="https://github.com/RustySnek/dragoon-nix/blob/master/users/dragoon/assets/full.jpg" alt="cool ai guy">
</p>

>Welcome, valiant seeker of knowledge, to Dragoon, a powerful NixOS configuration crafted for the noble art of penetration testing and ethical hacking. This configuration is your trusted companion on a quest to uncover vulnerabilities and fortify the defenses of the digital realm.


## Install QEMU/KVM
```fish
git clone https://github.com/RustySnek/dragoon-nix
cd dragoon-nix/

# format and mount drive
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko hosts/placidusax/disk.nix

# install
sudo mount -o remount,size=16G /mnt
sudo nixos-install --flake .#placidusax
```

## Placidusax
**~14GB Size**

Tool list [here](https://github.com/rustysnek/dragoon-nix/blob/master/TOOLS.md)

user: `dragoon`

password: `skyborne`

### Features (I guess)
- tmpfs
- Projects/Documents/Pictures peristance
- lightly bloated
- running i3

### Keymaps

#### Workspaces (0-9)
- Switch: Super + 1-0
- Move window: Super + Shift + 1-0

#### Dmenu / Terminal
- Rofi: Super + Space
- Kitty terminal: Super + Return

#### Window Management
- Kill window: Super + x
- Toggle fullscreen: Super + f
- Toggle floating: Super + s
- Focus movement: Super + h/j/k/l
- Move window: Super + Shift + h/j/k/l
- Restart i3: Super + Shift + R

#### Neovim Shortcuts
- Fuzzy search: Space + fz
- File browser: Space + fb
- Git files: Space + fg
- Find files: Space + ff
- Harpoon:
  - Open Harpoon menu: Ctrl + e
  - Jump to Harpoon files: Ctrl + (1,2,3,4)
- Gitmoji: Space + fm
- Change theme: Ctrl + h
