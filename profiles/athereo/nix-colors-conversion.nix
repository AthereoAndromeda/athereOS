# Coverts `base16` scheme to `nix-colors` compatible scheme
{
  config,
  nix-colors,
  my-utils,
}:
with config.scheme; {
  inherit slug author;
  name = my-utils.capitalize slug;

  palette = with config.scheme.withHashtag; {
    inherit
      base00
      base01
      base02
      base03
      base04
      base05
      base06
      base07
      base08
      base09
      base0A
      base0B
      base0C
      base0D
      base0E
      base0F
      ;
  };
}
