set dotenv-load

alias fmt := format
alias b := build
alias t := test
alias td := test-debug
alias up := update

default:
    just --list


# Build the system w/o committing
[group('build')]
build: format _git-add
    echo $SUDO_PASS | sudo -S nixos-rebuild switch --flake .

# Build in `test` mode
[group('build')]
test: format _git-add
    echo $SUDO_PASS | sudo -S nixos-rebuild test --flake .

# Build in `test` mode, with lots of debug flags
[group('build')]
test-debug eval-cache="true": format _git-add
    echo $SUDO_PASS | sudo -S nixos-rebuild test --flake . --option eval-cache {{eval-cache}} --show-trace --print-build-logs --verbose

# Update Nix Flakes
[group('utils')]
update:
    echo $SUDO_PASS | sudo -S nix flake update

# Format all `.nix` files using Alejandra
[group('lints')]
format:
    alejandra . &> /dev/null

# Cleans nix garbage
[group('utils')]
clean older-than="10d":
    echo $SUDO_PASS | sudo -S nix-collect-garbage --delete-older-than "{{older-than}}"

# Lists all Nix Generations
[group('utils')]
list:
   echo $SUDO_PASS | sudo -S nix-env --list-generations --profile /nix/var/nix/profiles/system

# Lists history of Nix Generations
[group('utils')]
history:
    nix profile history --profile /nix/var/nix/profiles/system

delete-generations +gen:
    echo $SUDO_PASS | sudo -S nix-env --profile /nix/var/nix/profiles/system --delete-generations {{gen}}

# Optimize and compresses nix store. This may take a long while.
[group('utils')]
optimise:
    nix-store --optimise

# Searches through all files for TODO:
[group('utils')]
todo:
    rg -g '!Justfile' -g '!todo.md' -i "TO-?DO"

_git-add:
    git add .
