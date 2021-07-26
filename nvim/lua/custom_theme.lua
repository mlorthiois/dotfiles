local Color, colors, Group, groups, styles = require("colorbuddy").setup()
local v = vim.g

v.colors_name = "custom_theme"

if vim.o.background == "dark" then
	-- Dark Colors
	Color.new("fg", "#d1d1d1")
	Color.new("fg_dim", "#777775")
	Color.new("bg", "#1d1d1b")
	Color.new("bg_alt", "#2e2e2e")
	Color.new("fg_accent", "#ffffff")
	Color.new("bg_accent", "#000000")
	Color.new("error", "#ff7b72")
	Color.new("value", "#81d3b0")
	Color.new("operator", "#fac481")
	Color.new("keyword", "#86b5d2")
	Color.new("type", "#d2a8ff")
	Color.new("NONE", "NONE")

	-- Terminal Colors
	v.terminal_color_0 = "#1d1d1b"
	v.terminal_color_8 = "#44505c"
	v.terminal_color_12 = "#4f97d7"
	v.terminal_color_13 = "#bc6ec5"
	v.terminal_color_14 = "#2d9574"
	v.terminal_color_7 = "#5b5b5b"
	v.terminal_color_15 = "#b2b2b2"
else
	-- Light Colors
	Color.new("fg", "#d1d1d1")
	Color.new("fg_dim", "#777775")
	Color.new("bg", "#1d1d1b")
	Color.new("bg_alt", "#2e2e2e")
	Color.new("fg_accent", "#ffffff")
	Color.new("bg_accent", "#000000")
	Color.new("error", "#ff7b72")
	Color.new("value", "#81d3b0")
	Color.new("operator", "#fac481")
	Color.new("keyword", "#86b5d2")
	Color.new("type", "#d2a8ff")
	Color.new("NONE", "NONE")

	-- Terminal Colors
	v.terminal_color_0 = "#fbf8ef"
	v.terminal_color_8 = "#a8a8bf"
	v.terminal_color_12 = "#3a81c3"
	v.terminal_color_13 = "#6c3163"
	v.terminal_color_14 = "#24775c"
	v.terminal_color_7 = "#463a4e"
	v.terminal_color_15 = "#655370"
end

----------------------------
-- Common Terminal Colors --
----------------------------
v.terminal_color_1 = "#d26487"
v.terminal_color_2 = "#35a8a5"
v.terminal_color_3 = "#b89f33"
v.terminal_color_4 = "#6981c5"
v.terminal_color_5 = "#a15ea7"
v.terminal_color_6 = "#288668"
v.terminal_color_9 = "#f2241f"
v.terminal_color_10 = "#67b11d"
v.terminal_color_11 = "#b1951d"

-------------------------------------------------------------
-- Syntax Groups (descriptions and ordering from `:h w18`) --
-------------------------------------------------------------
Group.new("Normal", colors.fg, colors.bg, styles.NONE)
Group.new("Comment", colors.fg_dim, colors.NONE, styles.italic)
Group.new("Constant", colors.value, colors.NONE, styles.NONE)
Group.new("String", colors.value, colors.NONE, styles.NONE)
Group.new("Character", colors.value, colors.NONE, styles.NONE)
Group.new("Boolean", colors.operator, colors.NONE, styles.NONE)
Group.new("Float", colors.value, colors.NONE, styles.NONE)
Group.new("Identifier", colors.fg, colors.NONE, styles.NONE)
Group.new("Function", colors.fg_accent, colors.NONE, styles.bold)
Group.new("Statement", colors.keyword, colors.NONE, styles.NONE)
Group.new("Conditional", colors.keyword, colors.NONE, styles.NONE)
Group.new("Repeat", colors.keyword, colors.NONE, styles.NONE)
Group.new("Label", colors.keyword, colors.NONE, styles.NONE)
Group.new("Operator", colors.keyword, colors.NONE, styles.NONE)
Group.new("Keyword", colors.type, colors.NONE, styles.NONE)
Group.new("Exception", colors.error, colors.NONE, styles.NONE)
Group.new("PreProc", colors.type, colors.NONE, styles.NONE)
Group.new("Include", colors.type, colors.NONE, styles.NONE)
Group.new("Define", colors.type, colors.NONE, styles.NONE)
Group.new("Macro", colors.error, colors.NONE, styles.NONE)
Group.new("PreCondit", colors.keyword, colors.NONE, styles.NONE)
Group.new("Type", colors.type, colors.NONE, styles.NONE)
Group.new("StorageClass", colors.keyord, colors.NONE, styles.NONE)
Group.new("Structure", colors.type, colors.NONE, styles.NONE)
Group.new("Typedef", colors.type, colors.NONE, styles.NONE)
Group.new("Special", colors.value, colors.NONE, styles.NONE)
Group.new("SpecialChar", colors.value, colors.NONE, styles.NONE)
Group.new("Tag", colors.type, colors.NONE, styles.NONE)
Group.new("Delimiter", colors.operator, colors.NONE, styles.NONE)
Group.new("SpecialComment", colors.fg_dim, colors.NONE, styles.NONE)
Group.new("Debug", colors.error, colors.NONE, styles.NONE)
Group.new("Underlined", colors.fg, colors.NONE, styles.NONE)
Group.new("Error", colors.error, colors.NONE, styles.NONE)
Group.new("Todo", colors.error, colors.NONE, styles.bold + styles.italic)

