{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland/hyprland.conf;

    # plugins = [
    #   inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    # ];
  };

  xdg.configFile = {
    "hypr/hypridle.conf".source = ./hypridle.conf;
    "hypr/hyprlock.conf".source = ./hyprlock.conf;

    "hypr/start.sh".source = ./hyprland/start.sh;
    "hypr/bindings".source = ./hyprland/bindings;
    "hypr/scripts".source = ./hyprland/scripts;
  };
}
