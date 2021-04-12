nnoremap <silent>    <Leader>s :w<CR>

" Explorer
nnoremap <silent>    <Leader>e :NvimTreeToggle<CR>

" Tab
nnoremap <silent>    <Leader>t :BufferNext<CR>
nnoremap <silent>    <Leader>w :BufferClose<CR>

" Vsplit - Switch vsplit window
nnoremap <silent>    <Leader><Tab> <C-w><C-w>

" Which Key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Hop (vim-sneak)
nnoremap <silent>  s <cmd>HopChar2<cr>
nnoremap <silent>  S <cmd>HopPattern<cr>

" Comments
nnoremap <silent>     <Leader>c :CommentToggle<cr>
vnoremap <silent>     <Leader>c :CommentToggle<cr>

" Languages Shortcuts
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:!clang % -o %:r && clear && ./%:r<CR>

" LSP
nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>b <cmd>lua vim.lsp.buf.formatting()<CR>
