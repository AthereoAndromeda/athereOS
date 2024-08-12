{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop # A better Wayland-oriented Discord Client
    discord # Also install original
  ];
}
