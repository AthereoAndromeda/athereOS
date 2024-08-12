{pkgs, ...}: {
  home.packages = with pkgs; [
    ngrok
  ];

  # TODO: Add sops-nix to manage authkey
}
