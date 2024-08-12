{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ubuntu_font_family
    material-design-icons

    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
      ];
    })
  ];
}
