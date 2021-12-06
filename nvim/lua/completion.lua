vim.o.completeopt = "menuone,noselect"

local icons = {
	Class = " Class",
	Color = " Color",
	Constant = " Constant",
	Constructor = " Constructor",
	Enum = "了Enum",
	EnumMember = " Enum Member",
	Field = " Field",
	File = " File",
	Folder = " Folder",
	Function = " Function",
	Interface = "ﰮ Interface",
	Keyword = " Keyword",
	Method = "ƒ Method",
	Module = " Module",
	Property = " Property",
	Snippet = "﬌ Snippet",
	Struct = " Struct",
	Text = " Text",
	Unit = " Unit",
	Value = " Value",
	Variable = " Variable",
}

local source = {
	nvim_lsp = "[LSP]",
}

local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	sources = {
		{ name = "nvim_lsp" },
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = icons[vim_item.kind]
			vim_item.menu = source[entry.source.name]
			return vim_item
		end,
	},
})

vim.cmd([[highlight link CompeDocumentation NormalFloat]])
