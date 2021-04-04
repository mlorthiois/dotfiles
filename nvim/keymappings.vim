" General
nnoremap <silent>    <Leader>s :w<CR>


" Explorer
nnoremap <silent>    <Leader>e :NvimTreeToggle<CR>

" Tab
nnoremap <silent>    <Leader>t :BufferNext<CR>
nnoremap <silent>    <Leader>w :BufferClose<CR>

" Which Key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Terminal
nnoremap <silent>    <Leader>j :ToggleTerm<CR>