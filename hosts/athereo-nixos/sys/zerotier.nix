{...}: {
  services.zerotierone = {
    enable = true;
    port = 9994;
  };

  networking.firewall = {
    allowedTCPPorts = [
      9994
    ];

    allowedUDPPorts = [
      9994
    ];
  };
}
