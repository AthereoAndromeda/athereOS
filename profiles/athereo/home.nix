{
  config,
  inputs,
  scheme,
  nix-colors,
  my-utils,
  ...
}: {
  imports = [
    inputs.base16.homeManagerModule
    nix-colors.homeManagerModules.default
    {inherit scheme;}
    ./home
  ];

  # nix-colors
  colorScheme = import ./nix-colors-conversion.nix {inherit config nix-colors my-utils;};

  # Custom themes
  gtk-theme.tokyo-night.enable = false;
  gtk-theme.base16.enable = true;

  # Set some perms for virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Enable toolkits
  qt.enable = true;

  xdg.enable = true;

  # ~~Let Home Manager install and manage itself.~~
  # Let NixOS handle home-manager
  programs.home-manager.enable = false;
}
