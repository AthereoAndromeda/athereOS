{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."zellij/layouts/default.kdl".text = with config.scheme.withHashtag; ''
    layout {
        swap_tiled_layout name="vertical" {
            tab max_panes=5 {
                pane split_direction="vertical" {
                    pane
                    pane { children; }
                }
            }
            tab max_panes=8 {
                pane split_direction="vertical" {
                    pane { children; }
                    pane { pane; pane; pane; pane; }
                }
            }
            tab max_panes=12 {
                pane split_direction="vertical" {
                    pane { children; }
                    pane { pane; pane; pane; pane; }
                    pane { pane; pane; pane; pane; }
                }
            }
        }

        swap_tiled_layout name="horizontal" {
            tab max_panes=5 {
                pane
                pane
            }
            tab max_panes=8 {
                pane {
                    pane split_direction="vertical" { children; }
                    pane split_direction="vertical" { pane; pane; pane; pane; }
                }
            }
            tab max_panes=12 {
                pane {
                    pane split_direction="vertical" { children; }
                    pane split_direction="vertical" { pane; pane; pane; pane; }
                    pane split_direction="vertical" { pane; pane; pane; pane; }
                }
            }
        }

        swap_tiled_layout name="stacked" {
            tab min_panes=5 {
                pane split_direction="vertical" {
                    pane
                    pane stacked=true { children; }
                }
            }
        }

        swap_floating_layout name="staggered" {
            floating_panes
        }

        swap_floating_layout name="enlarged" {
            floating_panes max_panes=10 {
                pane { x "5%"; y 1; width "90%"; height "90%"; }
                pane { x "5%"; y 2; width "90%"; height "90%"; }
                pane { x "5%"; y 3; width "90%"; height "90%"; }
                pane { x "5%"; y 4; width "90%"; height "90%"; }
                pane { x "5%"; y 5; width "90%"; height "90%"; }
                pane { x "5%"; y 6; width "90%"; height "90%"; }
                pane { x "5%"; y 7; width "90%"; height "90%"; }
                pane { x "5%"; y 8; width "90%"; height "90%"; }
                pane { x "5%"; y 9; width "90%"; height "90%"; }
                pane focus=true { x 10; y 10; width "90%"; height "90%"; }
            }
        }

        swap_floating_layout name="spread" {
            floating_panes max_panes=1 {
                pane {y "50%"; x "50%"; }
            }
            floating_panes max_panes=2 {
                pane { x "1%"; y "25%"; width "45%"; }
                pane { x "50%"; y "25%"; width "45%"; }
            }
            floating_panes max_panes=3 {
                pane focus=true { y "55%"; width "45%"; height "45%"; }
                pane { x "1%"; y "1%"; width "45%"; }
                pane { x "50%"; y "1%"; width "45%"; }
            }
            floating_panes max_panes=4 {
                pane { x "1%"; y "55%"; width "45%"; height "45%"; }
                pane focus=true { x "50%"; y "55%"; width "45%"; height "45%"; }
                pane { x "1%"; y "1%"; width "45%"; height "45%"; }
                pane { x "50%"; y "1%"; width "45%"; height "45%"; }
            }
        }

        default_tab_template {
            pane size=2 borderless=true {
                plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
                    // Nord theme
                    // color_fg "#616e88" //= Brightest + 10% - "#4C566A" = Brightest - "#434C5E" = Bright
                    // color_bg "#2E3440"
                    // color_black "#3B4252"
                    // color_red "#BF616A"
                    // color_green "#A3BE8C"
                    // color_yellow "#EBCB8B"
                    // color_blue "#81A1C1"
                    // color_magenta "#B48EAD"
                    // color_cyan "#88C0D0"
                    // color_white "#E5E9F0"
                    // color_orange "#D08770"


                    color_fg "${base05}"
                    color_bg "${base00}"
                    color_black "#3B4252"
                    color_red "${red}"
                    color_green "${green}"
                    color_yellow "${yellow}"
                    color_blue "${blue}"
                    color_magenta "${magenta}"
                    color_cyan "${cyan}"
                    color_white "#E5E9F0"
                    color_orange "${orange}"

                    format_left   "{mode}#[bg=$bg] {tabs}"
                    format_center "#[bg=$bg,fg=$fg] Zellij: #[bg=$bg,fg=$fg]{session}"
                    format_right  "{datetime}"
                    format_space  "#[bg=$bg]"
                    format_hide_on_overlength "true"
                    format_precedence "crl"

                    border_enabled  "false"
                    border_char     "─"
                    border_format   "#[fg=#6C7086]{char}"
                    border_position "top"

                    hide_frame_for_single_pane "true"

                    mode_normal        "#[bg=$green,fg=$bg,bold] NORMAL#[bg=$bg,fg=$green]"
                    mode_locked        "#[bg=$red,fg=$bg,bold] LOCKED #[bg=$bg,fg=$red]"
                    mode_resize        "#[bg=$blue,fg=$bg,bold] RESIZE 󰩨#[bg=$bg,fg=$blue]"
                    mode_pane          "#[bg=$blue,fg=$bg,bold] PANE #[bg=$bg,fg=$blue]"
                    mode_tab           "#[bg=$yellow,fg=$bg,bold] TAB 󰓩#[bg=$bg,fg=$yellow]"
                    mode_scroll        "#[bg=$blue,fg=$bg,bold] SCROLL#[bg=$bg,fg=$blue]"
                    mode_enter_search  "#[bg=$orange,fg=$bg,bold] ENT-SEARCH#[bg=$bg,fg=$orange]"
                    mode_search        "#[bg=$orange,fg=$bg,bold] SEARCHARCH#[bg=$bg,fg=$orange]"
                    mode_rename_tab    "#[bg=$yellow,fg=$bg,bold] RENAME-TAB#[bg=$bg,fg=$yellow]"
                    mode_rename_pane   "#[bg=$blue,fg=$bg,bold] RENAME-PANE#[bg=$bg,fg=$blue]"
                    mode_session       "#[bg=$blue,fg=$bg,bold] SESSION#[bg=$bg,fg=$blue]"
                    mode_move          "#[bg=$blue,fg=$bg,bold] MOVE#[bg=$bg,fg=$blue]"
                    mode_prompt        "#[bg=$blue,fg=$bg,bold] PROMPT#[bg=$bg,fg=$blue]"
                    mode_tmux          "#[bg=$magenta,fg=$bg,bold] TMUX#[bg=$bg,fg=$magenta]"

                    // formatting for inactive tabs
                    tab_normal              "#[bg=$bg,fg=$cyan]#[bg=$cyan,fg=$bg,bold]{index} #[bg=$bg,fg=$cyan,bold] {name}{floating_indicator}#[bg=$bg,fg=$bg,bold]"
                    tab_normal_fullscreen   "#[bg=$bg,fg=$cyan]#[bg=$cyan,fg=$bg,bold]{index} #[bg=$bg,fg=$cyan,bold] {name}{fullscreen_indicator}#[bg=$bg,fg=$bg,bold]"
                    tab_normal_sync         "#[bg=$bg,fg=$cyan]#[bg=$cyan,fg=$bg,bold]{index} #[bg=$bg,fg=$cyan,bold] {name}{sync_indicator}#[bg=$bg,fg=$bg,bold]"

                    // formatting for the current active tab
                    tab_active              "#[bg=$bg,fg=$yellow]#[bg=$yellow,fg=$bg,bold]{index} #[bg=$bg,fg=$yellow,bold] {name}{floating_indicator}#[bg=$bg,fg=$bg,bold]"
                    tab_active_fullscreen   "#[bg=$bg,fg=$yellow]#[bg=$yellow,fg=$bg,bold]{index} #[bg=$bg,fg=$yellow,bold] {name}{fullscreen_indicator}#[bg=$bg,fg=$bg,bold]"
                    tab_active_sync         "#[bg=$bg,fg=$yellow]#[bg=$yellow,fg=$bg,bold]{index} #[bg=$bg,fg=$yellow,bold] {name}{sync_indicator}#[bg=$bg,fg=$bg,bold]"

                    // separator between the tabs
                    tab_separator           "#[bg=$bg] "

                    // indicators
                    tab_sync_indicator       " "
                    tab_fullscreen_indicator " 󰊓"
                    tab_floating_indicator   " 󰹙"

                    command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
                    command_git_branch_format      "#[fg=$blue] {stdout} "
                    command_git_branch_interval    "10"
                    command_git_branch_rendermode  "static"

                    datetime        "#[fg=$fg] {format} "
                    datetime_format "%Y-%m-%d %H:%M"
                    datetime_timezone "Asia/Manila"
                }
            }
            children

            pane size=1 borderless=true {
                plugin location="status-bar"
            }
        }
    }
  '';
}
