" Scroll
nnoremap <silent> m :keepjumps normal! }<CR>
nnoremap <silent> M :keepjumps normal! {<CR>

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

" Hop (vim-sneak)
nnoremap <silent> s <cmd>HopChar2<cr>
nnoremap <silent> S <cmd>HopChar1<cr>

" Use TAB to switch between buffers
nnoremap <ù> <cmd>tabnext<CR>
" nnoremap <Tab> :buffer<C-z>
nnoremap <Tab> :lua require"telescope.builtin".buffers()<CR>

" Redo
nnoremap U <cmd>redo<CR>

" Indent in visual mode
vn < <gv
vn > >gv
