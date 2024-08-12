{pkgs, ...}: {
  # Used for Mathematics and such.
  # Still no way to declare julia packages

  environment.systemPackages = with pkgs; [
    julia-bin
  ];
}
