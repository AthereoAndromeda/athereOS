{
  config,
  lib,
  ...
}: {
  options.xremap.enable = lib.mkEnableOption "enables xremap";

  config = lib.mkIf config.xremap.enable {
    services.xremap = {
      # withHypr = true;
      withWlroots = true;
      userName = "athereo";
      config = {
        keymap = [
          {
            name = "Switch Caps Lock and Escape";
            remap = {
              CapsLock = "Esc";
              Esc = "CapsLock";
            };
          }
        ];
      };
    };
  };
}
