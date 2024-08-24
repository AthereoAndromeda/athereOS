{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;

    # plugins = [
    #   inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    # ];
  };

  xdg.configFile = {
    "hypr/hypridle.conf".source = ./hypridle.conf;
    "hypr/hyprlock.conf".source = ./hyprlock.conf;
    "hypr/start.sh".source = ./start.sh;

    "hypr/bindings".source = ./bindings;
    "hypr/submaps".source = ./submaps;
  };
}
