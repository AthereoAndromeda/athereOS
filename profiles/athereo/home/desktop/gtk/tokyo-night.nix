{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    gtk-theme.tokyo-night.enable = lib.mkEnableOption "enables Tokyo-Night-B";
  };

  config = lib.mkIf config.gtk-theme.tokyo-night.enable {
    gtk.theme.package = pkgs.tokyo-night-gtk;
    gtk.theme.name = "Tokyonight-Dark-B";

    xdg.configFile = {
      "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
      "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    };

    home.sessionVariables = {
      GTK_THEME = "Tokyonight-Dark-B";
    };
  };
}
