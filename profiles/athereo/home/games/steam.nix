{
  pkgs,
  pkgs-unstable,
  ...
}: {
  # Remember to import in games.nix
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # Remember to prepend these to the General Launch Options in steam
  # - gamemoderun %command%
  # - mangohud %command%
  # - gamemode %command%

  home.packages = with pkgs; [
    mangohud
    protonup
  ];

  home.sessionVariables = {
    #remember to run protonup
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
