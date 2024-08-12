{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
  ];

  shellHook = ''
    eww open bar -c .
  '';
}
