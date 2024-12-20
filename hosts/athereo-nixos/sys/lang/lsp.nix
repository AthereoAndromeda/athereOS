{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Globally required
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    python311Packages.python-lsp-server
    nil
  ];
}
