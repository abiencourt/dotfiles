# eza
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -la"
function tree() {
	if [[ "$@" != "" ]]; then
		eza --tree --icons --group-directories-first "$@"
	else
		eza --tree --icons --group-directories-first
	fi
}

# bat
alias cat="bat"

# global
alias grep="grep --color"

# lazygit
alias lg="lazygit"

# lazydocker
alias ld="lazydocker"
