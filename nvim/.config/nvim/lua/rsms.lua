-- TODO: nvim 0.7 https://www.reddit.com/r/neovim/comments/sihuq7/psa_now_you_can_set_global_highlight_groups_ie/

local color_palette = {
	dark = {
		white = "#ffffff",
		gray = "#777775",
		black = "#000000",
		red = "#ff7b72",
		green = "#94d1b2",
		yellow = "#fac481",
		orange = "#efcba7",
		blue = "#94b3d1",
		pink = "#ba9cd9",
		--Background and Foreground
		bg = "#1d1d1d",
		bg_dim = "#282828",
		bg_accent = "#000000",
		bg_variant = "#333333",
		fg = "#d1d1d1",
		fg_dim = "#777775",
		fg_accent = "#ffffff",
		--Syntax
		value = "#94d1b2",
		operator = "#efcba7",
		type = "#ba9cd9",
		keyword = "#94b3d1",
		error = "#ff7b72",
		none = "NONE",
	},

	light = {
		white = "#ffffff",
		gray = "#777775",
		black = "#000000",
		red = "#cc0000",
		green = "#116432",
		yellow = "#b58900",
		orange = "#ff8800",
		blue = "#324d59",
		pink = "#52529e",
		--Background and Foreground
		bg = "#ffffff",
		bg_dim = "#f5f5f5",
		bg_accent = "#e0e0e0",
		bg_variant = "#cdcdcd",
		fg = "#333333",
		fg_dim = "#84847f",
		fg_accent = "#000000",
		--Syntax
		value = "#116432",
		operator = "#750154",
		type = "#324D59",
		keyword = "#52529e",
		error = "#CC0000",
		none = "NONE",
	},
}

