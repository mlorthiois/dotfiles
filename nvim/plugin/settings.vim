set noswapfile                  " Don't create .swp files
set ignorecase                  " Be case insensitive during search
set wrap                        " Display long lines as just one line
set pumheight=15                " Makes popup menu smaller
set fileencoding=utf-8          " The encoding written to file
set iskeyword+=-                " treat dash separated words as a word text object"
set mouse=a                     " Enable your mouse
set splitbelow                  " Horizontal splits will automatically be below
set splitright                  " Vertical splits will automatically be to the right
set t_Co=256                    " Support 256 colors
set conceallevel=0              " So that I can see `` in markdown files
set tabstop=2                   " Insert 2 spaces for a tab
set shiftwidth=2                " Change the number of space characters inserted for indentation
set expandtab                   " Converts tabs to spaces
set smartindent                 " Makes indenting smart
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
set scrolloff=3                 " Don't stick line to top/bottom
set relativenumber              " Show relative number in left column
set colorcolumn=99999           " Fix problem with indentline and empty line
set showmatch                   " Show matching brackets when text indicator is over them

" Status line
let g:currentmode={
	\ 'n'  : 'NORMAL',
	\ 'v'  : 'VISUAL',
	\ 'V'  : 'V·LINE',
	\ '' : 'V·BLOCK',
	\ 's'  : 'SELECT',
	\ 'S'  : 'S·LINE',
	\ '' : 'S·BLOCK',
	\ 'i'  : 'INSERT',
	\ 'R'  : 'REPLACE',
  \ 'Rv' : 'V·REPLACE',
	\ 'c'  : 'COMMAND',
	\}
set statusline=%<\ %{g:currentmode[mode()]}\ \|\ %f%m\ 
set statusline+=%=\ %{v:lua.lsp_statusline()}%{&filetype}\ \|\ %l/%L\(%c\)\ 

" Switch layout
function! ToggleWindowLayout()
  if !exists('t:splitType') || t:splitType == 'vertical'
    windo wincmd K
    let t:splitType = 'horizontal'
  else
    windo wincmd H
    let t:splitType = 'vertical'
  endif
endfunction

" Neoterm
let g:neoterm_default_mod="botright"
let g:neoterm_size=20
let g:neoterm_autoscroll=1
let g:neoterm_repl_enable_ipython_paste_magic=1
let g:neoterm_keep_term_open = 1

" Colorscheme based on Kitty
" if $KITTY_COLORS == "dark"
"   set background=dark   " for the dark version of the theme
" else
"   set background=light  " for the light version of the theme
" endif
colorscheme rsms

" Languages
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.nf set syntax=groovy
autocmd TermOpen * setlocal nonumber norelativenumber
augroup ft_markdown
  au!
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au Filetype markdown setlocal textwidth=100 smartindent nolist
  " Taken from here: https://github.com/plasticboy/vim-markdown/issues/232
  au FileType markdown
      \ set formatoptions-=q |
      \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+
augroup END

" IndentBlankLine settings
let g:indent_blankline_use_treesitter = v:true
