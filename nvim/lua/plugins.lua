vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "lewis6991/impatient.nvim", rocks = "mpack" })

	use({
		"mlorthiois/repl-region.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			{ "kassio/neoterm", cmd = { "TREPLSend", "TREPLSendFile", "T", "TREPLSendRegion" } },
		},
		cmd = "TREPLSendRegion",
	})

	----------------------------------------------------------------------
	use({
		"folke/which-key.nvim",
		config = function()
			require("whichkey")
		end,
		keys = "<space>",
	})

	-- use({
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("project_nvim").setup()
	-- 	end,
	-- })

	use({
		"terrortylor/nvim-comment",
		event = "BufReadPre",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		cmd = { "HopChar2", "HopChar1" },
	})

	----------------------------------------------------------------------
	-- LSP
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		config = function()
			require("lsp.null-lsp")
		end,
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		after = "nvim-lspconfig",
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("completion")
		end,
		requires = {
			{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
			{ "hrsh7th/cmp-path", event = "InsertEnter" },
		},
		event = "InsertEnter",
		after = { "nvim-lspconfig" },
	})

	use({ "kosayoda/nvim-lightbulb", event = "BufReadPre" })

	use({
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({ server = { on_attach = require("lsp.utils").on_attach } })
		end,
		ft = "rust",
		requires = { "neovim/nvim-lspconfig" },
	})

	----------------------------------------------------------------------
	-- TREESITTER
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("treesitter")
		end,
		requires = { { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" } },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			require("indentline")
		end,
	})

	----------------------------------------------------------------------
	-- EDITOR
	use({
		"mkitt/tabline.vim",
		event = "TabEnter",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		cmd = "ColorizerAttachToBuffer",
	})

	----------------------------------------------------------------------
	-- TELESCOPE
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "kyazdani42/nvim-web-devicons", cmd = "Telescope" },
		},
		config = function()
			require("telescope-config")
		end,
		cmd = "Telescope",
	})
end)
