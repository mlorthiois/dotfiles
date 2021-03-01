" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'
colorscheme onedark

hi! Sneak guifg=white guibg=red ctermfg=black ctermbg=LightBlue
hi! SneakScope guifg=red guibg=yellow ctermfg=LightMagenta ctermbg=Magenta
hi! SneakLabel guifg=white guibg=magenta ctermfg=black ctermbg=LightGreen