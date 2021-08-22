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
nnoremap <silent>  S <cmd>HopChar1<cr>

" Compe
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

" Use TAB to switch between buffers
nnoremap <Tab> <cmd>:Telescope buffers previewer=false theme=get_ivy<CR>
nnoremap <ù> <cmd>tabnext<CR>


nnoremap <Tab> :buffer <C-z>
