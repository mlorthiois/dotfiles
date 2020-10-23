### imports
source $HOME/dotfiles/minimal.zsh
source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh

### app themes
# bat
export BAT_THEME="base16"
export BAT_STYLE="numbers,changes,header"

# man page
export LESS_TERMCAP_us=$'\e[1;4;0m'
export LESS_TERMCAP_md=$'\e[1;34m'

### Remove base conda env from Prompt
PS1=$(echo $PS1 | sed 's/(miniconda3) //')
PS1=$(echo $PS1 | sed 's/(base) //')

### Aliases
alias count='ls | wc -l'
alias cat='clear && bat'
