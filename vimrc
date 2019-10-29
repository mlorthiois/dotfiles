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
Plugin 'ayu-theme/ayu-vim'
Plugin 'sainnhe/edge'
Plugin 'xuhdev/vim-latex-live-preview.git'
Plugin 'lervag/vimtex'

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
set guifont=Menlo:h13
set backspace=indent,eol,start "Permet d'utiliser la touche effacer sur mac

"Thème utilisé
set termguicolors
set background=dark
colorscheme perso
let g:lightline = {'colorscheme' : 'edge'}

"Shortcuts
"<CR> is the same as click on the button Enter
"nnoremap : only available in normal mode
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>

nmap <F6> :NERDTreeToggle<CR>

"vim-latex-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
let g:polyglot_disabled = ['latex']
