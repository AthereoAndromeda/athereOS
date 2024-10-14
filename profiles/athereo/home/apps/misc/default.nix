{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-characters
    gnome.gnome-font-viewer
  ];
}
