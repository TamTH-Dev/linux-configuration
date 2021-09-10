local global = vim.g
local nvim_command = vim.api.nvim_command
local map = vim.api.nvim_set_keymap

local options = { noremap = true, silent = true }
local colors = {
  bg = '#24283b',
  fg = '#c0caf5',
  red = '#f7768e',
  green = '#9ece6a',
  orange = '#ff9e64',
  blue = '#7aa2f7',
  magenta = '#bb9af7',
  cyan = '#7dcfff',
  yellow = '#e0af68',
}

-- Move to previous/next
map('n', '<leader><S-Tab>', ':BufferPrevious<cr>', options)
map('n', '<leader><Tab>', ':BufferNext<cr>', options)

-- Re-order to previous/next
map('n', '<leader><', ':BufferMovePrevious<cr>', options)
map('n', '<leader>>', ' :BufferMoveNext<cr>', options)

-- Goto buffer in position...
map('n', '<leader>1', ':BufferGoto 1<cr>', options)
map('n', '<leader>2', ':BufferGoto 2<cr>', options)
map('n', '<leader>3', ':BufferGoto 3<cr>', options)
map('n', '<leader>4', ':BufferGoto 4<cr>', options)
map('n', '<leader>5', ':BufferGoto 5<cr>', options)
map('n', '<leader>6', ':BufferGoto 6<cr>', options)
map('n', '<leader>7', ':BufferGoto 7<cr>', options)
map('n', '<leader>8', ':BufferGoto 8<cr>', options)
map('n', '<leader>9', ':BufferGoto 9<cr>', options)
map('n', '<leader>10', ':BufferGoto 10<cr>', options)
map('n', '<leader>0', ':BufferLast<cr>', options)

-- Close all buffer but accept the current one
map('n', '<leader>cb', ':BufferCloseAllButCurrent<cr>', options)

-- Sort buffer
map('n', '<leader>bb', ':BufferOrderByBufferNumber<cr>', options)
map('n', '<leader>bd', ':BufferOrderByDirectory<cr>', options)
map('n', '<leader>bl', ':BufferOrderByLanguage<cr>', options)

-- Set barbar's options
global.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  -- exclude_ft = ['javascript'],
  -- exclude_name = ['package.json'],

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = 'New buffer',
}

-- local bg_inactive =
nvim_command('highlight BufferCurrentSign guifg='..colors.red)

nvim_command('highlight BufferVisible guifg='..colors.fg..' guibg='..colors.bg)
nvim_command('highlight BufferVisibleIndex guifg='..colors.fg..' guibg='..colors.bg)
nvim_command('highlight BufferVisibleMod guifg='..colors.fg..' guibg='..colors.bg)
nvim_command('highlight BufferVisibleSign guifg='..colors.magenta..' guibg='..colors.bg)
nvim_command('highlight BufferVisibleTarget guifg='..colors.fg..' guibg='..colors.bg)
