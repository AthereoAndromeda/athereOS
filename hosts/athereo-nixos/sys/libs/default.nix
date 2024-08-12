{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Libs
    libsecret
    libgcc
  ];
}
