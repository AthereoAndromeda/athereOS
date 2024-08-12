
# Manually get session vars defined in home.nix
# source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# Used if `home-manager.useUserPackages = true;`
source /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

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

# Spawn foot terminal and run yazi. Does not move to last exited dir.
function yaz() {
	foot yazi "$@"
}

eval "$(direnv hook bash)"
eval "$(zoxide init bash)"



# Bubbles (extra, line)
# eval "$(oh-my-posh init bash -c https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/bubblesextra.omp.json)"
eval "$(oh-my-posh init bash -c ~/.config/oh-my-posh/mytheme.omp.json)"
