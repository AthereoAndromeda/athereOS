{...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.athereo = {
    isNormalUser = true;
    description = "Angelo";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "libvirtd"
      "kvm"
      "docker"
      "camera"
      "i2c"

      # Printer groups idk if they work
      "lpadmin"
      "printer"
      "sambashare"
      "avahi"
    ];
    # packages = [ ]; # All User packages is in `home.nix`
  };
}
