au BufNewFile,BufRead *.md setlocal filetype=markdown
au Filetype markdown setlocal textwidth=100 smartindent nolist
  " Taken from here: https://github.com/plasticboy/vim-markdown/issues/232
au FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+
