set nocompatible      " Nécessaire
filetype off          " Nécessaire

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" On indique à Vundle de s'auto-gérer :)
Plugin 'gmarik/Vundle.vim'  " Nécessaire
"""""""""""""""""""""""""""""""""""
" C'est ici que vous allez placer la liste des plugins que Vundle doit gérer
"""""""""""""""""""""""""""""""""""
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'sainnhe/edge'

call vundle#end()            " Nécessaire
filetype plugin indent on    " Nécessaire

"""""""""""""""""""""""""""""""""""
" Le reste de votre .vimrc
"""""""""""""""""""""""""""""""""""
"Generalites
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
set guifont=Fira\ Code\ Regular:h15
set backspace=indent,eol,start "Permet d'utiliser la touche effacer sur mac

"Themes
set termguicolors
set background=dark
colorscheme edge
let g:lightline = {'colorscheme' : 'edge'}

"Shortcuts
"<CR> is the same as click on the button Enter
"nnoremap : only available in normal mode
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
nmap <F6> :NERDTreeToggle<CR>
