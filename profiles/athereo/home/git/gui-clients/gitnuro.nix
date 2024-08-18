{pkgs-unstable, ...}: {
  # UNSTABLE: Stable crashes due to LibGL not being found. Fixed in unstable.
  home.packages = [pkgs-unstable.gitnuro];
}
