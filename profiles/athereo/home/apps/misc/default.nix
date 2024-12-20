{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-characters
    gnome-font-viewer
  ];
}
