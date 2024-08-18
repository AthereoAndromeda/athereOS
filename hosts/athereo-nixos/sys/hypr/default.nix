{pkgs, ...}: {
  imports = [
    ./hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    hyprpicker
  ];
}
