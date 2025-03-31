-------------------------------
-- Global settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.editorconfig = false
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.pumheight = 15
vim.opt.fileencoding = "utf-8"
vim.opt.iskeyword:append("-")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 3
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.showtabline = 0

-------------------------------
-- Keymapping
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "Window down", noremap = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "Window up", noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "Window right", noremap = true })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "Window left", noremap = true })
vim.keymap.set("n", "m", "}", { desc = "Jump paragraph", noremap = true })
vim.keymap.set("n", "M", "{", { desc = "Jump previous paragraph", noremap = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "U", "<cmd>redo<cr>", { desc = "Redo" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-------------------------------
-- Diagnostic
vim.diagnostic.config({ update_in_insert = false })
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

-------------------------------
-- Handle layout
local toggle_layout = function()
	if vim.t.layout == nil or vim.t.layout == "vertical" then
		vim.t.layout = "horizontal"
		vim.api.nvim_command("wincmd K")
	else
		vim.t.layout = "vertical"
		vim.api.nvim_command("wincmd H")
	end
end
vim.keymap.set("n", "<leader>l", toggle_layout, { desc = "Layout: Toogle Window" })
