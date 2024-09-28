{
  config,
  pkgs,
  ...
}: let
  base16-text = import ./base16-text.nix config.scheme;

  build-scss = path:
    pkgs.stdenv.mkDerivation {
      name = "sass-builder";
      src = path;

      nativeBuildInputs = with pkgs; [
        dart-sass
      ];

      dontUnpack = true;
      dontPatch = true;
      dontConfigure = true;
      dontInstall = true;

      buildPhase = ''
        mkdir -p $out
        mkdir build

        cp -r $src/* build/
        echo '${base16-text}' > build/_base16.scss;

        ls build

        echo "Building SCSS..."
        sass build/:$out/dist
      '';
    };
in {
  programs.waybar.enable = true;

  xdg.configFile = {
    # "waybar/scheme.css".text = builtins.readFile (config.scheme inputs.base16-waybar);
    "waybar/theme-1/dist".source = "${build-scss ./theme-1/scss}/dist";
    "waybar/theme-1/config.jsonc".source = ./theme-1/config.jsonc;
    "waybar/theme-1/scripts".source = ./theme-1/scripts;

    # Debug purposes
    "waybar/theme-1/debug/base16.scss".text = base16-text;
  };
}
