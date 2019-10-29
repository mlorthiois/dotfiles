#Prompt theme 
#For color : %F{color} or %F{fg} for initial color text
#For absolute path : %~
PROMPT='[%F{blue}%~%F{fg}]%F{green}$ %F{fg} '

# added by Anaconda2 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/matthiaslorthiois/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/matthiaslorthiois/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/Users/matthiaslorthiois/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/matthiaslorthiois/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

