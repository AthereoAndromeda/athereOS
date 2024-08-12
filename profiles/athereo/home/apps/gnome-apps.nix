{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-characters
    gnome.nautilus
    gnome.gnome-font-viewer
    loupe
    amberol
    evince
    snapshot

    # gnome-text-editor # Replaced by helix-editor
    # gnome.totem # Replaced by mpv
  ];
}
