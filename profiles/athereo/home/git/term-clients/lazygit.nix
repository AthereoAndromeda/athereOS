{...}: {
  programs.lazygit.enable = true;
  programs.bash.shellAliases = {
    lg = "lazygit";
  };
}
