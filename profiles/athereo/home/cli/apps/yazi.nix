{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;

    keymap = {
      manager.prepend_keymap = [
        {
          on = ["c"];
          run = "close";
          desc = "Close tab";
        }
      ];
    };

    # theme = {
    #   flavor = { use = "rose pine";}; crystal
    # };
  };

  home.packages = with pkgs; [
    # TODO: Move to sys/utils.nix
    fd
    ripgrep
    unar
    jq
    poppler
    # fzf
    zoxide
    ffmpegthumbnailer
    mediainfo
    exiftool
  ];
}
