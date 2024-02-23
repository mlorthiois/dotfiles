###############
# UI
###############
export BAT_THEME="ansi"
export BAT_STYLE="numbers,changes,header"
export LESS_TERMCAP_us=$'\e[1;4;0m'
export LESS_TERMCAP_md=$'\e[1;34m'
export TERM=xterm

###############
# COMPLETION
###############
typeset -U PATH
autoload colors; colors;

HISTFILE=~/.zsh_history # Where to save history to disk
HISTSIZE=10000          # How many lines of history to keep in memory
SAVEHIST=10000          # Number of history entries to save to disk

setopt EXTENDED_HISTORY
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Dont write duplicate entries in the history file.

setopt inc_append_history
setopt share_history
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

##############
# FUNCTIONS
##############
my-accept-line () {
  # check if the buffer does not contain any words
  if [ ${#${(z)BUFFER}} -eq 0 ]; then
    # output doesnt start next to the prompt
    echo
    eza -la --icons --group-directories-first --no-filesize
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N my-accept-line
bindkey '^M' my-accept-line

set_fzf_theme() {
	if [[ "$KITTY_COLORS" == "dark" ]]; then
		export FZF_DEFAULT_OPTS='--color=bg+:#3F3F3F,bg:#1d1d1c,border:#6B6B6B,spinner:#98BC99,hl:#719872,fg:#d1d1d1,header:#719872,info:#BDBB72,pointer:#E12672,marker:#E17899,fg+:#D9D9D9,preview-bg:#3F3F3F,prompt:#98BEDE,hl+:#98BC99'
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
# Dev
#############
devmode() {
	cd "$HOME"
	items=$(find "./Developer" -maxdepth 1 -mindepth 1 -type d)
	items+=("\n./dotfiles")
	selected=$(echo "$items" | fzf | awk '{$1=$1};1') # awk = remove tailing space

	# If no project selected, exit function
	if [ ! $? -eq 0 ]; then
		return 1
	fi

	kitty @ new-window --keep-focus --cwd "$selected"
	kitty @ new-window --keep-focus --cwd "$selected"
	cd "$selected"
	clear
	nvim
}
bindkey -s '^f' 'devmode^M'

#############
# Aliases
#############
alias tv="terraform validate"
alias tp="terraform plan"
alias ta="terraform apply"

####################################################
source $HOME/.config/zsh/private.zsh

############
# Brew
############
# eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/opt/homebrew/bin/:$PATH"

############
# FZF
############
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
# direnv
##############
if type direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

##############
# PATH
##############
export PATH="$PATH:$HOME/.local/bin"

##############
# PLUGINS
##############
source "$HOME/.local/share/zsh/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.local/share/zsh/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
eval "$(starship init zsh)"
