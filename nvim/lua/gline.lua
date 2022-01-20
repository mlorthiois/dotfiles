require("galaxyline").short_line_list = {
	"Mundo",
	"MundoDiff",
	"fugitive",
	"fugitiveblame",
	"help",
	"minimap",
	"qf",
	"tabman",
	"tagbar",
	"toggleterm",
}

local vi_mode_mapping = {
	[""] = { "Empty", "-" },
	["!"] = { "Shell", "-" },
	["^V"] = { "CommonVisual", "B" },
	["R"] = { "Replace", "REPLACE" },
	["Rv"] = { "Normal", "-" },
	["S"] = { "Normal", "-" },
	["V"] = { "CommonVisual", "VISUAL LINE" },
	["c"] = { "Command", "COMMAND" },
	["ce"] = { "Normal", "-" },
	["cv"] = { "Normal", "-" },
	["i"] = { "Insert", "INSERT" },
	["ic"] = { "Normal", "-" },
	["n"] = { "Normal", "NORMAL" },
	["no"] = { "Normal", "-" },
	["r"] = { "Normal", "-" },
	["r?"] = { "Normal", "-" },
	["rm"] = { "Normal", "-" },
	["s"] = { "Normal", "-" },
	["t"] = { "Terminal", "TERMINAL" },
	["v"] = { "CommonVisual", "VISUAL" },
}

require("galaxyline").section.left = {
	{
		LeftViModeColourSet = {
			provider = function()
				if vi_mode_mapping[vim.fn.mode()] == nil then
					vim.api.nvim_command("highlight link GalaxyViModeColourUnturned GalaxyViModeEmptyUnturned")
					vim.api.nvim_command("highlight link GalaxyViModeColourInverted GalaxyViModeEmptyInverted")
				else
					vim.api.nvim_command(
						"highlight link GalaxyViModeColourUnturned GalaxyViMode"
							.. vi_mode_mapping[vim.fn.mode()][1]
							.. "Unturned"
					)
					vim.api.nvim_command(
						"highlight link GalaxyViModeColourInverted GalaxyViMode"
							.. vi_mode_mapping[vim.fn.mode()][1]
							.. "Inverted"
					)
				end
			end,
		},
	},
	{
		LeftViModeSeparator = {
			highlight = "GalaxyViModeColourUnturned",
			provider = function()
				return " "
			end,
		},
	},
	{
		LeftViMode = {
			highlight = "GalaxyViModeColourUnturned",
			provider = function()
				if vi_mode_mapping[vim.fn.mode()] == nil then
					return " -"
				else
					return " " .. string.format("%s", vi_mode_mapping[vim.fn.mode()][2])
				end
			end,
			separator = " ",
			separator_highlight = "GalaxyViModeColourUnturned",
		},
	},
	{
		LeftGitSeparator = {
			highlight = "GalaxyViModeColourInverted",
			provider = function()
				return ""
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon7",
		},
	},
	{
		LeftGitBranch = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				if require("galaxyline.condition").check_git_workspace() then
					return " " .. require("galaxyline.providers.vcs").get_git_branch()
				else
					return " "
				end
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon3",
		},
	},
	{
		LeftGitDiffSeparator = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				return " "
			end,
		},
	},
	{
		LeftFileName = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				if #vim.fn.expand("%:p") == 0 then
					return "-"
				end
				return vim.fn.expand("%:r") .. "." .. vim.fn.expand("%:e") .. " "
			end,
		},
	},
	{
		LeftMiddleSeparator = {
			highlight = "GalaxyMapperCommon1",
			provider = function()
				return ""
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon1",
		},
	},
}

require("galaxyline").section.mid = {}

