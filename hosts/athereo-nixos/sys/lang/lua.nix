{pkgs, ...}: {
  # Very lightweight. Might as well

  environment.systemPackages = with pkgs; [
    lua
  ];
}
