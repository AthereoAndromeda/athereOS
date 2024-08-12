# Athereo's Dotfiles
My desktop configuration using NixOS and Home Manager.

- **Window Manager:** `Hyprland`
- **Theming Module:** `base16.nix`

## Apps
- **Default Editor**: `helix`
- 


## Commit Message Style
Categories of commits. In general the style of commit should be:  
`branch/type/subtype(file_or_field_or_param): Message`

- `nix/`: Related to Nix scripts.
  - `nix/overlays`: Changes in overlays
  - `nix/build`: General change
  - `nix/build(variant)`: Specific Change. e.g.: `nix/build(flake.nix)`
  - eg: 
    - `nix/build: Change variable names`
    - `chore/nix/build(flake.lock): Run nix flake update`
    - `nix/overlays(package): Added package overlay`

- `hypr/`: Related to any hypr ecosystem
  - `hypr/hyprland`
  - `hypr/hypridle`
  - `hypr/hyprlock`

- `sys/`: System Related Changes
  - `sys(pkg)`: System-related pkgs.  eg: `refactor/sys(avahi): Reformat printer drivers`
  
- `home/`: Home-Manager Related. 
  - `home(pkg)`: Home-related pkgs.  eg: `fix/style/home(zellij): Fix color`

Some more examples:
- `style/home(oh-my-posh): Add base16 color scheme`
- `feat/hypr/hyprland: New Keybinds`
- 

### General/Branch Commits
If the branch also apply for the above scenarios, prefix using the below.  
e.g.: `fix/nix/build: Fix thing`

- `feat/`: New feature
- `fix/`: Fixes. 
- `docs/`: Anything related to documentation. e.g.: `docs(README.md): Add something`, `docs/hypr/hyprland(config): Add comments`
- `chore/`: Not exactly a fix, not exactly a feature. Use for something like `nix flake update`
- `style/`: Any visual style changes. *NOT code style change. thats `refactor`*
- `refactor/`: Code change or formatting

## Building
Simply run the following:  
```bash
sudo nixos-rebuild switch --flake .
```

This will install the `athereo-desktop` host and `athereo` profile.  
These profiles will have the following installed by default:
- just
- alejandra

And also make sure to edit `.env`

Now for every further build, you can simply run `just build`, or check the recipes with `just --list`

### Utils
There are some useful utils defined in `Justfile`, but some
dependencies are required:  
- ripgrep (rg)

### User Scripts
These are miscellanoeus scripts not directly related to building the flake,
but are nonetheless usefeul. These are located in `scripts/`.

Some dependencies required:
- nmcli
- fzf