require("galaxyline").section.right = {
	{
		RightLspError = {
			provider = function()
				if #vim.tbl_keys(vim.lsp.buf_get_clients()) <= 0 then
					return
				end

				if vim.lsp.diagnostic.get_count(0, "Error") == 0 then
					vim.cmd("highlight link GalaxyRightLspError GalaxyLeftLspInactive")
				else
					vim.cmd("highlight link GalaxyRightLspError GalaxyRightLspErrorActive")
				end

				return "!" .. vim.lsp.diagnostic.get_count(0, "Error") .. " "
			end,
		},
	},
	{
		RightLspWarning = {
			provider = function()
				if #vim.tbl_keys(vim.lsp.buf_get_clients()) <= 0 then
					return
				end

				if vim.lsp.diagnostic.get_count(0, "Warning") == 0 then
					vim.cmd("highlight link GalaxyRightLspWarning GalaxyLeftLspInactive")
				else
					vim.cmd("highlight link GalaxyRightLspWarning GalaxyRightLspWarningActive")
				end

				return "?" .. vim.lsp.diagnostic.get_count(0, "Warning") .. " "
			end,
		},
	},
	{
		RightLspInformation = {
			provider = function()
				if #vim.tbl_keys(vim.lsp.buf_get_clients()) <= 0 then
					return
				end

				if vim.lsp.diagnostic.get_count(0, "Information") == 0 then
					vim.cmd("highlight link GalaxyRightLspInformation GalaxyLeftLspInactive")
				else
					vim.cmd("highlight link GalaxyRightLspInformation GalaxyRightLspInformationActive")
				end

				return "+" .. vim.lsp.diagnostic.get_count(0, "Information") .. " "
			end,
		},
	},
	{
		RightLspHint = {
			provider = function()
				if #vim.tbl_keys(vim.lsp.buf_get_clients()) <= 0 then
					return
				end

				if vim.lsp.diagnostic.get_count(0, "Hint") == 0 then
					vim.cmd("highlight link GalaxyRightLspHint GalaxyLeftLspInactive")
				else
					vim.cmd("highlight link GalaxyRightLspHint GalaxyRightLspHintActive")
				end

				return "-" .. vim.lsp.diagnostic.get_count(0, "Hint") .. " "
			end,
		},
	},
	{
		RightLspHintSeparator = {
			highlight = "GalaxyMapperCommon1",
			provider = function()
				return ""
			end,
		},
	},
	{
		RightLspClient = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				if #vim.tbl_keys(vim.lsp.buf_get_clients()) >= 1 then
					local lsp_client_name_first = vim.lsp.get_client_by_id(
						tonumber(vim.inspect(vim.tbl_keys(vim.lsp.buf_get_clients())):match("%d+"))
					).name:match("%l+")

					if lsp_client_name_first == nil then
						return #vim.tbl_keys(vim.lsp.buf_get_clients()) .. ": "
					else
						return #vim.tbl_keys(vim.lsp.buf_get_clients()) .. ":" .. lsp_client_name_first .. " "
					end
				else
					return " "
				end
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon3",
		},
	},
	{
		RightLspClientSeparator = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				return "  "
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon3",
		},
	},
	{
		RightTabStop = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				return string.format("%s", vim.bo.tabstop) .. ":"
			end,
		},
	},
	{
		RightFileType = {
			provider = function()
				if vim.bo.fileencoding == "utf-8" then
					vim.cmd("highlight link GalaxyRightFileType GalaxyMapperCommon3")
				else
					vim.cmd("highlight link GalaxyRightFileType GalaxyMapperCommon8")
				end

				return string.format("%s", vim.bo.filetype)
			end,
		},
	},
	{
		RightFileEncodingSeparator = {
			highlight = "GalaxyMapperCommon7",
			provider = function()
				return ""
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon7",
		},
	},
	{
		RightPositionPercentage = {
			highlight = "GalaxyMapperCommon2",
			provider = function()
				local percent = math.floor(100 * vim.fn.line(".") / vim.fn.line("$"))
				return string.format("%s%s ☰", percent, "%")
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon2",
		},
	},
	{
		RightPositionSeparator = {
			highlight = "GalaxyMapperCommon2",
			provider = function()
				return "  "
			end,
		},
	},
}

require("galaxyline").section.short_line_left = {
	{
		ShortLineLeftBufferType = {
			highlight = "GalaxyMapperCommon2",
			provider = function()
				local BufferTypeMap = {
					["Mundo"] = "Mundo History",
					["MundoDiff"] = "Mundo Diff",
					["NvimTree"] = "Nvim Tree",
					["fugitive"] = "Fugitive",
					["fugitiveblame"] = "Fugitive Blame",
					["help"] = "Help",
					["minimap"] = "Minimap",
					["qf"] = "Quick Fix",
					["tabman"] = "Tab Manager",
					["tagbar"] = "Tagbar",
					["toggleterm"] = "Terminal",
				}
				local name = BufferTypeMap[vim.bo.filetype] or "Editor"
				return string.format("  %s ", name)
			end,
			separator = " ",
			separator_highlight = "GalaxyMapperCommon7",
		},
	},
	{
		ShortLineLeftWindowNumber = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				return "  "
			end,
			separator = "",
			separator_highlight = "GalaxyMapperCommon1",
		},
	},
}

require("galaxyline").section.short_line_right = {
	{
		ShortLineRightBlank = {
			highlight = "GalaxyMapperCommon3",
			provider = function()
				if vim.bo.filetype == "toggleterm" then
					return " " .. vim.api.nvim_buf_get_var(0, "toggle_number") .. " "
				else
					return "  "
				end
			end,
			separator = "",
			separator_highlight = "GalaxyMapperCommon1",
		},
	},
	{
		ShortLineRightInformational = {
			highlight = "GalaxyMapperCommon2",
			provider = function()
				return " Neovim "
			end,
			separator = "",
			separator_highlight = "GalaxyMapperCommon7",
		},
	},
}
