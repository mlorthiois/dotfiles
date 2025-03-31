return {
	cmd = { "basedpyright-langserver", "--stdio" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		".git",
	},
	filetypes = { "python" },
	settings = {
		basedpyright = {
			disableOrganizeImports = true, -- Using Ruff's import organizer
			analysis = {
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
				-- ignore = { "*" }, -- Ignore files for exclusive analysis with Ruff for linting
			},
		},
	},
	capabilities = { documentFormattingProvider = false },
}
