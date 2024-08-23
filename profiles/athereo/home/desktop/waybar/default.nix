{
  config,
  pkgs,
  ...
}: let
  base16-text = with config.scheme.withHashtag; ''
    $base00: ${base00};
    $base01: ${base01};
    $base02: ${base02};
    $base03: ${base03};
    $base04: ${base04};
    $base05: ${base05};
    $base06: ${base06};
    $base07: ${base07};
    $base08: ${base08};
    $base09: ${base09};
    $base0A: ${base0A};
    $base0B: ${base0B};
    $base0C: ${base0C};
    $base0D: ${base0D};
    $base0E: ${base0E};
    $base0F: ${base0F};
  '';

  build-scss = pkgs.stdenv.mkDerivation {
    name = "sass-builder";
    src = ./theme-1/scss;

    nativeBuildInputs = with pkgs; [
      dart-sass
      python312
    ];

    dontUnpack = true;
    dontPatch = true;
    dontConfigure = true;
    dontInstall = true;

    buildPhase = ''
      mkdir -p $out
      mkdir build

      cd $src
      python filter.py
      cd ..
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
    "waybar/theme-1/dist".source = "${build-scss}/dist";
    "waybar/theme-1/config.jsonc".source = ./theme-1/config.jsonc;
    "waybar/theme-1/scripts".source = ./theme-1/scripts;
  };
}
