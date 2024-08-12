{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./tokyo-night.nix
    ./base16.nix
  ];

  gtk.enable = true;

  gtk-theme.tokyo-night.enable = lib.mkDefault false;
  gtk-theme.base16.enable = lib.mkDefault false;
}
