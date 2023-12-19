require("nvim-treesitter.configs").setup({
	ensure_installed = {"lua", "r", "python", "bash", "typescript"},
	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
	autotag = { enable = true },
	playground = { enable = true },
})
