{pkgs, ...}: {
  # Uses vscodium instead of vscode
  home.packages = with pkgs; [
    vscodium
  ];
}
