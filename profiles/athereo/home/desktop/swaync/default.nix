{...}: {
  xdg.configFile = {
    "swaync" = {
      source = ./config;
      recursive = true;
    };
  };
}
