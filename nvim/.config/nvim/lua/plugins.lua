return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		event = "BufReadPre",
	},

	{
		"phaazon/hop.nvim",
		opts = {},
		cmd = { "HopChar2" },
		init = function()
			vim.keymap.set("n", "s", "<cmd>HopChar2<CR>", { desc = "HopChar2" })
		end,
		config = function()
			require("hop").setup()
		end,
	},

	{
		"vim-test/vim-test",
		cmd = { "TestFile", "TestSuite", "TestNearest", "TestLast", "TestVisit" },
		init = function()
			vim.g["test#neovim#start_normal"] = 1
			vim.g["test#echo_command"] = 0

			vim.keymap.set("n", "<leader>t", "<cmd>TestFile<CR>", { desc = "Test file" })
			vim.keymap.set("n", "<leader>T", "<cmd>TestSuite<CR>", { desc = "Test suite" })
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

				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = 0,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
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

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local km = function(modes, keymap, f, desc)
						vim.keymap.set(modes, keymap, f, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					km("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
					km("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
					km("n", "gd", vim.lsp.buf.definition, "Go to definition")
					km("n", "K", vim.lsp.buf.hover, "Hover")
					km("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
					-- km("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
					km("n", "<leader>D", vim.lsp.buf.type_definition, "Type definition")
					km("n", "<leader>r", vim.lsp.buf.rename, "Rename")
					km({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code action")

					local telescope = require("telescope.builtin")
					km("n", "gr", telescope.lsp_references, "Go to references")
					km("n", "<leader>s", telescope.lsp_document_symbols, "Document symbols")
					km("n", "<leader>S", telescope.lsp_workspace_symbols, "Workspace symbols")
				end,
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
		event = "InsertEnter",
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
					"vim",
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
		branch = "0.1.x",
		cmd = "Telescope",
		config = function()
			local set = function(key, f, desc)
				vim.keymap.set("n", key, f, { desc = desc })
			end

			builtin = require("telescope.builtin")

			set("<leader>f", builtin.find_files, "Telescope files")
			set("<leader>g", builtin.live_grep, "Telescope live grep")
			set("<leader>d", function()
				builtin.diagnostics({ bufnr = 0 })
			end, "Document diagnostics")
			set("<leader>D", builtin.diagnostics, "Workspace diagnostics")
			set("<leader>k", function()
				builtin.keymaps({ modes = { "n" }, show_plug = false, only_buf = true })
			end, "Telescope keymaps")
			set("<leader>c", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, "Telescope config")

			require("telescope").setup({
				defaults = {
					borderchars = {
						{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
					file_ignore_patterns = { "^.git/", "^node_modules/" },
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						layout_strategy = "vertical",
						addition_args = function(opts)
							return "--hidden"
						end,
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
			})
		end,
	},
}
