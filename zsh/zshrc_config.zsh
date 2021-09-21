# macOS: use zsh from brew (https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/)
# if problem, Settings -> Users and groups -> Ctrl+clic on username -> Advanced options -> Shell

###############
# UI
###############
source $HOME/dotfiles/zsh/minimal.zsh

export BAT_THEME="base16"
export BAT_STYLE="numbers,changes,header"
export LESS_TERMCAP_us=$'\e[1;4;0m'
export LESS_TERMCAP_md=$'\e[1;34m'

###############
# COMPLETION
###############
# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Speed up completion init, see: https://htr3n.github.io/2018/07/faster-zsh/
autoload -Uz compinit

### History Configuration
HISTSIZE=5000            #How many lines of history to keep in memory
HISTFILE=~/.zsh_history  #Where to save history to disk
SAVEHIST=5000            #Number of history entries to save to disk
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed
setopt HIST_SAVE_NO_DUPS # Dont write duplicate entries in the history file.
setopt AUTO_CD           # Jump without cd

##############
# FUNCTIONS
##############
# Set env var based on theme set in kitty conf file
check-kitty-theme() {
  kitty_config_dir="$HOME/.config/kitty"
  config_file="$kitty_config_dir/kitty.conf"
  if [ $(grep "themes/dark" "$config_file") ];then  
    export KITTY_COLORS="dark"
  else
    export KITTY_COLORS="light"
  fi
}
check-kitty-theme

# Switch kitty theme by replacing in kitty.conf
kitty-switch-theme() {
  if [ ! -z $TMUX ]; then
    echo "Oops... Inside tmux"
    return 1
  fi

  kitty_config_dir="$HOME/.config/kitty"
  config_file="$kitty_config_dir/kitty.conf"

  if [[ $KITTY_COLORS == "dark" ]];then  
    echo "Switching to light theme..."
    sed -i.bak -e 's/themes\/dark.conf/themes\/light.conf/g' $config_file
    kitty @ set-colors -a "$kitty_config_dir/themes/light.conf"
    export KITTY_COLORS="light"
  else
    echo "Switching to dark theme..."
    sed -i.bak -e 's/themes\/light.conf/themes\/dark.conf/g' $config_file
    kitty @ set-colors -a "$kitty_config_dir/themes/dark.conf"
    export KITTY_COLORS="dark"
  fi
  rm $kitty_config_dir/kitty.conf.bak
}

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
# Reload conda https://github.com/conda/conda/issues/6826#issuecomment-397287212
# if [ ! -z $TMUX ]; then
#   conda deactivate; conda activate base
# fi

# tmux with full dev layout session with FZF (CTRL-F)
# based on https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer
tmux-dev() {
  items=`find ~/Developer -maxdepth 2 -mindepth 2 -type d`
  items+=("\n$HOME/dotfiles")
  selected=`echo "$items" | fzf`

  # If no project selected, exit function
  if [ ! $? -eq 0 ]; then
    return 1
  fi

#   tmux_session_name=`basename $selected | tr . _`
#   tmux has-session -t="$tmux_session_name" 2> /dev/null
#   if [ ! $? -eq 0 ]; then
#     tmux new-session -c $selected -d -s $tmux_session_name
#     tmux split-window -h -f -p 35 -c $selected
#     tmux split-window -v -c $selected
#     tmux select-pane -t 0
#   fi
#   tmux attach -t $tmux_session_name

  kitty @ new-window --keep-focus --cwd $selected
  kitty @ new-window --keep-focus --cwd $selected
  cd $selected
  clear
}
bindkey -s '^f' 'tmux-dev^M'

###########
# FZF
###########
# Use key-bindings and cli utils
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# Use ripgrep
if type fzf &> /dev/null && type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!vendor/*"'
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
  export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND
fi

#############
# LAST MODIFS
#############
PS1=$(echo $PS1 | sed 's/(miniconda3) //' | sed 's/(base) //')
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
