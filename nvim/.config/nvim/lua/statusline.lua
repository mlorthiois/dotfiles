-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline
-- https://elianiva.my.id/post/neovim-lua-statusline

local fn = vim.fn
local api = vim.api

local modes = {
	["n"] = { "NORMAL", "%#StatusLineNormal#" },
	["no"] = { "NORMAL", "%#StatusLineNormal#" },
	["v"] = { "VISUAL", "%#StatuslineVisual#" },
	["V"] = { "VISUAL LINE", "%#StatuslineVisual#" },
	[""] = { "VISUAL BLOCK", "%#StatusLineVisual#" },
	["s"] = { "SELECT", "%#StatusLineVisual#" },
	["S"] = { "SELECT LINE", "%#StatusLineVisual#" },
	[""] = { "SELECT BLOCK", "%#StatusLineVisual#" },
	["i"] = { "INSERT", "%#StatusLineInsert#" },
	["ic"] = { "INSERT", "%#StatusLineInsert#" },
	["R"] = { "REPLACE", "%#StatuslineReplace#" },
	["Rv"] = { "VISUAL REPLACE", "%#StatuslineReplace#" },
	["c"] = { "COMMAND", "%#StatusLineCommand#" },
	["cv"] = { "VIM EX", "" },
	["ce"] = { "EX", "" },
	["r"] = { "PROMPT", "" },
	["rm"] = { "MOAR", "" },
	["r?"] = { "CONFIRM", "" },
	["!"] = { "SHELL", "" },
	["t"] = { "TERMINAL", "%#StatusLineTerminal#" },
	["nt"] = { "TERMINAL", "%#StatusLineTerminal#" },
}

local get_current_formatted_mode = function()
	local mode_options = modes[api.nvim_get_mode().mode]
	return string.format("%s %s %%#StatusLine# ", mode_options[2], mode_options[1])
end

local get_file_infos = function()
	local fpath = fn.fnamemodify(fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		fpath = " "
	else
		fpath = string.format("%%<%s/", fpath)
	end

	local fname = fn.expand("%:t")
	if fname ~= "" then
		fname = fname .. " "
	end

	return string.format("%s%s", fpath, fname)
end

local get_lineinfo = function()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return "%l/%L(%c) "
end

Statusline = {}
Statusline.active = function()
	return table.concat({
		"%#StatusLine#",
		get_current_formatted_mode(),
		get_file_infos(),
		"%=",
		get_lineinfo(),
	})
end

Statusline.inactive = function()
	return get_file_infos()
end

Statusline.disabled = function()
	return "%#StatusLine#" .. get_current_formatted_mode()
end

api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au TermOpen * setlocal statusline=%!v:lua.Statusline.disabled()
  augroup END
]],
	false
)