-- Set theme based on background color
local get_theme = function()
	local c
	if vim.o.background == "light" then
		c = color_palette.light
	else
		c = color_palette.dark
	end

	return {
		-- Syntax
		Normal = { fg = c.fg, bg = c.bg },
		Type = { fg = c.type },
		StorageClass = { fg = c.type },
		Structure = { fg = c.type },
		Constant = { fg = c.value },
		String = { fg = c.value },
		Character = { fg = c.value },
		Number = { fg = c.value },
		Boolean = { fg = c.value },
		Float = { fg = c.value, bg = c.bg_dim },
		FloatBorder = { fg = c.fg, bg = c.bg },
		Statement = { fg = c.keyword },
		Label = { fg = c.keyword },
		Operator = { fg = c.keyword },
		Exception = { fg = c.error },
		PreProc = { fg = c.type },
		Include = { fg = c.type },
		Define = { fg = c.type },
		Macro = { fg = c.keyword },
		Typedef = { fg = c.type },
		PreCondit = { fg = c.blue },
		Special = { fg = c.value },
		SpecialChar = { fg = c.value },
		Tag = { fg = c.type },
		Delimiter = { fg = c.keyword },
		SpecialComment = { fg = c.fg_dim },
		Debug = { fg = c.error },
		Underlined = { fg = c.link, style = "underline" },
		Ignore = { fg = c.fg_dim },
		Error = { fg = c.error, style = "bold,underline" },
		Todo = { fg = c.yellow, style = "bold,italic" },
		Comment = { fg = c.fg_dim, style = "italic" },
		Conditional = { fg = c.keyword },
		Keyword = { fg = c.keyword },
		Repeat = { fg = c.keyword },
		Function = { fg = c.fg_accent },
		Identifier = { fg = c.type },

		-- Statusline
		StatusLine = { fg = c.fg, bg = c.bg_variant },
		StatusLineNC = { fg = c.fg_dim, bg = c.bg_dim },
		StatusLineNormal = { fg = c.bg, bg = c.keyword },
		StatusLineInsert = { fg = c.bg, bg = c.value },
		StatusLineVisual = { fg = c.bg, bg = c.type },
		StatusLineCommand = { fg = c.bg, bg = c.operator },
		StatusLineTerminal = { fg = c.bg, bg = c.fg },

		-- UI
		VertSplit = { fg = c.fg_dim, bg = c.bg },
		ColorColumn = {},
		Conceal = { fg = c.disabled },
		Cursor = { fg = c.fg_dim },
		Directory = { fg = c.blue },
		DiffAdd = { fg = c.green },
		DiffChange = { fg = c.orange },
		DiffDelete = { fg = c.red },
		DiffText = { fg = c.blue },
		EndOfBuffer = { fg = c.bg_dim },
		ErrorMsg = { fg = c.none },
		Folded = { fg = c.disabled },
		FoldColumn = { fg = c.blue },
		IncSearch = { fg = c.none },
		LineNr = { fg = c.fg_dim },
		SignColumn = {},
		CursorLineNr = { fg = c.fg_accent },
		MatchParen = { fg = c.blue },
		ModeMsg = { fg = c.fg_accent },
		MoreMsg = { fg = c.fg_accent },
		NonText = { fg = c.disabled },
		Pmenu = { fg = c.fg, bg = c.bg_dim },
		PmenuSel = { fg = c.fg_accent, bg = c.bg_accent },
		PmenuSbar = { fg = c.value, bg = c.bg_accent },
		PmenuThumb = { fg = c.bg, bg = c.fg },
		Question = { fg = c.green },
		QuickFixLine = { fg = c.highlight, bg = c.bg_dim },
		qfLineNr = { fg = c.highlight, bg = c.bg_dim },
		Search = { fg = c.none, bg = c.bg_variant },
		SpecialKey = { fg = c.pink },
		SpellBad = { fg = c.red },
		SpellCap = { fg = c.blue },
		SpellLocal = { fg = c.blue },
		SpellRare = { fg = c.pink },
		TabLineFill = { fg = c.fg_dim, bg = c.bg_accent },
		TabLineSel = { fg = c.fg_accent, bg = c.bg },
		TabLine = { fg = c.fg, bg = c.bg_accent },
		Title = { fg = c.green },
		Visual = { fg = c.none, bg = c.bg_variant },
		VisualNOS = { fg = c.bg_variant },
		WarningMsg = { fg = c.yellow },
		WildMenu = { fg = c.orange },
		CursorColumn = {},
		CursorLine = { bg = c.bg_dim },
		ToolbarLine = { fg = c.fg },
		ToolbarButton = { fg = c.fg },
		Warnings = { fg = c.yellow },
		healthError = { fg = c.error },
		healthSuccess = { fg = c.green },
		healthWarning = { fg = c.yellow },

		-- Diagnostics
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.orange },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.green },
		DiagnosticsUnderlineError = { style = "undercurl", sp = c.error },
		DiagnosticsUnderlineWarning = { style = "undercurl", sp = c.orange },
		DiagnosticsUnderlineInformation = { style = "undercurl", sp = c.blue },
		DiagnosticsUnderlineHint = { fg = c.green },

		-- Treesitter
		TSAnnotation = { fg = c.fg },
		TSAttribute = { fg = c.fg },
		TSBoolean = { fg = c.value },
		TSCharacter = { fg = c.value },
		TSConstructor = { fg = c.fg },
		TSConstant = { fg = c.fg },
		TSConstBuiltin = { fg = c.fg },
		TSConstMacro = { fg = c.fg },
		TSError = { fg = c.fg },
		TSException = { fg = c.fg },
		TSField = { fg = c.fg },
		TSFloat = { fg = c.value },
		TSFuncMacro = { fg = c.fg },
		TSInclude = { fg = c.type },
		TSLabel = { fg = c.keyword },
		TSNamespace = { fg = c.fg },
		TSNumber = { fg = c.value },
		TSOperator = { fg = c.operator },
		TSParameter = { fg = c.fg },
		TSParameterReference = { fg = c.fg },
		TSProperty = { fg = c.fg },
		TSPunctDelimiter = { fg = c.fg_dim },
		TSPunctBracket = { fg = c.fg_dim },
		TSPunctSpecial = { fg = c.fg_dim },
		TSString = { fg = c.value },
		TSStringRegex = { fg = c.value },
		TSStringEscape = { fg = c.value },
		TSSymbol = { fg = c.fg },
		TSType = { fg = c.fg },
		TSTypeBuiltin = { fg = c.keyword },
		TSTag = { fg = c.type },
		TSTagDelimiter = { fg = c.type },
		TSText = { fg = c.value },
		TSTextReference = { fg = c.value },
		TSEmphasis = { fg = c.value },
		TSUnderline = { fg = c.fg, style = "underline" },
		TSStrike = {},
		TSTitle = { fg = c.value },
		TSLiteral = { fg = c.fg },
		TSURI = { fg = c.value },
		TSComment = { fg = c.fg_dim, style = "italic" },
		TSFunction = { fg = c.fg_accent },
		TSMethod = { fg = c.fg_accent },
		TSFuncBuiltin = { fg = c.fg_accent },
		TSConditional = { fg = c.keyword },
		TSKeyword = { fg = c.keyword },
		TSRepeat = { fg = c.keyword },
		TSKeywordFunction = { fg = c.keyword },
		TSVariable = { fg = c.fg },
		TSVariableBuiltin = { fg = c.fg },

		-- Completion
		CmpItemAbbrDeprecated = { fg = "#808080" },
		CmpItemAbbrMatch = { fg = c.blue },
		CmpItemAbbrMatchFuzzy = { fg = c.blue, style = "bold" },
		CmpItemKindVariable = { fg = c.blue },
		CmpItemKindInterface = { fg = c.blue },
		CmpItemKindText = { fg = c.blue },
		CmpItemKindFunction = { fg = c.pink },
		CmpItemKindMethod = { fg = c.pink },
		CmpItemKindKeyword = { fg = c.fg },
		CmpItemKindProperty = { fg = c.fg },
		CmpItemKindUnit = { fg = c.fg },
		CmpItemKindClass = { fg = c.yellow },
		CmpItemKindModule = { fg = c.yellow },

		-- Telescope
		TelescopeSelection = { fg = c.fg_accent, bg = c.bg_accent },

		-- WhichKey
		WhichKey = { fg = c.value, style = "bold" },
		WhichKeyGroup = { fg = c.error },
		WhichKeyDesc = { fg = c.keyword, style = "italic" },
		WhichKeySeperator = { fg = c.fg_dim },
		WhichKeyFloating = { bg = c.bg },
		WhichKeyFloat = { bg = c.bg },

		-- Indent Blankline
		IndentBlanklineChar = { fg = c.bg_dim, sp = "nocombine" },
		IndentBlanklineContextChar = { fg = c.fg_dim, sp = "nocombine" },
	}
end

--Go trough the table and highlight the group with the color values
local highlight = function(group, color)
	local style = color.style and string.format("gui=%s", color.style) or "gui=NONE"
	local fg = color.fg and string.format("guifg=%s", color.fg) or "guifg=NONE"
	local bg = color.bg and string.format("guibg=%s", color.bg) or "guibg=NONE"
	local sp = color.sp and string.format("guisp=%s", color.sp) or ""
	local hl = string.format("hi %s %s %s %s %s", group, style, fg, bg, sp)
	vim.cmd(hl)
end

--Set the theme
local set = function()
	-- Set the theme environment
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "rsms"
	local theme = get_theme()
	for group, colors in pairs(theme) do
		highlight(group, colors)
	end
end

return { set = set }
