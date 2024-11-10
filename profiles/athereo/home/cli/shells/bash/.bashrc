
# Manually get session vars defined in home.nix
# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# Used if `home-manager.useUserPackages = true;`
source /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh

# Spawns a foot terminal and runs yazi there
#
# This needs to be here because Zellij + Yazi sixel image previews is very glitchy
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	foot yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(direnv hook bash)"
eval "$(zoxide init bash)"

alias ezd="eza --icons=always --no-permissions --header --no-filesize -alD"
# alias ezf="eza --icons=always --no-permissions --header -alf --color=always | grep -v /"
alias ezf="eza --icons=always --no-permissions --header -alf --color=always"
alias ezl="eza --icons=always --no-permissions --header -al --group-directories-first"
# alias ezs="eza --icons=always --no-permissions --header -alf --color=always --sort=size | grep -v /"
alias ezs="eza --icons=always --no-permissions --header -alf --color=always --sort=size"
alias ezt="eza --icons=always --no-permissions --header -alT --git --git-repos --hyperlink"
alias ezq="eza --icons=always --no-permissions --no-filesize --no-user --no-time -al --group-directories-first"
alias ezg="ezq --grid"
alias ez="eza --icons=always -a"

alias ezh="
	echo ezd - Show directories only
	echo ezf - Show files only
	echo ezs - Show files only, size first
	echo ezl - Show everything, dirs first
	echo ezt - Show everything by tree
	echo ezq - Show everything, quiet oneline
	echo ezg - Show everything, grid
	echo ez - Show everything, default view
"

# Bubbles (extra, line)
# eval "$(oh-my-posh init bash -c https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/bubblesextra.omp.json)"
eval "$(oh-my-posh init bash -c ~/.config/oh-my-posh/mytheme.omp.json)"
