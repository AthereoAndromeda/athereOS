{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  # Also check LibrePhoenix's setup
  environment.systemPackages = with pkgs; [
    eww
    libnotify
    wl-clipboard
    grim
    slurp
    udiskie
    cliphist
  ];
}
