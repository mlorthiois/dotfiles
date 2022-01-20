vim.o.completeopt = "menuone,noselect"

local icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = (icons[vim_item.kind] or "") .. vim_item.kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_path = "[PATH]",
			})[entry.source.name]
			return vim_item
		end,
	},

	experimental = {
		ghost_text = true,
	},
})

vim.cmd([[highlight link CompeDocumentation NormalFloat]])
