{
  config,
  lib,
  ...
}: {
  options.xremap.enable = lib.mkEnableOption "enables xremap";

  config = lib.mkIf config.xremap.enable {
    services.xremap = {
      enable = true;
      withWlroots = true;
      userName = "athereo";
      yamlConfig = builtins.readFile ./config.yml;
    };
  };
}
