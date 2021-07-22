set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='custom_dark'

"""""""""
" General
"""""""""
hi Normal guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi Comment guifg=#777775 ctermfg=65 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Constant guifg=#81D3B0 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#81D3B0 ctermfg=174 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#81D3B0 ctermfg=174 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#81D3B0 ctermfg=151 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#b5cea8 ctermfg=151 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#d1d1d1 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#ffffff ctermfg=187 guibg=NONE ctermbg=NONE gui=bold cterm=NONE
hi Statement guifg=#86B5D2 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#86B5D2 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#86B5D2 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Label guifg=#86B5D2 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#FAC481 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#d2a8ff ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Exception guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#d2a8ff ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Include guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Title guifg=#4ec9b0 ctermfg=79 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#79c0ff ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#86B5D2 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#79c0ff ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#d2a8ff ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#d2a8ff ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#81D3B0 ctermfg=74 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi SpecialComment guifg=#676766 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Error guifg=#ff7b72 ctermfg=203 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Todo guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi Underlined guifg=#4ec9b0 ctermfg=79 gui=underline cterm=underline
hi Cursor guifg=#515052 ctermfg=239 guibg=#aeafad ctermbg=145 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=236 gui=NONE cterm=NONE
hi CursorLineNr guifg=#d1d1d1 ctermfg=249 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi SignColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=234 gui=NONE cterm=NONE
hi Conceal guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=236 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#151516 ctermbg=236 gui=NONE cterm=NONE
hi Directory guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#1D1D1C ctermfg=234 guibg=#8b949e ctermbg=65 gui=NONE cterm=NONE
hi DiffChange guifg=#d2a8ff ctermfg=187 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi DiffDelete guifg=#1D1D1C ctermfg=234 guibg=#ff7b72 ctermbg=167 gui=NONE cterm=NONE
hi DiffText guifg=#1D1D1C ctermfg=234 guibg=#d2a8ff ctermbg=187 gui=NONE cterm=NONE
hi ErrorMsg guifg=#ff7b72 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#3e4452 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=NONE ctermfg=NONE guibg=#5c6370 ctermbg=241 gui=NONE cterm=NONE
hi LineNr guifg=#858585 ctermfg=102 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NonText guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#d1d1d1 ctermfg=249 guibg=#151516 ctermbg=236 gui=NONE cterm=NONE
hi PmenuSel guifg=#81D3B0 ctermfg=234 guibg=#1D1D1B ctermbg=74 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#151516 ctermbg=238 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#d1d1d1 ctermbg=249 gui=NONE cterm=NONE
hi Question guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=NONE ctermfg=NONE guibg=#5c6370 ctermbg=241 gui=NONE cterm=NONE
hi Search guifg=NONE ctermfg=NONE guibg=#5c6370 ctermbg=241 gui=NONE cterm=NONE
hi SpecialKey guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#ff7b72 ctermfg=203 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellCap guifg=#d7ba7d ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#d7ba7d ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#d7ba7d ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"""""""""""""
" Status line
"""""""""""""
hi StatusLine guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=236 gui=NONE cterm=NONE
hi StatusLineNC guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLineTerm guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=236 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#1D1D1C ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#d1d1d1 ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#151516 ctermbg=235 gui=NONE cterm=NONE
hi Terminal guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1C ctermbg=234 gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#3e4452 ctermbg=238 gui=NONE cterm=NONE
hi VisualNOS guifg=#3e4452 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#d1d1d1 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#1D1D1C ctermfg=234 guibg=#FAC481 ctermbg=74 gui=NONE cterm=NONE
hi EndOfBuffer guifg=#1D1D1C ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"""""""""""""
" Tree sitter
"""""""""""""
hi TSComment guifg=#777775 ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSError guifg=#ff7b72 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctDelimiter guifg=#777775 ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctBracket guifg=#777775 ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctSpecial guifg=#777775 ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstant guifg=#d1d1d1 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstBuiltin guifg=#d1d1d1 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstMacro guifg=#4ec9b0 ctermfg=79 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringRegex guifg=#81D3B0 ctermfg=174 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSString guifg=#81D3B0 ctermfg=174 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringEscape guifg=#81D3B0 ctermfg=180 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSCharacter guifg=#81D3B0 ctermfg=174 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNumber guifg=#81D3B0 ctermfg=151 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSBoolean guifg=#81D3B0 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFloat guifg=#81d3B0 ctermfg=151 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAnnotation guifg=#d1d1d1 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAttribute guifg=#d1d1d1 ctermfg=79 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNamespace guifg=#d1d1d1 ctermfg=79 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncBuiltin guifg=#d1d1d1 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFunction guifg=#ffffff ctermfg=187 guibg=NONE ctermbg=NONE gui=bold cterm=NONE
hi TSFuncMacro guifg=#d1d1d1 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameter guifg=#d1d1d1 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameterReference guifg=#d1d1d1 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSMethod guifg=#d1d1d1 ctermfg=187 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSField guifg=#d1d1d1 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSProperty guifg=#d1d1d1 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstructor guifg=#d1d1d1 ctermfg=79 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConditional guifg=#86B5D2 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSRepeat guifg=#86B5D2 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLabel guifg=#79c0ff ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeyword guifg=#86B5D2 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordFunction guifg=#d1d1d1 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordOperator guifg=#d1d1d1 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSOperator guifg=#FAC481 ctermfg=249 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSException guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSType guifg=#85B5D2 ctermfg=79 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTypeBuiltin guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStructure guifg=#FAC481 ctermfg=201 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSInclude guifg=#86B5D2 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariable guifg=#d1d1d1 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariableBuiltin guifg=#d1d1d1 ctermfg=153 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSText guifg=#81D3B0 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStrong guifg=#81D3B0 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSEmphasis guifg=#81D3B0 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSUnderline guifg=#81D3B0 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTitle guifg=#81D3B0 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLiteral guifg=#81D3B0 ctermfg=174 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSURI guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi TSTag guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTagDelimiter guifg=#777775 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSQueryLinterError guifg=#ff7b72 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

