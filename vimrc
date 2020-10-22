set nocompatible      " Nécessaire
filetype off          " Nécessaire

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" On indique à Vundle de s'auto-gérer
Plugin 'gmarik/Vundle.vim'  " Nécessaire
"""""""""""""""""""""""""""""""""""
" Liste des plugins que Vundle doit gérer
"""""""""""""""""""""""""""""""""""
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'cormacrelf/vim-colors-github'
Plugin 'alvan/vim-closetag'
Plugin 'justinmk/vim-sneak'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
call vundle#end()            " Nécessaire
filetype plugin indent on    " Nécessaire

"""""""""""""""""""""""""""""""""""
" Reste du .vimrc
"""""""""""""""""""""""""""""""""""
"Generalites
set mouse=a
set noswapfile
set number
syntax on
set cursorline
set noerrorbells
set novisualbell
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set backspace=indent,eol,start "Permet d'utiliser la touche effacer sur mac
let g:sneak#label = 1


"Thème utilisé
" colorscheme onehalflight

"Shortcuts
"<CR> is the same as click on the button Enter
"nnoremap : only available in normal mode
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:!clang % -o %:r && clear && ./%:r<CR>
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2

nmap <F6> :NERDTreeToggle<CR>
