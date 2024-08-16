{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ubuntu_font_family
    material-design-icons
    anurati-font # From overlay

    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
      ];
    })
  ];
}
