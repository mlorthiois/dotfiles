"Shortcuts
"<CR> is the same as click on the button Enter
"nnoremap : only available in normal mode
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!clear && python %<CR>
autocmd Filetype r nnoremap <buffer> <F5> :w<CR>:!clear && Rscript %<CR>
autocmd Filetype tex nnoremap <buffer> <F5> :w<CR>:!clear && pdflatex %<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:!clang % -o %:r && clear && ./%:r<CR>

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2

:nmap <space>e :CocCommand explorer<CR>

" In normal mode, CTRL+TAB will move to next buffer
nnoremap <C-TAB> :bnext<CR>