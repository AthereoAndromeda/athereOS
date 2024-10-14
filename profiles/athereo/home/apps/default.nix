{pkgs, ...}: {
  imports = [
    ./anytype.nix
    ./bottles.nix
    ./homebank.nix

    ./localsend/localsend.nix
    ./browsers
    # ./code-editors # Temporarily disable visual code editors. Create options for them instead
    ./devices
    ./documents
    ./file-explorers
    ./instant-messaging
    ./media
    ./misc
  ];

  # Uncategorized for now
  home.packages = with pkgs; [
    firefox
    thunderbird
    libreoffice
    freecad
    obs-studio
  ];
}
