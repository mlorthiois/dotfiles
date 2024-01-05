return {
	s = { "<cmd>HopChar2<cr>", "Hop motion" },
	U = { "<cmd>redo<cr>", "Redo" },
	["<leader>"] = {
		t = { "<cmd>TestFile<cr>", "Test file" },
		T = { "<cmd>TestSuite<cr>", "Test workspace" },
		l = { "<cmd>call ToggleWindowLayout()<cr>", "Switch window layout" },
		d = { "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<cr>", "Document diagnostics" },
		D = {
			"<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>",
			"Workspace diagnostics",
		},
		p = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Previous open files" },
		f = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true } )<cr>", "Files" },
		h = { "<cmd>lua require('telescope.builtin').command_history()<cr>", "History" },
		g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Text" },
		s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Symbols" },
		S = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", "Workspace symbols" },
		k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
		R = { "<cmd>TREPLSendRegion<CR>", "Run Treesitter Node" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
		c = {
			"<cmd>lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config')})<cr>",
			"Config",
		},
	},
	["g"] = {
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
		T = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition" },
		r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Goto references" },
	},
}
