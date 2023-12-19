###############
# UI
###############
PS1=$(echo $PS1 | sed 's/(miniconda3) |(base) //')
export BAT_THEME="base16"
export BAT_STYLE="numbers,changes,header"
export LESS_TERMCAP_us=$'\e[1;4;0m'
export LESS_TERMCAP_md=$'\e[1;34m'

###############
# COMPLETION
###############
autoload -Uz compinit   # Speed up completion init, see: https://htr3n.github.io/2018/07/faster-zsh/
HISTSIZE=5000           # How many lines of history to keep in memory
HISTFILE=~/.zsh_history # Where to save history to disk
SAVEHIST=5000           # Number of history entries to save to disk
setopt appendhistory    # Append history to the history file (no overwriting)
setopt sharehistory     # Share history across terminals
setopt incappendhistory # Immediately append to the history file, not just when a term is killed
setopt histignoredups   # Dont write duplicate entries in the history file.
setopt AUTO_CD          # Jump without cd

##############
# FUNCTIONS
##############
# Kitty
check-kitty-theme() {
	kitty_config_dir="$HOME/.config/kitty"
	config_file="$kitty_config_dir/kitty.conf"
	if grep -q "themes/dark" "$config_file"; then
		export KITTY_COLORS="dark"
	else
		export KITTY_COLORS="light"
	fi
}

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
}

# Set env var based on theme set in kitty conf file
case $OSTYPE in
darwin*)
	check-kitty-theme
	;;
esac

extract() {
	if [ -f $1 ]; then
		output=$(echo "${1%.*}")
		case $1 in
		*.7z) 7z x $1 ;;
		*.lzma) unlzma $1 ;;
		*.rar) unrar x $1 ;;
		*.tar) tar xvf $1 ;;
		*.tar.bz2) tar xvjf $1 ;;
		*.bz2) bunzip2 $1 ;;
		*.tar.gz) tar xvzf $1 ;;
		*.gz) gunzip -c $1 >$output ;;
		*.tar.xz) tar Jxvf $1 ;;
		*.xz) xz -d $1 ;;
		*.tbz2) tar xvjf $1 ;;
		*.tgz) tar xvzf $1 ;;
		*.zip) unzip $1 ;;
		*.Z) uncompress ;;
		*)
			echo "don't know how to extract $1..."
			return 1
			;;
		esac
		echo -e "\e[92m$output successfully created"
		return 0
	else
		echo -e "\e[91mError: the file '$1' doesn't exist!"
		return 2
	fi
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
# If start in tmux, relaunch conda, else create and join tmux session
# if [ -z "$TMUX" ]; then
#     tmux attach -t TMUX || tmux new -s TMUX && exit
# else  # Reload conda https://github.com/conda/conda/issues/6826#issuecomment-397287212
#     conda deactivate
#     conda activate base
# fi

# tmux with full dev layout session with FZF (CTRL-F) (github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer)
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
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
	source /usr/local/opt/fzf/shell/key-bindings.zsh
fi

# Use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!vendor/*"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND

##############
# PLUGINS
##############
source "$HOME/.local/share/zsh/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.local/share/zsh/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
