{lib, ...}: {
  imports = [
    ./avahi.nix
    ./bluetooth.nix
    ./utils.nix
    ./opengl.nix
    ./playerctl.nix
    ./virt.nix
    ./X11.nix
    ./zerotier.nix

    ./boot
    ./libs
    ./hypr
    ./lang
    ./networking
    ./wallpaper-engines
    ./xremap
  ];

  bluetooth.enable = lib.mkDefault true;
  xremap.enable = lib.mkDefault true;
  opengl.enable-unstable = lib.mkDefault false;
  zerotierone.enable = lib.mkDefault false;
}
