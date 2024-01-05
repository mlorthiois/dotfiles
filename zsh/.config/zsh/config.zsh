###############
# UI
###############
export BAT_THEME="ansi"
export BAT_STYLE="numbers,changes,header"
export LESS_TERMCAP_us=$'\e[1;4;0m'
export LESS_TERMCAP_md=$'\e[1;34m'

###############
# COMPLETION
###############
autoload -Uz compinit   # Speed up completion init, see: https://htr3n.github.io/2018/07/faster-zsh/
HISTSIZE=10000          # How many lines of history to keep in memory
HISTFILE=~/.zsh_history # Where to save history to disk
SAVEHIST=10000          # Number of history entries to save to disk
setopt appendhistory    # Append history to the history file (no overwriting)
setopt sharehistory     # Share history across terminals
setopt incappendhistory # Immediately append to the history file, not just when a term is killed
setopt histignoredups   # Dont write duplicate entries in the history file.

##############
# FUNCTIONS
##############
# Kitty
open-overlay() {
	kitty @ launch --cwd current --type overlay-main --no-response $@
}

set_fzf_theme() {
	if [[ "$KITTY_COLORS" == "dark" ]]; then
		export FZF_DEFAULT_OPTS='--color=bg+:#3F3F3F,bg:#4B4B4B,border:#6B6B6B,spinner:#98BC99,hl:#719872,fg:#D9D9D9,header:#719872,info:#BDBB72,pointer:#E12672,marker:#E17899,fg+:#D9D9D9,preview-bg:#3F3F3F,prompt:#98BEDE,hl+:#98BC99'
	else
		export FZF_DEFAULT_OPTS='--color=bg+:#e0e0e0,bg:#FFFFFF,border:#6B6B6B,spinner:#98BC99,hl:#116432,fg:#333333,header:#719872,info:#bd5890,pointer:#cc0000,marker:#E17899,fg+:#000000,preview-bg:#FFFFFF,prompt:#324d59,hl+:#116432'
	fi
}

check_kitty_theme() {
	kitty_config_dir="$HOME/.config/kitty"
	config_file="$kitty_config_dir/kitty.conf"
	if grep -q "themes/dark" "$config_file"; then
		export KITTY_COLORS="dark"
	else
		export KITTY_COLORS="light"
	fi
	set_fzf_theme
}
check_kitty_theme

kitty-switch-theme() {
	if [ -n "$TMUX" ]; then
		echo "Oops... Inside tmux"
		return 1
	fi

	kitty_config_dir="$HOME/.config/kitty"
	config_file="$kitty_config_dir/kitty.conf"
	old_colors=$KITTY_COLORS

	if [[ "$old_colors" == "dark" ]]; then
		export KITTY_COLORS="light"
	else
		export KITTY_COLORS="dark"
	fi

	echo "Switching to $KITTY_COLORS theme..."
	sed -i.bak -e "s/themes\/$old_colors.conf/themes\/$KITTY_COLORS.conf/g" "$config_file"
	kitty @ set-colors --all --configured "$kitty_config_dir/themes/$KITTY_COLORS.conf"
	rm "$kitty_config_dir/kitty.conf.bak"
	set_fzf_theme
}

### Use Ctrl-Z to fg - return in NeoVim without adding fg to ZSH History
function Resume {
	fg
	zle push-input
	BUFFER=""
	zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

#############
# TMUX
#############
# tmux with full dev layout session with FZF (CTRL-F)
# (github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer)
devmode() {
	items=$(find ~/Developer -maxdepth 2 -mindepth 2 -type d)
	items+=("\n$HOME/dotfiles")
	selected=$(echo "$items" | fzf)

	# If no project selected, exit function
	if [ ! $? -eq 0 ]; then
		return 1
	fi

	if [ -n "$TMUX" ]; then
		tmux_session_name=$(basename "$selected" | tr . _)
		tmux has-session -t="$tmux_session_name" 2>/dev/null
		if [ ! $? -eq 0 ]; then
			tmux new-session -c "$selected" -d -s "$tmux_session_name"
			tmux split-window -h -f -p 35 -c "$selected"
			tmux split-window -v -c "$selected"
			tmux select-pane -t 0
		fi
		tmux attach -t "$tmux_session_name"
	else
		kitty @ new-window --keep-focus --cwd "$selected"
		kitty @ new-window --keep-focus --cwd "$selected"
	fi
	cd "$selected"
	clear
}
bindkey -s '^f' 'devmode^M'

############
# FZF
############
# Use key-bindings and cli utils
if [ -e /usr/local/opt/fzf/shell/key-bindings.zsh ]; then
	source /usr/local/opt/fzf/shell/key-bindings.zsh
elif [ -e /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
	source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# Use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND

##############
# PyEnv
##############
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path zsh -)"
fi

##############
# PLUGINS
##############
source "$HOME/.local/share/zsh/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.local/share/zsh/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
