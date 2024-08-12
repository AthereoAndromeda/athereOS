{lib, ...}: {
  imports = [
    ./avahi.nix
    ./bluetooth.nix
    ./utils.nix
    ./mpvpaper.nix
    ./opengl.nix
    ./playerctl.nix
    ./virt.nix
    ./xremap.nix
    ./X11.nix
    ./zerotier.nix

    ./boot
    ./libs
    ./hypr
    ./lang
    ./networking
  ];

  bluetooth.enable = lib.mkDefault true;
  xremap.enable = lib.mkDefault true;
  opengl.enable-unstable = lib.mkDefault false;
}
