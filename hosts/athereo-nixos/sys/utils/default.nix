{pkgs, ...}: {
  imports = [
    ./cli.nix
  ];

  environment.systemPackages = with pkgs; [
    file
    cron # Prefer systemd timers via nixos
    usbutils

    trashy
    xwaylandvideobridge

    brightnessctl
    age

    # Utils for dotfile rebuilding
    alejandra
    just

    # Images in fzf
    chafa
    timg

    # Compression for swww
    lz4
  ];
}
