" Vsplit - Switch vsplit window
nnoremap <silent>    <Leader><Tab> <C-w><C-w>

" Hop (vim-sneak)
nnoremap <silent>  s <cmd>HopChar2<cr>
nnoremap <silent>  S <cmd>HopPattern<cr>

" Comments
vnoremap <silent>     <Leader>c :CommentToggle<cr>

" Languages Shortcuts
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:!clang % -o %:r && clear && ./%:r<CR>

" LSP
nnoremap <silent> K :Lspsaga hover_doc<CR>

" Compe
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
