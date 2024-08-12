{pkgs, ...}: {
  home.packages = [pkgs.nushell];

  xdg.configFile = {
    "nushell/config.nu".source = ./config.nu;
    "nushell/zoxide.nu".source = ./zoxide.nu;
    "nushell/oh-my-posh.nu".source = ./oh-my-posh.nu;
  };
}