--------------------------------------------------------------------------------
-- Highlighting Groups (descriptions and ordering from `:h highlight-groups`) --
--------------------------------------------------------------------------------
-- Group.new("ColorColumn", colors.fg, colors.bg, styles.NONE)
-- Group.new("Conceal", colors.blue0, colors.bg0, styles.NONE)
-- Group.new("Cursor", colors.orange0, colors.NONE, styles.bold + styles.NONE)
-- Group.new("CursorIM", colors.fg0, colors.NONE, styles.NONE)
-- Group.new("Directory", colors.blue0, colors.NONE, styles.bold)
-- Group.new("ErrorMsg", colors.NONE, colors.bg, styles.NONE)
-- Group.new("VertSplit", colors.bg_alt, colors.NONE, styles.NONE)
-- Group.new("LineNr", colors.fg_dim, colors.NONE, styles.NONE)
-- Group.new("CursorLineNr", colors.purple0, colors.NONE, styles.NONE)
-- Group.new("MatchParen", colors.green, colors.NONE, styles.NONE)
-- Group.new("ModeMsg", colors.yellow1, colors.NONE, styles.NONE)
-- Group.new("MoreMsg", groups.ModeMsg, groups.ModeMsg, groups.ModeMsg)
-- Group.new("NonText", colors.grey, colors.NONE, styles.NONE)
-- Group.new("Normal", colors.fg1, colors.bg0, styles.NONE)
-- Group.new("Pmenu", colors.fg5, colors.purple4, styles.NONE)
-- Group.new("PmenuSel", colors.fg0, colors.fg6, styles.NONE)
-- Group.new("PmenuSbar", colors.fg0, colors.bg1, styles.NONE)
-- Group.new("PmenuThumb", colors.fg0, colors.purple3, styles.NONE)
-- Group.new("Question", colors.orange0, colors.NONE, styles.bold)
-- Group.new("QuickFixLine", groups.Search, groups.Search, groups.Search)
-- Group.new("qfLineNr", groups.Type, groups.Type, groups.Type)
-- Group.new("Search", colors.green, colors.NONE, styles.bold + styles.NONE)
-- Group.new("SpecialKey", colors.purple0, colors.NONE, styles.NONE)
-- Group.new("SpellBad", colors.red, colors.NONE, styles.italic + styles.NONE)
-- Group.new("SpellCap", colors.blue0, colors.NONE, styles.italic + styles.NONE)
-- Group.new("SpellLocal", colors.aqua0, colors.NONE, styles.italic + styles.NONE)
-- Group.new("SpellRare", colors.purple0, colors.NONE, styles.italic + styles.NONE)
-- Group.new("StatusLine", colors.fg1, colors.purple3, styles.NONE)
-- Group.new("StatusLineNC", colors.purple3, colors.purple4, styles.NONE)
-- Group.new("StatusLineTerm", groups.StatusLine, groups.StatusLine, groups.StatusLine)
-- Group.new("StatusLineTermNC", groups.StatusLineNC, groups.StatusLineNC, groups.StatusLineNC)
-- Group.new("TabLineFill", colors.purple, colors.bg1, styles.NONE)
-- Group.new("TabLineSel", colors.green, colors.bg1, styles.NONE)
-- Group.new("TabLine", groups.TabLineFill, groups.TabLineFill, groups.TabLineFill)
-- Group.new("Title", colors.green, colors.NONE, styles.bold)
-- Group.new("Visual", colors.fg0, colors.purple, styles.NONE)
-- Group.new("VisualNOS", groups.Visual, groups.Visual, groups.Visual)
-- Group.new("WarningMsg", colors.red, colors.NONE, styles.NONE)
-- Group.new("WildMenu", colors.orange0, colors.bg1, styles.bold)

