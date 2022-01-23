local ls = require("luasnip")

ls.config.set_config({
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = false,
})

ls.snippets = {
	all = {},
}

require("luasnip.loaders.from_vscode").lazy_load()

-- Keymappings
vim.api.nvim_set_keymap(
	"i",
	"<C-j>",
	'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : ""',
	{ expr = true, silent = true }
)
vim.api.nvim_set_keymap(
	"s",
	"<C-j>",
	'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump"',
	{ expr = true, silent = true }
)
-- vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.expand()", { expr = true, silent = true })
vim.api.nvim_set_keymap(
	"i",
	"<C-k>",
	'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : ""',
	{ expr = true, silent = true }
)
vim.api.nvim_set_keymap(
	"s",
	"<C-k>",
	-- ":lua.backward()"
	'luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : ""',
	{ expr = true, silent = true }
)
