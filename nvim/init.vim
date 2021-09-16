"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

lua require('impatient')
if !exists('g:vscode')
    lua require('plugins')
else
    source $HOME/.config/nvim/vscode.vim
endif
