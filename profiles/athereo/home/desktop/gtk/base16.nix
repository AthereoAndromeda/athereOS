{
  config,
  lib,
  pkgs,
  nix-colors,
  ...
}: {
  options = {
    gtk-theme.base16.enable = lib.mkEnableOption "enables GTK Theme based on Base16 ColorScheme";
  };

  config = lib.mkIf config.gtk-theme.base16.enable {
    gtk.theme.package = let
      nix-colors-lib = nix-colors.lib.contrib {inherit pkgs;};
    in
      nix-colors-lib.gtkThemeFromScheme {
        scheme = config.colorScheme;
      };

    gtk.theme.name = config.colorScheme.slug;

    # xdg.configFile = {
    #   "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    #   "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    #   "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    # };

    home.sessionVariables = {
      GTK_THEME = config.colorScheme.slug;
    };
  };
}
