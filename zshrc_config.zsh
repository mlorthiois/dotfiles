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
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcr='docker-compose run'

### Functions
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

### History Configuration
HISTSIZE=5000           #How many lines of history to keep in memory
HISTFILE=~/.zsh_history #Where to save history to disk
SAVEHIST=5000           #Number of history entries to save to disk
setopt appendhistory    #Append history to the history file (no overwriting)
setopt sharehistory     #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed

### iTerm2
source ~/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
  it2git
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


### TMUX session
tmux-dev() {  
  session=$1
  tmux has-session -t $session
  if [ $? != 0 ]
  then
    tmux new-session -s $session -n editor -d nvim
    tmux split-window -h -p0
    tmux split-window
    tmux select-pane -t 0
    tmux attach -t $session
  else
    echo 'SESSION ALREADY EXISTS'
  fi
} 

