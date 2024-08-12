{
  config,
  inputs,
  ...
}: {
  programs.waybar.enable = true;

  xdg.configFile = {
    "waybar/scheme.css".text = builtins.readFile (config.scheme inputs.base16-waybar);
    "waybar/theme-1".source = ./theme-1;
  };
}
