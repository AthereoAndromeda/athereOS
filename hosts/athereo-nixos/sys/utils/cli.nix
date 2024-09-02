{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      wget
      du-dust
      eza
      bat
      neofetch
      btop
      xcp
    ])
    ++ (with pkgs-unstable; [
      fastfetch
    ]);
}
