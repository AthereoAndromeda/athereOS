{pkgs, ...}: {
  home.packages = with pkgs; [
  ];

  xdg.configFile = {
    "rofi/themes/rounded-common.rasi".source = ./rounded-common.rasi;
    "rofi/themes/rounded-blue-dark.rasi".source = ./rounded-blue-dark.rasi;
  };
}
