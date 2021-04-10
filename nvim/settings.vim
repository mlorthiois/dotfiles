syntax on                       " Enables syntax highlighing
set noswapfile                  " Don't create .swp files
set hidden                      " Required to keep multiple buffers open multiple buffers
set nowrap                      " Display long lines as just one line
set encoding=utf-8              " The encoding displayed
set pumheight=10                " Makes popup menu smaller
set fileencoding=utf-8          " The encoding written to file
set ruler              			    " Show the cursor position all the time
set cmdheight=2                 " More space for displaying messages
set iskeyword+=-                " treat dash separated words as a word text object"
set mouse=a                     " Enable your mouse
set splitbelow                  " Horizontal splits will automatically be below
set splitright                  " Vertical splits will automatically be to the right
set t_Co=256                    " Support 256 colors
set conceallevel=0              " So that I can see `` in markdown files
set tabstop=2                   " Insert 2 spaces for a tab
set shiftwidth=2                " Change the number of space characters inserted for indentation
set smarttab                    " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                   " Converts tabs to spaces
set smartindent                 " Makes indenting smart
set autoindent                  " Good auto indent
set laststatus=2                " Always display the status line
set number                      " Line numbers
set cursorline                  " Enable highlighting of the current line
set noshowmode                  " We don't need to see things like -- INSERT -- anymore
set updatetime=300              " Faster completion
set timeoutlen=500              " By default timeoutlen is 1000 ms
set formatoptions-=cro          " Stop newline continution of comments
set clipboard=unnamedplus       " Copy paste between vim and everything else
let g:mapleader = " "           " Set Space as mapleader
set termguicolors               " Use right colors
set shortmess+=c                " Avoid Pattern not found with lsp-compe
set signcolumn=yes              " Always show signcolumn to avoid shifting on display
set scrolloff=2                 " Don't stick line to top/bottom
set relativenumber              " Show relative number in left column

" UI settings
set guifont=JetBrainsMono-Nerd-Font-Regular:h16 " Add GUI custom font
let g:dusk_til_dawn_light_theme = "github_light"
let g:dusk_til_dawn_dark_theme = "github_dark"
let g:dusk_til_dawn_morning = 7
let g:dusk_til_dawn_night = 21
lua require'Dusk-til-Dawn'.timeMan()()

" Plugins
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" Languages
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.nf set syntax=groovy

" Colorizer
lua require'colorizer'.setup()
