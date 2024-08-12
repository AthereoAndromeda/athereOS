{pkgs, ...}: {
  home.packages = with pkgs; [
    yazi

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
