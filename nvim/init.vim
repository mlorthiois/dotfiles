
"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

if !exists('g:vscode')
    lua require('plugins')
    source $HOME/.config/nvim/settings.vim
    source $HOME/.config/nvim/keymappings.vim
    source $HOME/.config/nvim/plugins_keymappings.vim
    source $HOME/.config/nvim/which_key.vim
    lua require('nv-galaxyline')
    lua require('indentline')
    lua require('lsp')
    lua require('git')
    lua require('nv-compe')
    lua require('comment')
    lua require('treesitter')
else
    source $HOME/.config/nvim/keymappings.vim
    source $HOME/.config/nvim/vscode.vim
endif

