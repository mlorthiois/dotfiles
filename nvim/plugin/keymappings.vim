" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap m }
nnoremap M {

" Easily switch between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sizing window horizontally and vertically with Shift + Arrow keys
nnoremap <S-right> :vert res +5<CR>
nnoremap <S-left> :vert res -5<CR>
nnoremap <S-Up> :res +5<CR>
nnoremap <S-Down> :res -5<CR>

"----Plugins-----------
" Hop (vim-sneak)
nnoremap <silent>  s <cmd>HopChar2<cr>
nnoremap <silent>  S <cmd>HopPattern<cr>

" Languages Shortcuts
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:!clang % -o %:r && clear && ./%:r<CR>

" Compe
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" Use comment in visual mode
vnoremap <silent> <leader>c <cmd>CommentToggle<cr>

" Use TAB to switch between buffers
nnoremap <Tab> <cmd>BufNext<CR>
nnoremap <S-Tab> <cmd>BufPrev<CR>
