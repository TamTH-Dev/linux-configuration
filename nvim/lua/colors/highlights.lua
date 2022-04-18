local M = {}

local cmd = vim.cmd

-- TODO: Find the way to get colors from scheme
-- Get color from current scheme
-- local colors = require('colors').get()

-- Declare colors manually
--local colors = {
--  -- bg = '#1a1b26',
--  bg = '#24283b',
--  -- secondaryBg = '#24283b',
--  secondaryBg = '#1a1b26',
--  fg = '#c0caf5',
--  red = '#f7768e',
--  orange = '#ff9e64',
--  brown = '#e0af68',
--  yellow = '#f1fa8c',
--  green = '#9ece6a',
--  magenta = '#bb9af7',
--  blue = '#2ac3de',
--  cyan = '#7dcfff',
--  lightBlue = '#73daca',
--  gray = '#414868',
--}
local colors = {
  bg = '#2E3440',
  secondaryBg = '#3B4252',
  fg = '#D8DEE9',
  red = '#BF616A',
  orange = '#D08770',
  brown = '',
  yellow = '#EBCB8B',
  green = '#A3BE8C',
  magenta = '#B48EAD',
  blue = '#8FBCBB',
  cyan = '#88C0D0',
  lightBlue = '#81A1C1',
  gray = '#434C5E',
}


-- Define fg color
-- @param group Group
-- @param color Color
local fg = function(group, color)
   cmd('hi '..group..' guifg='.. color)
end

-- Define bg color
-- @param group Group
-- @param color Color
local bg = function(group, color)
   cmd('hi '..group..' guibg='.. color)
end

-- General
fg('FloatBorder', colors.blue)
bg('NormalFloat', colors.bg)

-- Telescope
fg('TelescopeBorder', colors.blue)
fg('TelescopePromptPrefix', colors.magenta)
fg('TelescopeNormal', colors.gray)
fg('TelescopeSelection', colors.fg)
fg('TelescopeSelectionCaret', colors.orange)
fg('TelescopeMultiSelection', colors.gray)
fg('TelescopeMatching', colors.blue)

-- LSP
fg('DiagnosticFloatingError', colors.red)
fg('DiagnosticFloatingWarn', colors.orange)
fg('DiagnosticFloatingInfo', colors.magenta)
fg('DiagnosticFloatingHint', colors.blue)
fg('DiagnosticSignError', colors.red)
fg('DiagnosticSignWarn', colors.orange)
fg('DiagnosticSignInfo', colors.magenta)
fg('DiagnosticSignHint', colors.blue)
fg('DiagnosticVirtualTextError', colors.red)
fg('DiagnosticVirtualTextWarn', colors.orange)
fg('DiagnosticVirtualTextInfo', colors.magenta)
fg('DiagnosticVirtualTextHint', colors.blue)
bg('DiagnosticVirtualTextError', 'default')
bg('DiagnosticVirtualTextWarn', 'default')
bg('DiagnosticVirtualTextInfo', 'default')
bg('DiagnosticVirtualTextHint', 'default')

-- Indent_blankline
fg('IndentBlanklineContextChar', colors.orange)

-- Barbar
bg('BufferCurrent', colors.secondaryBg)
fg('BufferCurrentSign', colors.magenta)
bg('BufferCurrentSign', colors.secondaryBg)
fg('BufferCurrentMod', colors.blue)
bg('BufferCurrentMod', colors.secondaryBg)
fg('BufferVisible', colors.fg)
bg('BufferVisible', colors.bg)
fg('BufferVisibleIndex', colors.fg)
bg('BufferVisibleIndex', colors.bg)
fg('BufferVisibleMod', colors.fg)
bg('BufferVisibleMod', colors.bg)
fg('BufferVisibleSign', colors.magenta)
bg('BufferVisibleSign', colors.bg)
fg('BufferVisibleTarget', colors.fg)
bg('BufferVisibleTarget', colors.bg)

-- NvimTree
fg('NvimTreeFolderIcon', colors.blue)

-- Fzf
fg('fzf1', colors.orange)
bg('fzf1', colors.bg)
fg('fzf2', colors.orange)
bg('fzf2', colors.bg)
fg('fzf3', colors.orange)
bg('fzf3', colors.bg)

-- Rainbow Treesitter
fg('rainbowcol1', colors.red)
fg('rainbowcol2', colors.orange)
fg('rainbowcol3', colors.yellow)
fg('rainbowcol4', colors.green)
fg('rainbowcol5', colors.magenta)
fg('rainbowcol6', colors.blue)
fg('rainbowcol7', colors.cyan)

-- Export colors to use somewhere else
M.colors = colors
return M