--------------------------------
-- Miscellaneous Highlighting --
--------------------------------
-- Group.new("CursorColumn", colors.NONE, colors.bg1, styles.NONE)
-- Group.new("CursorLine", colors.NONE, colors.bg1, styles.NONE)
-- Group.new("ToolbarLine", colors.fg0, colors.bg3, styles.NONE)
-- Group.new("ToolbarButton", colors.fg0, colors.bg3, styles.bold)
-- Group.new("NormalMode", colors.fg4, colors.NONE, styles.NONE)
-- Group.new("InsertMode", colors.blue0, colors.NONE, styles.NONE)
-- Group.new("ReplaceMode", colors.aqua0, colors.NONE, styles.NONE)
-- Group.new("VisualMode", colors.orange0, colors.NONE, styles.NONE)
-- Group.new("CommandMode", colors.purple0, colors.NONE, styles.NONE)
-- Group.new("Warnings", colors.orange0, colors.NONE, styles.NONE)

-------------------------
-- Plugin Highlighting --
-------------------------
-- Which Key (liuchengxu/vim-which-key)
-- Group.new("WhichKey", groups.Function, groups.Function, groups.Function)
-- Group.new("WhichKeySeperator", colors.green, colors.NONE, styles.NONE)
-- Group.new("WhichKeyGroup", groups.Keyword, groups.Keyword, groups.Keyword)
-- Group.new("WhichKeyDesc", groups.Identifier, groups.Identifier, groups.Identifiestyles.NONE)

---------------------
-- Neovim Builtins --
---------------------
-- LSP Groups (descriptions and ordering from `:h lsp-highlight`)
-- Group.new("LspDiagstyles.NONEsticsError", colors.NONErd_11, colors.NONE) -- used for "Error" diagstyles.NONEstic virtual text
-- Group.new("LspDiagstyles.NONEsticsErrorSign", colors.NONErd_11, colors.NONE) -- used for "Error" diagstyles.NONEstic signsstyles.italicn sign column
-- Group.new("LspDiagstyles.NONEsticsErrorFloating", colors.NONErd_11, colors.NONE) -- used for "Error" diagstyles.NONEstic messagesstyles.italicn the diagstyles.NONEstics float
-- Group.new("LspDiagstyles.NONEsticsWarning", colors.NONErd_11, colors.NONE) -- used for "Warning" diagstyles.NONEstic virtual text
-- Group.new("LspDiagstyles.NONEsticsWarningSign", colors.NONErd_13, colors.NONE) -- used for "Warning" diagstyles.NONEstic signsstyles.italicn sign column
-- Group.new("LspDiagstyles.NONEsticsWarningFloating", colors.NONErd_8, colors.NONE) -- used for "Warning" diagstyles.NONEstic messagesstyles.italicn the diagstyles.NONEstics float
-- Group.new("LSPDiagstyles.NONEsticsInformation", colors.NONErd_10, colors.NONE) -- used for "Information" diagstyles.NONEstic virtual text
-- Group.new("LspDiagstyles.NONEsticsInformationSign", colors.NONErd_8, colors.NONE)  -- used for "Information" diagstyles.NONEstic signsstyles.italicn sign column
-- Group.new("LspDiagstyles.NONEsticsInformationFloating", colors.NONErd_10, colors.NONE) -- used for "Information" diagstyles.NONEstic messagesstyles.italicn the diagstyles.NONEstics float
-- Group.new("LspDiagstyles.NONEsticsHint", colors.NONErd_8, colors.NONE)  -- used for "Hint" diagstyles.NONEstic virtual text
-- Group.new("LspDiagstyles.NONEsticsHintSign", colors.NONErd_10, colors.NONE) -- used for "Hint" diagstyles.NONEstic signsstyles.italicn sign column
-- Group.new("LspDiagstyles.NONEsticsHintFloating", colors.NONErd_8, colors.NONE) -- used for "Hint" diagstyles.NONEstic messagesstyles.italicn the diagstyles.NONEstics float
-- Group.new("LspReferenceText", colors.NONErd_10, colors.NONE) -- used for highlighting "text" references
-- Group.new("LspReferenceRead", colors.NONErd_10, colors.NONE) -- used for highlighting "read" references
-- Group.new("LspReferenceWrite", colors.NONErd_10, colors.NONE) -- used for highlighting "write" references

