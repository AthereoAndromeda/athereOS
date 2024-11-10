set dotenv-load

alias fmt := format
alias s := switch
alias t := test
alias l := list
alias td := test-debug
alias up := update
alias opt := optimise

default:
    just --list


# Build the system and add the generation to the bootloader
[group('build')]
switch: format _git-add
    echo $SUDO_PASS | sudo -S nixos-rebuild switch --flake .

# Build in `test` mode
[group('build')]
test: format _git-add
    echo $SUDO_PASS | sudo -S nixos-rebuild test --flake .

# Build in `test` mode, with lots of debug flags
[group('build')]
test-debug eval-cache="true": format _git-add
    echo $SUDO_PASS | sudo -S nixos-rebuild test --flake . --option eval-cache {{eval-cache}} --show-trace --print-build-logs --verbose


# Format all `.nix` files using Alejandra
[group('lints')]
format:
    alejandra . &> /dev/null

# Update Nix Flakes
[group('nix/utils')]
update:
    echo $SUDO_PASS | sudo -S nix flake update

# Cleans nix garbage
[group('nix/utils')]
clean older-than="3d":
    echo $SUDO_PASS | sudo -S nix-collect-garbage --delete-older-than "{{older-than}}"

# Cleans old nix garbage
[group('nix/utils')]
clean-old:
    echo $SUDO_PASS | sudo -S nix-collect-garbage --delete-old

# Lists all Nix Generations
[group('nix/utils')]
list:
   echo $SUDO_PASS | sudo -S nix-env --list-generations --profile /nix/var/nix/profiles/system

# Lists history of Nix Generations
[group('nix/utils')]
history:
    nix profile history --profile /nix/var/nix/profiles/system

# Delete specified generations
[group('nix/utils')]
delete-generations +gen:
    echo $SUDO_PASS | sudo -S nix-env --profile /nix/var/nix/profiles/system --delete-generations {{gen}}

# Optimize and compresses nix store. This may take a long while.
[group('nix/utils')]
optimise:
    nix-store --optimise --verbose

# Searches through all files for TODO:
[group('utils')]
todo:
    rg -g '!Justfile' -g '!todo.md' -i "TO-?DO"

_git-add:
    git add .
