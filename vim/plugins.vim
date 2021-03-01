set nocompatible      " Nécessaire
filetype off          " Nécessaire

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" On indique à Vundle de s'auto-gérer
Plugin 'gmarik/Vundle.vim'  " Nécessaire
"""""""""""""""""""""""""""""""""""
" Liste des plugins que Vundle doit gérer
"""""""""""""""""""""""""""""""""""
Plugin 'neoclide/coc.nvim'
Plugin 'alvan/vim-closetag'
Plugin 'justinmk/vim-sneak'
Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
call vundle#end()            " Nécessaire
filetype plugin indent on    " Nécessaire