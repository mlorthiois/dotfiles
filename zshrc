#Prompt theme 
#For color : %F{color} or %F{fg} for initial color text
#For absolute path : %~
PROMPT='%F{blue}%2~
%F{green}> %F{fg} '

#Add Miniconda
export PATH=~/miniconda/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matthiaslorthiois/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matthiaslorthiois/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/matthiaslorthiois/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matthiaslorthiois/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

