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
export XDG_CONFIG_HOME="$HOME/.config"

if [ -e "$XDG_CONFIG_HOME/zsh/utils.zsh" ]; then
  source "$XDG_CONFIG_HOME/zsh/utils.zsh"
fi

if [ -e $HOME/.config/zsh/private.zsh ]; then
  source $HOME/.config/zsh/private.zsh
fi

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

### Use Ctrl-Z to fg - return in NeoVim without adding fg to ZSH History
function Resume {
	fg
	zle push-input
	BUFFER=""
	zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

############
# CLI utils
############
if [ -e "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

set_fzf_theme() {
	if [[ "$TERMINAL_THEME" == "dark" ]]; then
		export FZF_DEFAULT_OPTS='--color=bg+:#3F3F3F,bg:#1d1d1c,border:#6B6B6B,spinner:#98BC99,hl:#719872,fg:#d1d1d1,header:#719872,info:#BDBB72,pointer:#E12672,marker:#E17899,fg+:#D9D9D9,preview-bg:#3F3F3F,prompt:#98BEDE,hl+:#98BC99'
	else
		export FZF_DEFAULT_OPTS='--color=bg+:#e0e0e0,bg:#FFFFFF,border:#6B6B6B,spinner:#98BC99,hl:#116432,fg:#333333,header:#719872,info:#bd5890,pointer:#cc0000,marker:#E17899,fg+:#000000,preview-bg:#FFFFFF,prompt:#324d59,hl+:#116432'
	fi
}
set_fzf_theme

if [ -e /usr/local/opt/fzf/shell/key-bindings.zsh ]; then
	source /usr/local/opt/fzf/shell/key-bindings.zsh
elif [ -e /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
	source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [ -e "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh" ]; then
 source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND

if type direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

if type terraform &> /dev/null; then
  alias ti="terraform init"
  alias tv="terraform validate"
  alias tp="terraform plan"
  alias ta="terraform apply"
  alias td="terraform destroy"
fi

if type lazygit &> /dev/null; then
  alias lg="lazygit"
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
