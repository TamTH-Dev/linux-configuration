local utils = require("core.utils")
local global = vim.g
local cmd = vim.cmd

local M = {}

--[[ If theme given, load given theme if given, otherwise nvchad_theme ]]
function M.init()
	local ui = utils.load_config().ui
	local theme = ui.theme
	local theme_loaded = pcall(require, theme)

	if not theme_loaded then
		return
	end

	--[[ If colorscheme is tokyonight ]]
	if theme == "tokyonight" then
		global.tokyonight_style = ui.style
		global.tokyonight_dark_sidebar = ui.dark_sidebar
		global.tokyonight_dark_float = ui.dark_float
	end

	--[[ Set colorscheme ]]
	cmd("colorscheme " .. theme)

	--[[ Unload to force reload ]]
	package.loaded["colors.highlights" or false] = nil
	--[[ Then load the highlights ]]
	require("colors.highlights")

	--[[ Set the global theme, used at various places like theme switcher, highlights ]]
	global.default_theme = theme
end

--[[ Returns a table of colors for given or current theme ]]
--TODO:[[ Research more ]]
function M.get(theme)
	if not theme then
		theme = vim.g.default_theme
	end
	return require("")
end

return M
