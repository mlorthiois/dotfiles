#################################################################
# Source files
#################################################################
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/private.zsh
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

#################################################################
# Init starship
#################################################################
eval "$(starship init zsh)"
