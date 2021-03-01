"Startify
let s:header = [
    \ '   __      _______ __  __ ',
    \ '   \ \    / /_   _|  \/  |',
    \ '    \ \  / /  | | | \  / |',
    \ '     \ \/ /   | | | |\/| |',
    \ '      \  /   _| |_| |  | |',
    \ '       \/   |_____|_|  |_|',
    \ '',
    \ ]
let g:startify_session_autoload = 1
let g:startify_custom_header = s:header
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 1

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]


"Sneak
let g:sneak#label = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1