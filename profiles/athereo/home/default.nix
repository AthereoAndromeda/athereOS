{...}: {
  imports = [
    ./direnv.nix
    ./fonts.nix
    ./git.nix

    ./apps
    ./desktop
    ./cli
    ./hypr
    ./games
  ];
}
