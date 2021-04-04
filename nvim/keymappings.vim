" General
nnoremap <silent>    <Leader>s :w<CR>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


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


" Shortcuts
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:!clang % -o %:r && clear && ./%:r<CR>