{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./layouts/slanted.nix
    ./layouts/minimal.nix
    ./plugins
  ];

  home.packages = with pkgs; [
    zellij
    zjstatus
  ];

  xdg.configFile = {
    "zellij/config.kdl".source = ./config.kdl;
    "zellij/themes/default.kdl".text = with config.scheme.withHashtag; ''
      themes {
        default {
          fg "${base05}"
          bg "${base02}"
          black "${base00}"
          red "${base08}"
          green "${base0B}"
          yellow "${base0A}"
          blue "${base0D}"
          magenta "${base0E}"
          cyan "${base0C}"
          white "${base05}"
          orange "${base09}"
        }
      }
    '';
  };
}
