{pkgs, ...}: {
  home.packages = with pkgs; [
    swaynotificationcenter
  ];

  xdg.configFile = {
    "swaync" = {
      source = ./config;
      recursive = true;
    };
  };
}