""""""""""
" Markdown
""""""""""
hi markdownBlockquote guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBold guifg=#d7ba7d ctermfg=180 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownCode guifg=#8b949e ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeBlock guifg=#8b949e ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#8b949e ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH1 guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH2 guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH3 guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH4 guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH5 guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH6 guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingDelimiter guifg=#ff7b72 ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingRule guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownId guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDeclaration guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDelimiter guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownItalic guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownLinkDelimiter guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkText guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownListMarker guifg=#ff7b72 ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownOrderedListMarker guifg=#ff7b72 ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownRule guifg=#5c6370 ctermfg=241 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#4ec9b0 ctermfg=79 guibg=NONE ctermbg=NONE gui=underline cterm=underline

"""""""""""
" Which key
"""""""""""
hi WhichKey guifg=#ff7b72 ctermfg=175 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeySeperator guifg=#8b949e ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyGroup guifg=#4fc1ff ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyDesc guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"""""""""""
" Git Signs
"""""""""""
hi diffAdded guifg=#8b949e ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffRemoved guifg=#ff7b72 ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffFileId guifg=#FAC481 ctermfg=74 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi diffFile guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffNewFile guifg=#8b949e ctermfg=65 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffOldFile guifg=#ff7b72 ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi debugPc guifg=NONE ctermfg=NONE guibg=#4ec9b0 ctermbg=79 gui=NONE cterm=NONE
hi debugBreakpoint guifg=#ff7b72 ctermfg=167 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi GitSignsAdd guifg=#81D3B0 ctermfg=64 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitSignsChange guifg=#0c7d9d ctermfg=31 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitSignsDelete guifg=#ff7b72 ctermfg=88 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"""""
" LSP
"""""
hi LspDiagnosticsUnderlineHint guifg=#729cb3 ctermfg=73 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsSignError guifg=#ff7b72 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsSignWarning guifg=#ff8800 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsSignInformation guifg=#ffcc66 ctermfg=221 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsSignHint guifg=#4fc1ff ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsVirtualTextError guifg=#ff7b72 ctermfg=203 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsVirtualTextWarning guifg=#ff8800 ctermfg=208 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsVirtualTextInformation guifg=#ffcc66 ctermfg=221 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsVirtualTextHint guifg=#4fc1ff ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"""""""""
" Plugins
"""""""""
hi QuickScopePrimary guifg=#00c7df ctermfg=44 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi QuickScopeSecondary guifg=#ef5f70 ctermfg=203 guibg=#ff00ff ctermbg=NONE gui=underline cterm=underline
hi MatchWord guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi MatchParen guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi MatchWordCur guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi MatchParenCur guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=underline

""""""""
" BarBar
""""""""
hi BufferCurrent guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferCurrentIndex guifg=#FAC481 ctermfg=74 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferCurrentMod guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferCurrentSign guifg=#FAC481 ctermfg=74 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferCurrentTarget guifg=#ff7b72 ctermfg=167 guibg=#1D1D1B ctermbg=234 gui=bold cterm=bold
hi BufferVisible guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferVisibleIndex guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferVisibleMod guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferVisibleSign guifg=#d1d1d1 ctermfg=249 guibg=#1D1D1B ctermbg=234 gui=NONE cterm=NONE
hi BufferVisibleTarget guifg=#ff7b72 ctermfg=167 guibg=#1D1D1B ctermbg=234 gui=bold cterm=bold
hi BufferInactive guifg=#858585 ctermfg=102 guibg=#151516 ctermbg=236 gui=NONE cterm=NONE
hi BufferInactiveIndex guifg=#858585 ctermfg=102 guibg=#151516 ctermbg=236 gui=NONE cterm=NONE
hi BufferInactiveMod guifg=#858585 ctermfg=102 guibg=#151516 ctermbg=236 gui=NONE cterm=NONE
hi BufferInactiveSign guifg=#858585 ctermfg=102 guibg=#151516 ctermbg=236 gui=NONE cterm=NONE
hi BufferInactiveTarget guifg=#ff7b72 ctermfg=167 guibg=#151516 ctermbg=236 gui=bold cterm=bold

""""""""
"
""""""""
hi CodiVirtualText guifg=#6395ec ctermfg=69 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IndentBlanklineContextChar guifg=#d1d1d1 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