-- Nvim Treesitter Groups (descriptions and ordering from `:h nvim-treesitter-highlights`)
Group.new("TSComment", colors.fg_dim, colors.NONE, styles.NONE)
Group.new("TSError", colors.error, colors.NONE, styles.NONE)
Group.new("TSPunctDelimiter", colors.fg_dim, colors.NONE, styles.NONE)
Group.new("TSPunctBracket", colors.fg_dim, colors.NONE, styles.NONE)
Group.new("TSPunctSpecial", colors.fg_dim, colors.NONE, styles.NONE)
Group.new("TSConstant", colors.fg, colors.NONE, styles.NONE)
Group.new("TSConstBuiltin", colors.fg, colors.NONE, styles.NONE)
Group.new("TSConstMacro", colors.value, colors.NONE, styles.NONE)
Group.new("TSString", colors.value, colors.NONE, styles.NONE)
Group.new("TSStringRegex", colors.value, colors.NONE, styles.NONE)
Group.new("TSStringEscape", colors.value, colors.NONE, styles.NONE)
Group.new("TSCharacter", colors.value, colors.NONE, styles.NONE)
Group.new("TSNumber", colors.value, colors.NONE, styles.NONE)
Group.new("TSBoolean", colors.value, colors.NONE, styles.NONE)
Group.new("TSFloat", colors.value, colors.NONE, styles.NONE)
Group.new("TSFunction", colors.fg_accent, colors.NONE, styles.bold)
Group.new("TSFuncBuiltin", colors.fg, colors.NONE, styles.NONE)
Group.new("TSFuncMacro", colors.fg, colors.NONE, styles.NONE)
Group.new("TSParameter", colors.fg, colors.NONE, styles.NONE)
Group.new("TSParameterReference", colors.fg, colors.NONE, styles.NONE)
Group.new("TSMethod", colors.fg, colors.NONE, styles.NONE)
Group.new("TSField", colors.fg, colors.NONE, styles.NONE)
Group.new("TSProperty", colors.fg, colors.NONE, styles.NONE)
Group.new("TSConstructor", colors.fg, colors.NONE, styles.NONE)
Group.new("TSConditional", colors.keyword, colors.NONE, styles.NONE)
Group.new("TSRepeat", colors.keyword, colors.NONE, styles.NONE)
Group.new("TSLabel", colors.keyword, colors.NONE, styles.NONE)
Group.new("TSOperator", colors.operator, colors.NONE, styles.NONE)
Group.new("TSKeyword", colors.keyword, colors.NONE, styles.NONE)
Group.new("TSKeywordFunction", colors.fg, colors.NONE, styles.NONE)
Group.new("TSException", colors.error, colors.NONE, styles.NONE)
Group.new("TSType", colors.type, colors.NONE, styles.NONE)
Group.new("TSTypeBuiltin", colors.operator, colors.NONE, styles.NONE)
Group.new("TSStructure", colors.operator, colors.NONE, styles.NONE)
Group.new("TSInclude", colors.keyword, colors.NONE, styles.NONE)
Group.new("TSText", colors.value, colors.NONE, styles.NONE)
Group.new("TSStrong", colors.value, colors.NONE, styles.bold)
Group.new("TSEmphasis", colors.value, colors.NONE, styles.bold)
Group.new("TSUnderline", colors.value, colors.NONE, styles.underline)
Group.new("TSTitle", colors.value, colors.NONE, styles.NONE)
Group.new("TSVariable", colors.fg, colors.NONE, styles.NONE)
Group.new("TSVariableBuiltin", colors.fg, colors.NONE, styles.NONE)
