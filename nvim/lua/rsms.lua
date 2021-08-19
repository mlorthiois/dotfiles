local color_palette = {
	dark = {
		white = "#ffffff",
		gray = "#777775",
		black = "#000000",
		red = "#ff7b72",
		green = "#81d3b0",
		yellow = "#fac481",
		orange = "#f7ac6a",
		blue = "#86b5d2",
		pink = "#d2a8ff",
		--Background and Foreground
		bg = "#1d1d1b",
		bg_dim = "#2e2e2e",
		bg_accent = "#000000",
		bg_variant = "#3e4452",
		fg = "#d1d1d1",
		fg_dim = "#777775",
		fg_accent = "#ffffff",
		--Syntax
		value = "#81d3b0",
		operator = "#fac481",
		type = "#d2a8ff",
		keyword = "#86b5d2",
		error = "#ff7b72",
		none = "NONE",
	},

	light = {
		white = "#ffffff",
		gray = "#777775",
		black = "#000000",
		red = "#cc0000",
		green = "#116432",
		yellow = "#ffe642",
		orange = "#ff8800",
		blue = "#324d59",
		pink = "#52529e",
		--Background and Foreground
		bg = "#ffffff",
		bg_dim = "#f5f5f5",
		bg_accent = "#e0e0e0",
		bg_variant = "#aeafad",
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

--Set theme based on background color
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
		Float = { fg = c.value, bg = c.bg },
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

		-- Language specific
		htmlLink = { fg = c.value, style = "underline" },
		htmlH1 = { fg = c.keyword, style = "bold" },
		htmlH2 = { fg = c.keyword, style = "bold" },
		htmlH3 = { fg = c.keyword, style = "bold" },
		htmlH4 = { fg = c.keyword, style = "bold" },
		htmlH5 = { fg = c.keyword, style = "bold" },
		markdownH1 = { fg = c.keyword, style = "bold" },
		markdownH2 = { fg = c.value, style = "bold" },
		markdownH3 = { fg = c.operator, style = "bold" },
		markdownH1Delimiter = { fg = c.keyword },
		markdownH2Delimiter = { fg = c.value },
		markdownH3Delimiter = { fg = c.operator },

		-- UI
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
		Pmenu = { fg = c.fg, bg = c.bg },
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
		StatusLine = { fg = c.fg, bg = c.bg },
		StatusLineNC = { fg = c.fg_dim },
		StatusLineTerm = { fg = c.fg },
		StatusLineTermNC = { fg = c.fg },
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
		NormalMode = { fg = c.fg_accent },
		InsertMode = { fg = c.green },
		ReplacelMode = { fg = c.red },
		CommandMode = { fg = c.gray },
		Warnings = { fg = c.yellow },
		healthError = { fg = c.error },
		healthSuccess = { fg = c.green },
		healthWarning = { fg = c.yellow },

		-- Treesitter
		TSAnnotation = { fg = c.fg },
		TSAttribute = { fg = c.fg },
		TSBoolean = { fg = c.value },
		TSCharacter = { fg = c.value },
		TSConstructor = { fg = c.fg },
		TSConstant = { fg = c.fg },
		TSConstBuiltin = { fg = c.fg },
		TSConstMacro = { fg = c.fg },
		TSError = { fg = c.error, style = "bold" },
		TSException = { fg = c.error },
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
		TSType = { fg = c.type },
		TSTypeBuiltin = { fg = c.type },
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
		TSFunction = { fg = c.fg_accent, style = "bold" },
		TSMethod = { fg = c.fg },
		TSFuncBuiltin = { fg = c.fg_accent },
		TSConditional = { fg = c.keyword },
		TSKeyword = { fg = c.keyword },
		TSRepeat = { fg = c.keyword },
		TSKeywordFunction = { fg = c.keyword },
		TSVariable = { fg = c.fg },
		TSVariableBuiltin = { fg = c.fg },

		-- Lsp
		LspDiagnosticsDefaultError = { fg = c.error },
		LspDiagnosticsSignError = { fg = c.error },
		LspDiagnosticsFloatingError = { fg = c.error },
		LspDiagnosticsVirtualTextError = { fg = c.error },
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = c.error },
		LspDiagnosticsDefaultWarning = { fg = c.orange },
		LspDiagnosticsSignWarning = { fg = c.orange },
		LspDiagnosticsFloatingWarning = { fg = c.orange },
		LspDiagnosticsVirtualTextWarning = { fg = c.orange },
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = c.orange },
		LspDiagnosticsDefaultInformation = { fg = c.blue },
		LspDiagnosticsSignInformation = { fg = c.blue },
		LspDiagnosticsFloatingInformation = { fg = c.blue },
		LspDiagnosticsVirtualTextInformation = { fg = c.blue },
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = c.blue },
		LspDiagnosticsDefaultHint = { fg = c.green },
		LspDiagnosticsSignHint = { fg = c.green },
		LspDiagnosticsFloatingHint = { fg = c.green },
		LspDiagnosticsVirtualTextHint = { fg = c.green },
		LspDiagnosticsUnderlineHint = { fg = c.green },

		-- Telescope
		TelescopeSelection = { fg = c.fg_accent, bg = c.bg_accent },

		-- GitSigns
		GitSignsAdd = { fg = c.green },
		GitSignsAddNr = { fg = c.green },
		GitSignsAddLn = { fg = c.green },
		GitSignsChange = { fg = c.blue },
		GitSignsChangeNr = { fg = c.blue },
		GitSignsChangeLn = { fg = c.blue },
		GitSignsDelete = { fg = c.error },
		GitSignsDeleteNr = { fg = c.error },
		GitSignsDeleteLn = { fg = c.error },

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

		-- Galaxyline
		GalaxyLeftLspInactive = { fg = c.fg_dim, bg = c.bg },
		GalaxyMapperCommon1 = { fg = c.bg_dim, bg = c.bg },
		GalaxyMapperCommon2 = { bg = c.bg_accent, fg = c.fg },
		GalaxyMapperCommon3 = { bg = c.bg_dim, fg = c.fg },
		GalaxyMapperCommon5 = { bg = c.bg, fg = c.fg_dim },
		GalaxyMapperCommon7 = { bg = c.bg_dim, fg = c.bg_accent },
		GalaxyMidFileStatusModified = { bg = c.bg, fg = c.value },
		GalaxyMidFileStatusReadonly = { bg = c.bg, fg = c.operator },
		GalaxyMidFileStatusRestricted = { bg = c.bg, fg = c.error },
		GalaxyMidFileStatusUnmodified = { bg = c.bg, fg = c.fg_dim },
		GalaxyRightLspErrorActive = { bg = c.bg, fg = c.error },
		GalaxyRightLspHintActive = { bg = c.bg, fg = c.value },
		GalaxyRightLspInformationActive = { bg = c.bg, fg = c.keyword },
		GalaxyRightLspWarningActive = { bg = c.bg, fg = c.operator },
		GalaxyViModeCommandInverted = { bg = c.bg_dim, fg = c.keyword },
		GalaxyViModeCommandUnturned = { bg = c.keyword, fg = c.bg_accent },
		GalaxyViModeCommonVisualInverted = { bg = c.bg_dim, fg = c.type },
		GalaxyViModeCommonVisualUnturned = { bg = c.type, fg = c.bg_accent },
		GalaxyViModeEmptyInverted = { bg = c.bg_dim, fg = c.fg },
		GalaxyViModeEmptyUnturned = { bg = c.bg_accent, fg = c.bg_accent },
		GalaxyViModeInsertInverted = { bg = c.bg_dim, fg = c.value },
		GalaxyViModeInsertUnturned = { bg = c.value, fg = c.bg_accent },
		GalaxyViModeNormalInverted = { bg = c.bg_dim, fg = c.bg_accent },
		GalaxyViModeNormalUnturned = { bg = c.bg_accent, fg = c.fg },
		GalaxyViModeReplaceInverted = { bg = c.bg_dim, fg = c.error },
		GalaxyViModeReplaceUnturned = { bg = c.error, fg = c.fg },
		GalaxyViModeShellInverted = { bg = c.bg_dim, fg = c.keyword },
		GalaxyViModeShellUnturned = { bg = c.keyword, fg = c.fg },
		GalaxyViModeTerminalInverted = { bg = c.bg_dim, fg = c.keyword },
		GalaxyViModeTerminalUnturned = { bg = c.keyword, fg = c.fg },
	}
end

--Go trough the table and highlight the group with the color values
local highlight = function(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""

	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
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