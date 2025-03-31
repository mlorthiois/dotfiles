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
		green = "#1A7421",
		yellow = "#6B6E1C",
		orange = "#ff8800",
		blue = "#3662D2",
		pink = "#5F22C3",
		--Background and Foreground
		bg = "#ffffff",
		bg_dim = "#EDF4FC",
		bg_accent = "#e0e0e0",
		bg_variant = "#cdcdcd",
		fg = "#333333",
		fg_dim = "#84847f",
		fg_accent = "#000000",
		--Syntax
		value = "#1A7421",
		operator = "#5F22C3",
		type = "#5F22C3",
		keyword = "#3662D2",
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
		Underlined = { fg = c.link, underline = true },
		Ignore = { fg = c.fg_dim },
		Error = { fg = c.error, bold = true, underline = true },
		Todo = { fg = c.yellow, bold = true, italic = true },
		Comment = { fg = c.fg_dim, italic = true },
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
		ColorColumn = { bg = c.bg_dim },
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
		NormalFloat = { fg = c.fg, bg = c.bg_dim },
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
		DiagnosticsUnderlineError = { undercurl = true, sp = c.error },
		DiagnosticsUnderlineWarning = { undercurl = true, sp = c.orange },
		DiagnosticsUnderlineInformation = { undercurl = true, sp = c.blue },
		DiagnosticsUnderlineHint = { fg = c.green },

		-- Treesitter
		-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights

		-- Identifiers
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.fg },
		["@variable.parameter"] = { fg = c.fg },
		["@variable.member"] = { fg = c.fg },
		["@constant"] = { fg = c.fg },
		["@constant.builtin"] = { fg = c.fg },
		["@constant.macro"] = { fg = c.fg },
		["@module"] = { fg = c.fg },
		["@module.builtin"] = { fg = c.fg },
		["@label"] = { fg = c.keyword },

		-- Litterals
		["@string"] = { fg = c.green },
		["@string.regexp"] = { fg = c.green },
		["@string.escape"] = { fg = c.green },
		["@string.special"] = { fg = c.green },
		["@string.special.symbol"] = { fg = c.green },
		["@string.special.url"] = { fg = c.green },
		["@string.special.path"] = { fg = c.green },
		["@character"] = { fg = c.green },
		["@character.special"] = { fg = c.green },
		["@boolean"] = { fg = c.value },
		["@number"] = { fg = c.value },
		["@number.float"] = { fg = c.value },

		-- Types
		["@type"] = { fg = c.keyword },
		["@type.builtin"] = { fg = c.keyword },
		["@type.definition"] = { fg = c.keyword },
		["@attribute"] = { fg = c.fg },
		["@attribute.builtin"] = { fg = c.fg },
		["@property"] = { fg = c.fg },

		-- Functions
		["@function"] = { fg = c.fg_accent },
		["@function.builtin"] = { fg = c.fg_accent },
		["@function.call"] = { fg = c.fg },
		["@function.macro"] = { fg = c.fg },
		["@function.method"] = { fg = c.pinkg },
		["@function.method.call"] = { fg = c.pink },
		["@constructor"] = { fg = c.fg },
		["@operator"] = { fg = c.operator },

		-- Keywords
		["@keyword"] = { fg = c.keyword },
		["@keyword.coroutine"] = { fg = c.keyword },
		["@keyword.function"] = { fg = c.keyword },
		["@keyword.operator"] = { fg = c.keyword },
		["@keyword.import"] = { fg = c.keyword },
		["@keyword.type"] = { fg = c.keyword },
		["@keyword.modifier"] = { fg = c.keyword },
		["@keyword.repeat"] = { fg = c.keyword },
		["@keyword.return"] = { fg = c.keyword },
		["@keyword.debug"] = { fg = c.keyword },
		["@keyword.expection"] = { fg = c.keyword },
		["@keyword.conditional"] = { fg = c.keyword },
		["@keyword.conditional.ternary"] = { fg = c.keyword },
		["@keyword.directive"] = { fg = c.keyword },
		["@keyword.directive.define"] = { fg = c.keyword },

		-- Punctuation
		["@punctuation.delimiter"] = { fg = c.fg_dim },
		["@punctuation.bracket"] = { fg = c.fg_dim },
		["@punctuation.special"] = { fg = c.fg_dim },

		-- Comments
		["@comment"] = { fg = c.fg_dim, italic = true },
		["@comment.documentation"] = { fg = c.fg_dim },
		["@comment.error"] = { fg = c.error },
		["@comment.warning"] = { fg = c.yellow },
		["@comment.todo"] = { fg = c.blue },
		["@comment.note"] = { fg = c.blue },

		-- Completion
		CmpItemAbbrDeprecated = { fg = "#808080" },
		CmpItemAbbrMatch = { fg = c.blue },
		CmpItemAbbrMatchFuzzy = { fg = c.blue, bold = true },
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

		-- Indent Blankline
		IndentBlanklineChar = { fg = c.bg_dim, nocombine = true },
		IndentBlanklineContextChar = { fg = c.fg_dim, nocombine = true },
	}
end

--Set the theme
local set = function()
	-- Set the theme environment
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "fleet"
	local theme = get_theme()

	--Go trough the table and highlight the group with the color values
	for group, colors in pairs(theme) do
		vim.api.nvim_set_hl(0, group, colors)
	end
end

-- Set theme
package.loaded["fleet"] = nil
set()
