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
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
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

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.ruff_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local set_opts = function(desc)
						return { buffer = ev.buf, desc = "LSP: " .. desc }
					end

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, set_opts("Go to declaration"))
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, set_opts("Go to definition"))
					vim.keymap.set("n", "K", vim.lsp.buf.hover, set_opts("Hover"))
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, set_opts("Go to Implementation"))
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, set_opts("Signature help"))
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, set_opts("Type definition"))
					vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, set_opts("Rename"))
					vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, set_opts("Code action"))

					local telescope = require("telescope.builtin")
					vim.keymap.set("n", "gr", telescope.lsp_references, set_opts("Go to references"))
					vim.keymap.set("n", "<leader>s", telescope.lsp_document_symbols, set_opts("Document symbols"))
					vim.keymap.set("n", "<leader>S", telescope.lsp_workspace_symbols, set_opts("Workspace symbols"))
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

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				preselect = cmp.PreselectMode.None,

				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),
				},

				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
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
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
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
					"lua",
					"python",
					"go",
					"sql",
					"bash",
					"terraform",
					"yaml",
					"toml",
					"dockerfile",
					"json",
				},
				highlight = { enable = true },
				indent = { enable = true, disable = { "python" } },
				autotag = { enable = true },
			})
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSInstallInfo" },
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
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
					live_grep = {
						layout_strategy = "vertical",
						addition_args = function(opts)
							return "--hidden"
						end,
					},
					find_files = { hidden = true },
					diagnostics = { layout_strategy = "vertical" },
					buffers = { sort_lastused = true },
					lsp_references = { layout_strategy = "vertical" },
					lsp_document_symbols = { layout_strategy = "vertical" },
					lsp_workspace_symbols = { layout_strategy = "vertical" },
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")
		end,
	},
}
