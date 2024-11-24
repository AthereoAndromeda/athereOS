{
  config,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "zellij/layouts/default.swap.kdl".source = ./slanted.swap.kdl;
    "zellij/layouts/default.kdl".text = with config.scheme.withHashtag; ''
       layout {
         default_tab_template {
            children

            pane size=1 borderless=true {
                plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
                    format_left  "{mode}#[fg=#181825,bg=blue] #[fg=black,bg=blue,bold]{session} #[fg=blue,bg=#181825]{tabs}"
                    format_right "#[fg=#181825,bg=#b1bbfa]{datetime}"
                    format_space "#[bg=#181825]"

                    hide_frame_for_single_pane "true"

                    mode_normal        "#[bg=blue]  #[fg=blue,bg=#181825]"
                    mode_locked        "#[bg=red]  #[fg=red,bg=#181825]"
                    mode_resize        "#[bg=blue] 󰩨 #[fg=blue,bg=#181825]"
                    mode_pane          "#[bg=magenta]  #[fg=magenta,bg=#181825]"
                    mode_rename_pane   "#[bg=magenta]  #[fg=magenta,bg=#181825]"
                    mode_tab           "#[bg=cyan] 󰓩 #[fg=cyan,bg=#181825]"
                    mode_rename_tab    "#[bg=cyan] 󰓩 #[fg=cyan,bg=#181825]"
                    mode_scroll        "#[bg=blue] 󰹹 #[fg=blue,bg=#181825]"
                    mode_enter_search  "#[bg=orange]  #[fg=orange,bg=#181825]"
                    mode_search        "#[bg=orange]  #[fg=orange,bg=#181825]"
                    mode_session       "#[bg=#7d06cc]  #[fg=#7d06cc,bg=#181825]"
                    mode_move          "#[bg=${blue}] 󰆾 #[fg=${blue},bg=#181825]"
                    mode_prompt        "#[bg=blue] "
                    mode_tmux          "#[bg=magenta] "

                    tab_normal              "#[fg=#181825,bg=#4C4C59] #[fg=#000000,bg=#4C4C59]{index}  {name} #[fg=#4C4C59,bg=#181825]"
                    tab_normal_fullscreen   "#[fg=#6C7086,bg=#181825] {index} {name} [] "
                    tab_normal_sync         "#[fg=#6C7086,bg=#181825] {index} {name} <> "
                    tab_active              "#[fg=#181825,bg=#ffffff,bold,italic] {index}  {name} #[fg=#ffffff,bg=#181825]"
                    tab_active_fullscreen   "#[fg=#9399B2,bg=#181825,bold,italic] {index} {name} [] "
                    tab_active_sync         "#[fg=#9399B2,bg=#181825,bold,italic] {index} {name} <> "


                    datetime          "#[fg=#6C7086,bg=#b1bbfa,bold] {format} "
                    datetime_format   "%A, %d %b %Y %H:%M"
                    datetime_timezone "Asia/Manila"
                }
            }
          }
      }
    '';
  };
}
