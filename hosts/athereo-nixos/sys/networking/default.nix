{...}: {
  imports = [./firewall.nix];

  # networking.wireless.enable = true; Enables wireless support vid wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # DNS Servers
  networking.nameservers = [
    "1.1.1.1"
    "192.168.1.1"
    "fe80::1%enp9s0"
  ];

  # Enable networking
  networking.networkmanager.enable = true;
}
