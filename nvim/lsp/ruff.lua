return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		".git",
		"ruff.toml",
	},
	single_file_support = true,
	settings = {},
	capabilites = { hoverProvider = false },
}
