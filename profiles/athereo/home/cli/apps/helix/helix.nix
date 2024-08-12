{
  config,
  inputs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "base16";

      editor = {
        bufferline = "multiple";
        lsp.display-inlay-hints = true;
      };

      keys.normal = {
        V = ["goto_first_nonwhitespace" "extend_to_line_end"];
        D = ["ensure_selections_forward" "extend_to_line_end"];
        A-x = ["extend_line_up" "extend_to_line_bounds"];
      };

      keys.select = {
        A-x = ["extend_line_up" "extend_to_line_bounds"];
        "," = ["collapse_selection" "normal_mode"];

        # Same behaviour as normal mode x
        x = "extend_line";

        # Counterpart for normal mode V
        V = "extend_to_line_end";
      };
    };

    # themes = {
    # Parse this into something somehow
    # base16 = builtins.readFile (config.scheme inputs.base16-helix);
    # };
  };

  xdg.configFile = {
    "helix/themes/base16.toml".text = builtins.readFile (config.scheme inputs.base16-helix);
    #   "helix/config.toml".text = ''
    #     theme = "base16_transparent"

    #     [editor.lsp]
    #     display-inlay-hints = true
    #   '';
  };
}
