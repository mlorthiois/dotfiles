vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tutor = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_man = 1

-------------------------------
vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.wrap = true
vim.opt.pumheight = 15
vim.opt.fileencoding = "utf-8"
vim.opt.iskeyword:append("-")
vim.opt.mouse = ""
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.t_Co = 256
vim.opt.conceallevel = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.formatoptions:remove("c")
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 3
vim.opt.colorcolumn = "99999"
vim.opt.showmatch = true
vim.opt.showtabline = 0

-------------------------------
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1

-------------------------------
-- Keymapping
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { noremap = true })
vim.keymap.set("n", "m", "}", { noremap = true })
vim.keymap.set("n", "M", "{", { noremap = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-------------------------------
-- Set diagnostic
vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
})
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

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
vim.cmd([[
  function! ToggleWindowLayout()
    if !exists('t:splitType') || t:splitType == 'vertical'
      windo wincmd K
      let t:splitType = 'horizontal'
    else
      windo wincmd H
      let t:splitType = 'vertical'
    endif
  endfunction
]])

-------------------------------
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
