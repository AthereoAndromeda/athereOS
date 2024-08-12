{pkgs, ...}: {
  home.packages = with pkgs; [
    simutrans
  ];
}
