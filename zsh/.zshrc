#################################################################
# Source files
#################################################################
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/private.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

#################################################################
# List directory on empty command (Enter)
#################################################################
my-accept-line () {
  # check if the buffer does not contain any words
  if [ ${#${(z)BUFFER}} -eq 0 ]; then
    # output doesnt start next to the prompt
    echo
    eza -lFa --icons --group-directories-first --no-filesize
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N my-accept-line
bindkey '^M' my-accept-line

#################################################################
# Init starship
#################################################################
export TERM=xterm
eval "$(starship init zsh)"
