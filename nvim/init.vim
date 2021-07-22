"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

if !exists('g:vscode')
    source $HOME/.config/nvim/settings.vim
    lua require('plugins')
    source $HOME/.config/nvim/keymappings.vim
else
    source $HOME/.config/nvim/vscode.vim
endif
