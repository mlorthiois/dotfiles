local execute = vim.api.nvim_command
local fn = vim.fn

-- Autoinstall packer if not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"folke/which-key.nvim",
		config = function()
			require("whichkey")
		end,
		opt = true,
		keys = "<space>",
	})

	-- General
	use("airblade/vim-rooter")
	use({
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		event = "BufReadPre",
	})
	use({ "windwp/nvim-autopairs", opt = true, after = "nvim-compe" })

	-- LSP
	use({ "kabouzeid/nvim-lspinstall", event = "BufReadPre" })
	use({
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			require("lsp")
		end,
	})
	use({
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require("completion")
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		event = "BufReadPre",
		config = function()
			require("lspsaga").init_lsp_saga()
		end,
	})
	use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("git")
		end,
	})
	use({
		"simrat39/rust-tools.nvim",
		config = function()
			require("lsp.rust")
		end,
		ft = "rust",
	})

	-- Treesitter
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

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Status Line and Tab line
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		event = "BufReadPre",
		config = function()
			require("gline")
		end,
	})
	use({
		"jose-elias-alvarez/buftabline.nvim",
		config = function()
			require("buftabline").setup({
				tab_format = "#{i} #{n}: #{b}#{f} ",
				go_to_maps = false,
			})
			require("buftabline.utils").map({ prefix = "<leader>b", cmd = "buffer" })
			require("buftabline.utils").map({ prefix = "<C>", cmd = "buffer" })
		end,
		event = "BufReadPre",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("telescope-config")
		end,
		cmd = "Telescope",
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- Color
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({ "tjdevries/colorbuddy.nvim" })
end)
