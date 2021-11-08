vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- Autoinstall packer if not installed
-- local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
-- 	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
-- 	execute("packadd packer.nvim")
-- end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "lewis6991/impatient.nvim", rocks = "mpack" })

	----------------------------------------------------------------------
	-- editing
	use({
		"folke/which-key.nvim",
		config = function()
			require("whichkey")
		end,
		opt = true,
		keys = "<space>",
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
	})

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

	use({ "kabouzeid/nvim-lspinstall", cmd = { "LspInstall", "LspUninstall" } })

	use({
		"neovim/nvim-lspconfig",
		-- event = "BufReadPre",
		config = function()
			require("lsp")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("completion")
		end,
		requires = {
			{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
			{ "L3MON4D3/LuaSnip", event = "InsertEnter" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		},
		after = { "nvim-lspconfig" },
	})

	use({ "kosayoda/nvim-lightbulb", event = "BufReadPre" })

	-- use({
	-- 	"lewis6991/gitsigns.nvim",
	-- 	event = "BufReadPre",
	-- 	config = function()
	-- 		require("git")
	-- 	end,
	-- })

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
		event = "BufRead",
		branch = "0.5-compat",
		run = ":TSUpdate",
		config = function()
			require("treesitter")
		end,
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
		"NTBBloodbath/galaxyline.nvim",
		event = "BufReadPre",
		config = function()
			require("gline")
		end,
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Simple tab line to respect vim tab
	use({
		"mkitt/tabline.vim",
		event = "BufRead",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		-- event = "BufReadPre",
		config = function()
			require("colorizer").setup()
		end,
		cmd = "ColorizerAttachToBuffer",
	})

	use({
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({ integrations = { diffview = true } })
		end,
		cmd = "Neogit",
		requires = { "nvim-lua/plenary.nvim", { "sindrets/diffview.nvim", after = "neogit" } },
	})

	----------------------------------------------------------------------
	-- TELESCOPE
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			require("telescope-config")
		end,
		cmd = "Telescope",
	})
end)
