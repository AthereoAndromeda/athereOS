{pkgs, ...}: {
  imports = [
    ./anytype.nix
    ./bottles.nix
    ./gnome-apps.nix
    ./zoom.nix

    ./localsend/localsend.nix
    # ./code-editors # Temporarily disable visual code editors. Create options for them instead
    ./instant-messaging
  ];

  # Uncategorized for now
  home.packages = with pkgs; [
    firefox
    thunderbird
    libreoffice
    freecad
    obs-studio
    mpv
  ];
}
