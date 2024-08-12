{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Globally required
    nodePackages.bash-language-server
    nodePackages.vscode-css-languageserver-bin
    python311Packages.python-lsp-server
    nil
  ];
}
