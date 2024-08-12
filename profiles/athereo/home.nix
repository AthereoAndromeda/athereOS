{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  inputs,
  scheme,
  nix-colors,
  my-utils,
  ...
}: {
  imports = [
    inputs.base16.homeManagerModule
    nix-colors.homeManagerModules.default
    {inherit scheme;}
    ./home
  ];

  # nix-colors
  colorScheme = import ./nix-colors-conversion.nix {inherit config nix-colors my-utils;};
  # colorScheme = nix-colors.colorSchemes.rebecca;

  # Custom themes
  gtk-theme.tokyo-night.enable = false;
  gtk-theme.base16.enable = true;

  # programs.helix.extraConfig =
  #   builtins.readFile (config.scheme inputs.base16-helix);
  programs.zathura.enable = true;

  programs.zathura.extraConfig =
    builtins.readFile (config.scheme inputs.base16-zathura);

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "athereo";
  home.homeDirectory = "/home/athereo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages =
    (with pkgs; [
      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:

      (pkgs.writeShellScriptBin "delete-cliphist-items" ''
        cliphist list | fzf --multi | cliphist delete
      '')

      socat
    ])
    ++ (with pkgs-unstable; [
      spotube # ''
      obsidian # Stable is potentially unsafe
    ]);

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".assets/" = {
      source = ./assets;
      recursive = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/athereo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  # Set some perms for virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Enable toolkits
  qt.enable = true;

  xdg.enable = true;

  # ~~Let Home Manager install and manage itself.~~
  # Let NixOS handle home-manager
  programs.home-manager.enable = false;
}
