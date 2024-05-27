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
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
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
-- Netrw settings
-- vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1

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
vim.diagnostic.config({ virtual_text = false, update_in_insert = false })

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

-- Change diagnostic symbols in the sign column (gutter)
for type, icon in pairs({
	Error = " ",
	Warning = " ",
	Hint = " ",
	Information = " ",
}) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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

local switch_layout = function()
	if vim.t.layout == nil or vim.t.layout == "vertical" then
		vim.t.layout = "vertical"
		vim.api.nvim_command("wincmd r")
	else
		vim.api.nvim_command("wincmd R")
	end
end
vim.keymap.set("n", "<leader>L", switch_layout, { desc = "Layout: Switch Windows" })

------------------------------
--Terraform commands
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("SuperSetTerraform", { clear = true }),
	pattern = { "terraform", "hcl" },
	callback = function(_)
		vim.opt_local.commentstring = "# %s"
		vim.keymap.set("n", "<leader>rv", "<cmd>!terraform validate -no-color<CR>", { desc = "Terraform: validate" })
	end,
})

-------------------------------
-- Icons for completion
local icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

return {
	icons = icons,
}
