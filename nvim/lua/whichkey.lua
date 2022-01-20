local wk = require("which-key")

wk.register({
	h = { "<C-W>s<cr>", "split below" },
	v = { "<C-W>v<cr>", "split right" },
	s = { "<cmd>w<cr>", "save" },
	n = { "<cmd>lnext<cr>", "Next in localfix" },
	p = { "<cmd>lprev<cr>", "Prev in localfix" },
	w = { "<cmd>bdelete<cr>", "Close buffer" },
	b = { "<cmd>Telescope buffers<cr>", "list open buffers" },
	r = { "<cmd>TREPLSendRegion<CR>", "Run Tressitter Node" },
	o = { "<cmd>call ToggleWindowLayout()<cr>", "Switch window layout" },
	f = {
		name = "+Telescope",
		p = { "<cmd>Telescope projects<cr>", "Previous projects" },
		P = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Previous open files" },
		f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>", "Files" },
		h = { "<cmd>lua require('telescope.builtin').command_history()<cr>", "History" },
		o = { "<cmd>lua require('telescope.builtin').vim_options()<cr>", "vim_options" },
		g = { "<cmd>lua require('telescope.builtin').live_grep({layout_strategy='vertical'})<cr>", "Text" },
		t = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Treesitter" },
		s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Symbols" },
		r = { "<cmd>lua require('telescope.builtin').registers()<cr>", "Registers" },
		b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buf_fuz_find" },
	},
	g = {
		name = "+Git",
		o = { "<cmd>Neogit<CR>", "Open Neogit" },
		b = { "<cmd>Telescope git_branches<cr>", "git branches" },
	},
	l = {
		name = "+LSP",
		a = {
			"<cmd>require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>",
			"Code action",
		},
		g = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
		r = {
			"<cmd>lua require('telescope.builtin').lsp_references({layout_strategy='vertical'})<cr>",
			"Symbol References",
		},
		R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
		l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line diagnostics" },
		d = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Document diagnostics" },
		D = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Workspace diagnostics" },
		s = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({layout_strategy='vertical'})<cr>",
			"Document symbols",
		},
		S = {
			"<cmd>lua require('telescope.builtin').lsp_workspace_symbols({layout_strategy='vertical'})<cr>",
			"Workspace symbols",
		},
		n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next diagnostic" },
		p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
		h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
	},
}, {
	prefix = "<leader>",
})
