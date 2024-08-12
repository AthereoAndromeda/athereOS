{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  hyprland-pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  options.opengl.enable-unstable = lib.mkEnableOption "Enable unstable mesa drivers that follow hyprland's nixpkgs";

  config.opengl.enable-unstable = lib.mkIf config.opengl.enable-unstable {
    hardware.opengl = {
      enable = true;
      package = hyprland-pkgs-unstable.mesa.drivers;

      # if you also want 32-bit support (e.g for Steam)
      driSupport32Bit = true;
      package32 = hyprland-pkgs-unstable.pkgsi686Linux.mesa.drivers;
    };

    services.xserver.videoDrivers = ["amdgpu"];
  };
}
