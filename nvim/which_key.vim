nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_timeout = 300
let g:which_key_map =  {}
let g:which_key_sep = '→'

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


let g:which_key_map['c'] = [':CommentToggle'       , 'comment toggle']
let g:which_key_map['h'] = [ '<C-W>s'              , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'              , 'split right']
let g:which_key_map['s'] = [ ':w'                  , 'save']
let g:which_key_map['t'] = [ ':BufferPick'         , 'pick buffer']
let g:which_key_map['w'] = [ ':BufferClose'        , 'close buffer']
let g:which_key_map['p'] = [':Telescope buffers'   , 'list open buffers']

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '>' : [':BufferMoveNext'        , 'move next'],
      \ '<' : [':BufferMovePrevious'    , 'move prev'],
      \ 'b' : [':BufferPick'            , 'pick buffer'],
      \ }

let g:which_key_map.f = {
      \ 'name' : '+search' ,
      \ 'B' : [':Telescope git_branches'                , 'git branches'],
      \ 'p' : [':Telescope oldfiles'                    , 'previous open files'],
      \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
      \ 'f' : [':Telescope find_files'                  , 'files'],
      \ 'h' : [':Telescope command_history'             , 'history'],
      \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
      \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
      \ 'g' : [':Telescope live_grep'                   , 'text'],
      \ 'r' : [':Telescope registers'                   , 'registers'],
      \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
      \ 'u' : [':Telescope colorscheme'                 , 'colorschemes'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'j' : [":Gitsigns next_hunk"       , 'next hunk'],
      \ 'k' : [":Gitsigns prev_hunk"       , 'prev hunk'],
      \ 'p' : [":Gitsigns preview_hunk"    , 'preview hunk'],
      \ 'r' : [":Gitsigns reset_hunk"      , 'reset hunk'],
      \ 'R' : [":Gitsigns reset_buffer"    , 'reset buffer'],
      \ 's' : [":Gitsigns stage_hunk"      , 'stage hunk'],
      \ 'u' : [":Gitsigns undo_stage_hunk" , 'stage hunk'],
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'a' : [':Lspsaga code_action'                , 'code action'],
      \ 'A' : [':Lspsaga range_code_action'          , 'selected action'],
      \ 'd' : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
      \ 'f' : [':lua vim.lsp.buf.formatting()'       , 'format'],
      \ 'i' : [':lua vim.lsp.buf.implementation()'   , 'implementations'],
      \ 'I' : [':LspInfo'                            , 'lsp info'],
      \ 'l' : [':Lspsaga lsp_finder'                 , 'lsp finder'],
      \ 'L' : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      \ 'p' : [':Lspsaga preview_definition'         , 'preview definition'],
      \ 'P' : [':lua vim.lsp.buf.definition()'       , 'go to definition'],
      \ 'q' : [':Telescope quickfix'                 , 'quickfix'],
      \ 'r' : [':lua vim.lsp.buf.references()'       , 'references'],
      \ 'R' : [':Lspsaga rename'                     , 'rename'],
      \ 't' : [':lua vim.lsp.type_definition()'      , 'type defintion'],
      \ 'x' : [':cclose'                             , 'close quickfix'],
      \ 's' : [':lua vim.lsp.buf.signature_help()'   , 'signature help'],
      \ 'S' : [':Telescope lsp_document_symbols'     , 'document symbols'],
      \ }

call which_key#register('<Space>', "g:which_key_map")
