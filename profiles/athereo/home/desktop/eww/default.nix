{pkgs, ...}: {
  xdg.configFile = {
    "eww" = {
      source = ./config;
      recursive = true;
    };

    "eww/clipboard-viewer".source = ./clipboard-viewer;
  };
}
