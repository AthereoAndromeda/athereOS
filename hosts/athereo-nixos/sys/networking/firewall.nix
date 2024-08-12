{...}: {
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      80
      443
      25565 # Minecraft
      53317
    ];

    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 53315;
        to = 53318;
      }
      {
        from = 8000;
        to = 8010;
      }
    ];
  };
}
