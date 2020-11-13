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
alias untargz='tar -zxvf'

### History Configuration
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

source ~/.iterm2_shell_integration.zsh
GIT_BINARY=/usr/bin/git

dirty() {
    # Outputs "dirty" or "clean"
    OUTPUT=$("$GIT_BINARY" status --porcelain --ignore-submodules -unormal 2>/dev/null)
    if (($?)); then
        echo "clean"
        return
    fi
    if [ -z "$OUTPUT" ]; then
        echo "clean"
    else
        echo "dirty"
    fi
}

counts() {
    OUTPUT=$("$GIT_BINARY" rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)
    if (($?)); then
        echo "error"
        return
    fi
    echo "$OUTPUT"
}

branch() {
    OUTPUT=$("$GIT_BINARY" symbolic-ref -q --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if (($?)); then
        return
    fi
    echo "$OUTPUT"
}

adds() {
    "${GIT_BINARY}" ls-files --others --exclude-standard | wc -l
}

deletes() {
    "${GIT_BINARY}" ls-files --deleted --exclude-standard | wc -l
}
function iterm2_begin_osc {
  printf "\033]"
}

function iterm2_end_osc {
  printf "\007"
}

function iterm2_set_user_var() {
  iterm2_begin_osc
  printf "1337;SetUserVar=%s=%s" "$1" $(printf "%s" "$2" | base64 | tr -d '\n')
  iterm2_end_osc
}

git_poll () {
    DIRECTORY="$1"
    cd "$DIRECTORY"
    DIRTY=$(dirty)
    COUNTS=$(counts)
    PUSH_COUNT=$(cut -f1 <<< "$COUNTS")
    PULL_COUNT=$(cut -f2 <<< "$COUNTS")
    BRANCH=$(branch)

    iterm2_set_user_var gitBranch "$BRANCH"
    iterm2_set_user_var gitDirty "$DIRTY"
    iterm2_set_user_var gitPushCount "$PUSH_COUNT"
    iterm2_set_user_var gitPullCount "$PULL_COUNT"
    iterm2_set_user_var gitAdds "$ADDS"
    iterm2_set_user_var gitDeletes "$DELETES"
}

"$GIT_BINARY" rev-parse --git-dir 2>/dev/null >/dev/null
if (($?)); then
    iterm2_set_user_var gitBranch ""
    iterm2_set_user_var gitDirty ""
    iterm2_set_user_var gitPushCount ""
    iterm2_set_user_var gitPullCount ""
    iterm2_set_user_var gitAdds ""
    iterm2_set_user_var gitDeletes ""
else
    git_poll "$PWD"
fi

