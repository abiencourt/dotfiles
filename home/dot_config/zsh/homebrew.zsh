# Homebrew config
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_BUNDLE_NO_LOCK=1

# zsh-syntax-highlighting
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-vim-mode
[[ -f "$HOMEBREW_PREFIX/share/zsh-vim-mode/zsh-vim-mode.plugin.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

# zsh-autosuggestions
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ajeetdsouza/zoxide
if [[ -f "$HOMEBREW_PREFIX/bin/zoxide" ]]; then
	export "_ZO_DATA_DIR=$XDG_CONFIG_HOME/zoxide"
	eval "$(zoxide init zsh)"
fi
# junegunn/fzf - Required to use `zf` with zoxide (might be used by some other plugins)
[[ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ]] && source $XDG_CONFIG_HOME/fzf/fzf.zsh

# awscli
if [[ -f "$HOMEBREW_PREFIX/bin/aws" ]]; then
	export AWS_PROFILE=default
	export AWS_REGION=eu-west-1
fi

# neovim
if [[ -f "$HOMEBREW_PREFIX/bin/nvim" ]]; then
	export MANPAGER="nvim +Man!"
	export VISUAL=nvim
	export EDITOR=$VISUAL
fi

# lastpass-cli
if [[ -f "$HOMEBREW_PREFIX/bin/lpass" ]]; then
	export LPASS_AGENT_TIMEOUT=0 # Lastpass-cli never quit
fi

# rustup-init
if [[ -f "$HOMEBREW_PREFIX/bin/rustup-init" ]]; then
	export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
	export CARGO_HOME="$XDG_DATA_HOME/cargo"
	export PATH="$CARGO_HOME/bin:$PATH"
fi

# thefuck
if [[ -f "$HOMEBREW_PREFIX/bin/thefuck" ]]; then
	eval "$(thefuck --alias)"
fi

# starship
if [[ -f "$HOMEBREW_PREFIX/bin/starship" ]]; then
	eval "$(starship init zsh)"
	export "STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml"
fi

# fnm
if [[ -f "$HOMEBREW_PREFIX/bin/fnm" ]]; then
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi

# Homebrew Command Not Found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
	source "$HB_CNF_HANDLER"
fi

# jenv
if [[ -f "$HOMEBREW_PREFIX/bin/jenv" ]]; then
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
fi
