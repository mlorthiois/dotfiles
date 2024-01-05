return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").register(require("keymaps"))
		end,
		opts = {
			window = {
				border = "single",
				padding = { 0, 0, 0, 0 },
				margin = { 0, 0, 0, 0 },
			},
			plugins = {
				presets = {
					g = false,
				},
			},
		},
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
		event = "BufReadPre",
	},

	{
		"phaazon/hop.nvim",
		opts = {},
		cmd = { "HopChar2", "HopChar1" },
	},

	{
		"vim-test/vim-test",
		cmd = { "TestFile", "TestSuite" },
		init = function()
			vim.g["test#neovim#start_normal"] = 1
			vim.g["test#echo_command"] = 0
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local disable_format_servers = { "tsserver", "sumneko_lua" }
			local on_attach = function(client)
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
				vim.lsp.handlers["textDocument/signatureHelp"] =
					vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

				-- Disable "format on save" for disabled servers
				for _, value in ipairs(disable_format_servers) do
					if client.server_capabilities.documentFormattingProvider and client.name == value then
						client.server_capabilities.documentFormattingProvider = false
						return
					end
				end

				vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
			end

			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({
				on_attach = on_attach,
			})
			lspconfig.ruff_lsp.setup({
				on_attach = on_attach,
			})
			lspconfig.gopls.setup({
				on_attach = on_attach,
			})
			lspconfig.terraformls.setup({
				on_attach = on_attach,
			})
		end,
		event = "BufReadPre",
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				sh = { "shellcheck" },
			}

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
				go = { "gofmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
	},

	{
		"hrsh7th/nvim-cmp",
		init = function()
			vim.o.completeopt = "menuone,noselect"
			vim.cmd([[highlight link CompeDocumentation NormalFloat]])
		end,
		config = function()
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp = require("cmp")
			cmp.setup({
				preselect = cmp.PreselectMode.None,
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
				},

				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = (require("settings").icons[vim_item.kind] or "") .. vim_item.kind
						return vim_item
					end,
				},

				experimental = {
					ghost_text = true,
				},
			})
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
		},
	},

	{
		"kosayoda/nvim-lightbulb",
		event = "BufReadPre",
		opts = {
			autocmd = { enabled = true },
			sign = { text = "▶" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"go",
					"sql",
					"bash",
					"typescript",
					"terraform",
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
			{
				"nvim-telescope/telescope-ui-select.nvim",
				config = function()
					require("telescope").load_extension("ui-select")
				end,
			},
		},
		opts = {
			defaults = {
				borderchars = {
					{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
				file_ignore_patterns = { "^.git/" },
			},
			pickers = {
				live_grep = {
					layout_strategy = "vertical",
				},
				diagnostics = {
					layout_strategy = "vertical",
				},
				buffers = {
					sort_lastused = true,
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
		},
		branch = "0.1.x",
		cmd = "Telescope",
	},
}
