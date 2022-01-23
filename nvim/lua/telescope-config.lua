require("telescope").setup({
	pickers = {
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			layout_strategy = "vertical",
		},
		diagnostics = {
			layout_strategy = "vertical",
		},
		lsp_code_actions = {
			theme = "get_cursor",
		},
		buffers = {
			sort_lastused = true,
		},
		old_files = {
			theme = "ivy",
		},
		lsp_references = {
			layout_strategy = "vertical",
		},
		lsp_document_symbols = {
			layout_strategy = "vertical",
		},
		lsp_workspace_symbols = {
			layout_strategy = "vertical",
		},
	},
})
require("telescope").load_extension("fzf")
