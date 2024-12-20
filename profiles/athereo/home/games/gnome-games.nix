{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome-mines
  ];
}
