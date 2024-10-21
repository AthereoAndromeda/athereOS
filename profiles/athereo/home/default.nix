{...}: {
  imports = [
    ./home.nix

    ./direnv.nix
    ./fonts.nix

    ./apps
    ./desktop
    ./cli
    ./git
    ./hypr
    ./games
  ];
}
