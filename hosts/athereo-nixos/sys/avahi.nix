{pkgs, ...}: {
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    browsing = true;
    defaultShared = true;
    listenAddresses = ["*:631"];
    allowFrom = ["all"];
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
      hplip
      hplipWithPlugin
    ];
  };

  services.avahi.enable = true;
  # services.avahi.interfaces = privateZeroTierInterfaces; # ONLY BROADCAST ON VPN
  services.avahi.ipv6 = true;
  services.avahi.openFirewall = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.avahi.publish.addresses = true;
  services.avahi.publish.domain = true;
  services.avahi.nssmdns4 = true;
  services.avahi.publish.workstation = true; # ADDED TO DESKTOP MACHINES

  networking.firewall = {
    allowedTCPPorts = [631];
    allowedUDPPorts = [631];
  };
}
