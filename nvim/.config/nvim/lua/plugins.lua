return {
	{
		"echasnovski/mini.files",
		version = "*",
		init = function()
			vim.keymap.set("n", "<leader>e", function()
				MiniFiles.open()
			end, { desc = "File browser" })
		end,
		config = true,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│" },
			scope = { enabled = false },
		},
	},

	{
		"phaazon/hop.nvim",
		cmd = { "HopChar2" },
		init = function()
			vim.keymap.set("n", "s", "<cmd>HopChar2<CR>", { desc = "HopChar2" })
		end,
		config = true,
	},

	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			completion = { documentation = { auto_show = true } },
		},
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = { sh = { "shellcheck" } }
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
		event = "BufReadPre",
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				yaml = { "prettierd" },
				json = { "prettierd" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"vim",
					"lua",
					"python",
					"go",
					"sql",
					"bash",
					"terraform",
					"hcl",
					"yaml",
					"toml",
					"dockerfile",
					"json",
				},
				highlight = { enable = true },
				indent = { enable = true, disable = { "python" } },
				autotag = { enable = true },
				playground = { enable = true },
			})
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSInstallInfo" },
		event = "BufEnter",
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		branch = "0.1.x",
		cmd = "Telescope",
		config = function()
			local builtin = require("telescope.builtin")

			local map = {
				{ "<leader>f", builtin.find_files, "Telescope files" },
				{ "<leader>g", builtin.live_grep, "Telescope live grep" },
				{
					"<leader>d",
					function()
						builtin.diagnostics({ bufnr = 0 })
					end,
					"Document diagnostics",
				},
				{
					"<leader>k",
					function()
						builtin.keymaps({ modes = { "n" }, show_plug = false, only_buf = true })
					end,
					"Telescope keymaps",
				},
			}

			for _, value in ipairs(map) do
				vim.keymap.set("n", value[1], value[2], { desc = value[3] })
			end

			require("telescope").setup({
				defaults = { file_ignore_patterns = { "^.git/", "^.terraform/" } },
				pickers = {
					find_files = { hidden = true },
					live_grep = {
						layout_strategy = "vertical",
						addition_args = function(_)
							return "--hidden"
						end,
					},
				},
			})
		end,
	},
}
