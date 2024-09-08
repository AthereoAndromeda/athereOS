{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
