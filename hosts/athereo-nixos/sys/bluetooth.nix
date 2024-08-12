{
  config,
  lib,
  ...
}: {
  options = {
    bluetooth.enable = lib.mkEnableOption "enables bluetooth";
  };

  config = lib.mkIf config.bluetooth.enable {
    # Enable Bluetooth (https://nixos.wiki/wiki/Bluetooth)
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
