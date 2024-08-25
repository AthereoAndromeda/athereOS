{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      file
      cron # Prefer systemd timers via nixos
      wget
      usbutils

      du-dust
      eza
      bat
      neofetch

      trashy
      xwaylandvideobridge

      btop
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
    ])
    ++ (with pkgs-unstable; [
      fastfetch
    ]);
}
