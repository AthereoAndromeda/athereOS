{
  config,
  pkgs-unstable,
  ...
}: {
  # Keep at latest version
  home.packages = [pkgs-unstable.oh-my-posh];

  xdg.configFile = {
    "oh-my-posh/mytheme.omp.json".text = with config.scheme; ''
      {
        "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
        "blocks": [
          {
            "alignment": "right",
            "segments": [
              {
                "background": "#${base00}",
                "foreground": "#${base06}",
                "leading_diamond": "\ue0b6",
                "properties": {
                  "style": "folder"
                },
                "style": "diamond",
                "template": "\ue5ff {{ .Path }}",
                "trailing_diamond": "\ue0b4",
                "type": "path"
              },
              {
                "background": "#${base00}",
                "foreground": "#43CCEA",
                "foreground_templates": [
                  "{{ if or (.Working.Changed) (.Staging.Changed) }}#FF9248{{ end }}",
                  "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#ff4500{{ end }}",
                  "{{ if gt .Ahead 0 }}#B388FF{{ end }}",
                  "{{ if gt .Behind 0 }}#B388FF{{ end }}"
                ],
                "leading_diamond": " \ue0b6",
                "properties": {
                  "branch_max_length": 25,
                  "fetch_stash_count": true,
                  "fetch_status": true,
                  "fetch_upstream_icon": true
                },
                "style": "diamond",
                "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ",
                "trailing_diamond": "\ue0b4",
                "type": "git"
              },
              {
                "background": "#${base00}",
                "foreground": "#E4F34A",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "python"
              },
              {
                "background": "#${base00}",
                "foreground": "#7FD5EA",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue626{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "go"
              },
              {
                "background": "#${base00}",
                "foreground": "#42E66C",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue718{{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}",
                "trailing_diamond": "\ue0b4",
                "type": "node"
              },
              {
                "background": "#${base00}",
                "foreground": "#E64747",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue791{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "ruby"
              },
              {
                "background": "#${base00}",
                "foreground": "#E64747",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue738{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
                "trailing_diamond": "\ue0b4",
                "type": "java"
              },
              {
                "background": "#${base00}",
                "foreground": "#9B6BDF",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "style": "diamond",
                "template": "\ue624{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }} ",
                "trailing_diamond": "\ue0b4",
                "type": "julia"
              },
              {
                "background": "#${base00}",
                "foreground": "#ffffff",
                "style": "diamond",
                "leading_diamond": " \ue0b6",
                "properties": {
                  "fetch_version": false
                },
                "template": "\ue73d {{ .Full }} ",
                "trailing_diamond": "\ue0b4",
                "type": "php"
              },
              {
                "background": "#${base00}",
                "foreground": "#9B6BDF",
                "foreground_templates": [
                  "{{if eq \"Charging\" .State.String}}#40c4ff{{end}}",
                  "{{if eq \"Discharging\" .State.String}}#ff5722{{end}}",
                  "{{if eq \"Full\" .State.String}}#4caf50{{end}}"
                ],
                "leading_diamond": " \ue0b6",
                "properties": {
                  "charged_icon": " ",
                  "charging_icon": "\u21e1 ",
                  "discharging_icon": "\u21e3 "
                },
                "style": "diamond",
                "template": "{{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}",
                "trailing_diamond": "\ue0b4",
                "type": "battery"
              }
            ],
            "type": "prompt"
          },
          {
            "alignment": "left",
            "newline": true,
            "segments": [
              {
                "background": "#${base00}",
                "foreground": "#${base04}",
                "leading_diamond": "\ue0b6",
                "properties": {
                  "style": "austin",
                  "threshold": 150
                },
                "style": "diamond",
                "template": "{{ .FormattedMs }}",
                "trailing_diamond": "\ue0b4 ",
                "type": "executiontime"
              },
              {
                "background": "#${base00}",
                "foreground": "#${base05}",
                "leading_diamond": "\ue0b6",
                "style": "diamond",
                "template": "{{ .UserName }} \u276f",
                "trailing_diamond": "\ue0b4",
                "type": "text"
              }
            ],
            "type": "prompt"
          }
        ],
        "final_space": true,
        "version": 2
      }
    '';
  };
}
