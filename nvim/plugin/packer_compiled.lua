-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/lap15870-local/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/lap15870-local/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/lap15870-local/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/lap15870-local/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/lap15870-local/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n�\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a�6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16�9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5�9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6�6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2�'\6\r\0X\a\1�'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequire�\1\1\0\6\0\v\0\0186\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\n�9\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0043\5\t\0=\5\n\4B\2\2\1K\0\1\0K\0\1\0\rpre_hook\0\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n�\1\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\4B\2\2\1K\0\1\0\npaths\1\0\0\1\2\0\0A~/.local/share/nvim/site/pack/packer/start/friendly-snippets\14lazy_load luasnip/loaders/from_vscode\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\no\0\0\6\2\3\0\14-\0\0\0009\0\0\0-\2\1\0+\3\2\0+\4\1\0+\5\2\0B\0\5\2-\1\0\0009\1\1\1\18\3\0\0'\4\2\0+\5\1\0B\1\4\1K\0\1\0\0\0\3�\vnormal\18nvim_feedkeys\27nvim_replace_termcodes�\2\1\3\b\1\16\0\28\18\5\0\0009\3\0\0'\6\1\0'\a\2\0B\3\4\2\18\5\3\0009\3\0\3'\6\3\0'\a\4\0B\3\4\0025\4\5\0=\1\6\4=\0\a\4\15\0\2\0X\5\6�5\5\t\0>\3\2\5>\2\3\0055\6\n\0>\6\4\5=\5\b\0045\5\v\0=\1\f\0053\6\r\0=\6\14\5=\4\15\0052\0\0�L\5\2\0\2�\topts\ron_press\0\bval\1\0\1\ttype\vbutton\1\0\2\fnoremap\2\vsilent\2\1\2\0\0\6n\vkeymap\rshortcut\ttext\1\0\6\ahl\27DiagnosticFloatingInfo\rposition\vcenter\19align_shortcut\nright\16hl_shortcut\fSpecial\nwidth\3\24\vcursor\3\5\r<leader>\bSPC\5\a%s\tgsub�\6\1\0\15\0(\2T6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0L�6\2\3\0009\2\4\0026\3\3\0009\3\5\0033\4\6\0005\5\a\0004\6\a\0\18\a\4\0'\t\b\0'\n\t\0'\v\n\0B\a\4\2>\a\1\6\18\a\4\0'\t\v\0'\n\f\0'\v\r\0B\a\4\2>\a\2\6\18\a\4\0'\t\14\0'\n\15\0'\v\16\0B\a\4\2>\a\3\6\18\a\4\0'\t\17\0'\n\18\0'\v\19\0B\a\4\2>\a\4\6\18\a\4\0'\t\20\0'\n\21\0'\v\22\0B\a\4\2>\a\5\6\18\a\4\0'\t\23\0'\n\24\0'\v\25\0B\a\4\0?\a\0\0=\6\26\0055\6\27\0=\6\28\0056\6\3\0009\6\4\0069\6\29\6B\6\1\2:\6\1\0069\6\30\6)\a\15\0005\b\31\0=\5 \b5\t$\0004\n\3\0005\v!\0006\f\"\0009\f#\f!\14\a\6\24\14\1\14B\f\2\2=\f\26\v>\v\1\n9\v \b>\v\2\n=\n%\t9\n&\1\18\f\t\0B\n\2\1\18\n\3\0'\f'\0B\n\2\0012\0\0�K\0\1\0K\0\1\0001autocmd FileType alpha setlocal nofoldenable\nsetup\vlayout\1\0\0\nfloor\tmath\1\0\1\ttype\fpadding\foptions\1\0\0\vheight\18nvim_list_uis\topts\1\0\2\fspacing\3\2\rposition\vcenter\bval\16<cmd>qa<CR>\14  Quit\6q9<cmd>e $HOME/.config/nvim/lua/default_config.lua<CR>\18  Settings\6s\18<cmd>ene!<CR>\18  New File\6n\28<cmd>NvimTreeToggle<CR>\27  Project structure\6o\30<cmd>FzfLua live_grep<CR>\19  Find Word\6f\26<cmd>FzfLua files<CR>\19  Find File\6p\1\0\1\ttype\ngroup\0\bcmd\bapi\bvim\nalpha\frequire\npcall\r����\4\1����\3\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\v\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\0046\5\a\0009\5\b\0059\5\t\5=\5\n\4B\2\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\2\22clear_empty_lines\1\tkeys\n<Esc>\1\2\0\0\ajj\nsetup\18better_escape\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nU\0\1\5\1\4\0\f9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\4�-\1\0\0009\1\3\0019\3\0\0D\1\2\0K\0\1\0\2�\16fnamemodify\t%.md\nmatch\tname�\4\1\0\b\0\r\0\0216\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\r�6\2\3\0009\2\4\0029\3\5\0015\5\v\0005\6\6\0005\a\a\0=\a\b\0063\a\t\0=\a\n\6=\6\f\5B\3\2\0012\0\0�K\0\1\0K\0\1\0\foptions\1\0\0\19name_formatter\0\14indicator\1\0\2\ticon\b▎\nstyle\ticon\1\0\22\rtab_size\3\16\22max_prefix_length\3\n\20max_name_length\3\14\20separator_style\tthin\25enforce_regular_tabs\1\23right_trunc_marker\b\fsort_by\aid\22left_trunc_marker\b\15close_icon\b\18modified_icon\b●\22buffer_close_icon\b\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\27always_show_bufferline\1\18close_command\16bdelete! %d\fnumbers\tnone\24persist_buffer_sort\2\24show_tab_indicators\2\20show_close_icon\1\28show_buffer_close_icons\1\22show_buffer_icons\2\16diagnostics\1\nsetup\afn\bvim\15bufferline\frequire\npcall\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n�\5\0\0\a\0\29\00046\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0004\6\0\0=\6\n\0054\6\0\0=\6\v\0054\6\0\0=\6\f\0054\6\0\0=\6\r\0054\6\0\0=\6\14\0054\6\0\0=\6\15\0054\6\0\0=\6\16\0054\6\0\0=\6\17\0054\6\0\0=\6\18\0054\6\0\0=\6\19\0054\6\0\0=\6\20\0054\6\0\0=\6\21\5=\5\22\0044\5\0\0=\5\23\0044\5\0\0=\5\24\0045\5\25\0=\5\26\4B\2\2\0016\2\1\0'\4\27\0B\2\2\0029\2\28\2B\2\1\1K\0\1\0\tinit\vcolors\17integrations\1\0\6\bcmp\2\vnotify\1\tmini\1\14telescope\2\rgitsigns\2\rnvimtree\2\22custom_highlights\20color_overrides\vstyles\14operators\ntypes\15properties\rbooleans\fnumbers\14variables\fstrings\rkeywords\14functions\nloops\17conditionals\rcomments\1\0\0\17dim_inactive\1\0\3\nshade\tdark\fenabled\1\15percentage\4��̙\3���\3\15background\1\0\2\nlight\nlatte\tdark\14macchiato\1\0\6\fflavour\14macchiato\fno_bold\1\14no_italic\1\16term_colors\1\23show_end_of_buffer\1\27transparent_background\1\nsetup\15catppuccin\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["close-buffers.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/opt/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\a\0\17\0\0236\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\b\0005\6\a\0=\6\t\5=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0=\6\15\5=\5\16\4B\2\2\1K\0\1\0\blsp\rsettings\1\0\4\27renameFilesWithClasses\vprompt\26completeFunctionCalls\2\14showTodos\1\19enableSnippets\2\ncolor\1\0\0\1\0\5\15background\1\fenabled\1\21virtual_text_str\5\17virtual_text\1\15foreground\1\16decorations\15statusline\1\0\0\1\0\2\vdevice\1\16app_version\1\aui\1\0\0\1\0\2\23notification_style\vnative\vborder\frounded\nsetup\18flutter-tools\frequire\npcall\0" },
    loaded = true,
    needs_bufread = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/opt/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\n�\16\0\0\t\0;\0R6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\f\0005\6\5\0005\a\6\0=\a\a\0065\a\b\0005\b\t\0=\b\n\a=\a\v\6=\6\n\0055\6\14\0005\a\r\0=\a\15\0065\a\16\0=\a\17\6=\6\18\0055\6\24\0005\a\20\0009\b\19\2=\b\21\a9\b\22\2=\b\23\a=\a\25\0065\a\27\0009\b\26\2=\b\21\a9\b\28\2=\b\23\a=\a\29\6=\6\30\0055\6\31\0=\6 \0055\6\"\0005\a!\0=\a#\6=\6$\0055\6%\0005\a'\0009\b&\2=\b(\a=\a\30\6=\6\25\0055\6)\0005\a*\0009\b&\2=\b(\a=\a\30\6=\6+\0055\6,\0005\a-\0009\b&\2=\b(\a=\a\30\6=\6\29\0055\6.\0005\a/\0009\b&\2=\b(\a=\a\30\0065\a1\0005\b0\0=\b2\a5\b3\0=\b4\a5\b5\0=\b6\a5\b7\0=\b8\a=\a9\6=\6:\5B\3\2\1K\0\1\0\16diagnostics\nsigns\tHint\1\0\2\vtexthl\19DiagnosticHint\ttext\b\tInfo\1\0\2\vtexthl\19DiagnosticInfo\ttext\b\tWarn\1\0\2\vtexthl\19DiagnosticWarn\ttext\b\nError\1\0\0\1\0\2\vtexthl\20DiagnosticError\ttext\b\1\0\0\1\0\a\15file_icons\2\17icon_padding\5\15diag_icons\2\rcwd_only\1\vprompt\20Diagnostics❯ \16color_icons\2\14git_icons\2\1\0\0\1\0\5\vprompt\16Buffers❯ \18sort_lastused\2\16color_icons\2\15file_icons\2\14git_icons\2\tgrep\1\0\0\1\0\v\14grep_optsV--binary-files=without-match --line-number --recursive --color=auto --perl-regexp\17input_prompt\17Grep For❯ \frg_glob\1\vprompt\vRg❯ \frg_optsV--column --line-number --no-heading --color=always --smart-case --max-columns=512\16no_header_i\1\14no_header\1\16color_icons\2\15file_icons\2\14git_icons\2\17multiprocess\2\fdefault\1\0\0\14file_edit\1\0\b\ffd_opts<--color=never --type f --hidden --follow --exclude .git\vprompt\14Files❯ \frg_opts7--color=never --files --hidden --follow -g '!.git'\14find_opts2-type f -not -path '*/\\.git/*' -printf '%P\\n'\16color_icons\2\15file_icons\2\14git_icons\2\17multiprocess\2\15fzf_colors\vheader\1\0\0\1\3\0\0\afg\fComment\rfzf_opts\1\0\5\v--info\vinline\v--ansi\5\r--border\tnone\r--layout\freverse\r--height\t100%\factions\fbuffers\15buf_vsplit\1\0\0\14buf_split\nfiles\1\0\0\vctrl-v\16file_vsplit\vctrl-s\1\0\0\15file_split\vkeymap\bfzf\1\0\2\vctrl-u\17half-page-up\vctrl-d\19half-page-down\fbuiltin\1\0\0\1\0\2\v<S-up>\20preview-page-up\r<S-down>\22preview-page-down\1\0\1\22file_icon_padding\5\fpreview\fwinopts\1\0\t\15cursorline\1\18cursorlineopt\tboth\15signcolumn\ano\19relativenumber\1\tlist\1\vnumber\2\15foldmethod\vmanual\15foldenable\1\17cursorcolumn\1\1\0\v\17flip_columns\3x\ndelay\0032\14scrollbar\1\vlayout\tflex\16title_align\vcenter\rvertical\rdown:45%\twrap\vnowrap\ntitle\1\15horizontal\14right:50%\vhidden\rnohidden\vborder\vborder\ahl\1\0\4\ntitle\vNormal\vnormal\vNormal\vsearch\14IncSearch\vborder\16FloatBorder\1\0\6\15fullscreen\1\vheight\4��̙\3���\3\nwidth\4����\t����\3\brow\4�̙�\6����\3\bcol\4\0����\3\vborder\frounded\nsetup\20fzf-lua.actions\ffzf-lua\frequire\npcall\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/opt/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nO\0\0\5\1\3\1\r-\0\0\0009\0\0\0-\2\0\0009\2\1\2'\4\2\0B\2\2\0A\0\0\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\5�\b%:t\vexpand\nempty\2>\0\0\3\1\1\0\v-\0\0\0009\0\0\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\5�\rwinwidth�\1\0\0\6\1\5\0\25-\0\0\0009\0\0\0'\2\1\0B\0\2\2-\1\0\0009\1\2\1'\3\3\0\18\4\0\0'\5\4\0&\4\5\4B\1\3\2\r\2\1\0X\2\v�\21\2\1\0)\3\0\0\1\3\2\0X\2\4�\21\2\1\0\21\3\0\0\0\2\3\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\5�\6;\t.git\ffinddir\n%:p:h\vexpand�\1\0\0\3\2\r\0\0285\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\a\1=\1\b\0-\1\0\0009\1\a\1=\1\t\0-\1\0\0009\1\n\1=\1\v\0-\1\1\0009\1\f\1B\1\1\0028\1\1\0\v\1\0\0X\2\2�-\2\0\0009\1\n\2L\1\2\0\4�\5�\tmode\6R\bred\6V\6v\rlavender\6c\npeach\6i\ngreen\6n\1\0\0\tblueI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\b�\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\b�\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\2\0\0\b\4\a\0 5\0\0\0005\1\1\0-\2\0\0'\4\2\0-\5\1\0B\5\1\2'\6\3\0-\a\2\0009\a\4\a&\4\a\4B\2\2\1-\2\3\0009\2\5\2B\2\1\0028\2\2\0-\3\3\0009\3\5\3B\3\1\0028\3\3\1\14\0\2\0X\4\4�-\4\3\0009\4\5\4B\4\1\2\18\2\4\0\14\0\3\0X\4\1�'\3\6\0\18\4\3\0\18\5\2\0&\4\5\4L\4\2\0\6�\t�\4�\5�\t \tmode\vmantle\f guibg=\27hi! LualineMode guifg=\1\0\a\6c\tגּ \6n\t \6R\t \6v\t﬏ \6V\t﬏ \6s\t \6i\t \1\0\a\6c\fCOMMAND\6n\vNORMAL\6R\fREPLACE\6v\vVISUAL\6V\vVISUAL\6s\fSNIPPET\6i\vINSERT\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\16\1\0\18\0v\0�\0016\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�2\0�9\4\4\0036\5\5\0009\5\6\0056\6\5\0009\6\a\0065\a\t\0003\b\b\0=\b\n\a3\b\v\0=\b\f\a3\b\r\0=\b\14\a5\b\29\0005\t\15\0005\n\23\0005\v\21\0005\f\17\0009\r\16\4=\r\18\f9\r\19\4=\r\20\f=\f\22\v=\v\24\n5\v\26\0005\f\25\0009\r\16\4=\r\18\f9\r\19\4=\r\20\f=\f\22\v=\v\27\n=\n\28\t=\t\30\b5\t\31\0004\n\0\0=\n \t4\n\0\0=\n!\t4\n\0\0=\n\"\t4\n\0\0=\n#\t4\n\0\0=\n$\t4\n\0\0=\n%\t=\t&\b5\t'\0004\n\0\0=\n \t4\n\0\0=\n!\t4\n\0\0=\n\"\t4\n\0\0=\n#\t4\n\0\0=\n$\t4\n\0\0=\n%\t=\t(\b3\t)\0003\n*\0003\v+\0\18\f\n\0005\14/\0003\15,\0>\15\1\0145\15.\0009\16-\4=\16\18\15=\0150\0145\0151\0=\0152\14B\f\2\1\18\f\n\0005\0144\0003\0153\0>\15\1\0145\0155\0=\0152\0149\15\f\a=\0156\14B\f\2\1\18\f\n\0005\0147\0009\15\n\a\15\0\15\0X\16\1�9\15\f\a=\0156\0145\0158\0=\0152\0145\0159\0009\16\16\4=\16\18\15=\0150\14B\f\2\1\18\f\n\0005\14:\0009\15\n\a=\0156\0145\15;\0=\0152\0145\15=\0009\16<\4=\16\18\15=\0150\14B\f\2\1\18\f\n\0005\14>\0009\15\f\a=\0156\0145\15?\0=\0152\0145\15A\0009\16@\4=\16\18\15=\0150\14B\f\2\1\18\f\n\0005\14B\0009\15\f\a=\0156\0145\15C\0=\15D\0145\15E\0=\0152\0145\15H\0005\16G\0009\17F\4=\17\18\16=\16I\0155\16K\0009\17J\4=\17\18\16=\16L\0155\16N\0009\17M\4=\17\18\16=\16O\15=\15P\14B\f\2\1\18\f\n\0005\14R\0003\15Q\0>\15\1\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14S\0005\15U\0009\16T\4=\16\18\15=\0150\0145\15V\0=\0152\14B\f\2\1\18\f\v\0005\14W\0005\15X\0=\15Y\0145\15Z\0=\15D\0145\15\\\0005\16[\0009\17M\4=\17\18\16=\16]\0155\16^\0009\17J\4=\17\18\16=\16_\0155\16`\0009\17T\4=\17\18\16=\16a\0155\16b\0009\17T\4=\17\18\16=\16c\15=\15d\0145\15e\0=\0152\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14f\0005\15g\0=\0152\14B\f\2\1\18\f\v\0005\14h\0006\15i\0009\15j\15=\15k\0145\15l\0009\16F\4=\16\18\15=\0150\0145\15m\0=\0152\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14n\0005\15o\0=\0152\0145\15p\0009\16J\4=\16\18\15=\0150\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14s\0003\15q\0>\15\1\0145\15r\0009\16-\4=\16\18\15=\0150\0145\15t\0=\0152\14B\f\2\0019\fu\1\18\14\b\0B\f\2\0012\0\0�K\0\1\0K\0\1\0\nsetup\1\0\1\nright\3\0\1\0\0\1\0\0\0\1\0\1\bgui\tbold\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rprogress\1\0\2\tleft\3\1\nright\3\1\1\0\1\bgui\tbold\bfmt\nupper\vstring\1\2\0\0\15o:encoding\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rfiletype\1\0\2\tleft\3\1\nright\3\1\22diagnostics_color\thint\1\0\0\tinfo\1\0\0\twarn\1\0\0\nerror\1\0\0\1\0\0\1\0\4\thint\t \twarn\t \tinfo\t \nerror\t \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\2\tleft\3\1\nright\3\1\1\0\1\bgui\tbold\tblue\1\2\0\0\rlocation\1\0\0\0\15diff_color\fremoved\1\0\0\bred\rmodified\1\0\0\npeach\nadded\1\0\0\1\0\0\ngreen\1\0\2\tleft\3\1\nright\3\1\fsymbols\1\0\3\fremoved\t \rmodified\b柳\nadded\t \1\2\0\0\tdiff\1\0\1\bgui\tbold\rlavender\1\0\2\tleft\3\1\nright\3\1\1\2\1\0\vbranch\ticon\b\1\0\1\bgui\tbold\rsurface2\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rfilesize\1\0\1\bgui\tbold\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rfilename\tcond\1\0\2\tleft\3\0\nright\3\1\1\0\1\ncolor\16LualineMode\0\fpadding\1\0\2\tleft\3\0\nright\3\1\ncolor\1\0\0\1\0\0\bsky\0\0\0\0\22inactive_sections\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\vmantle\afg\1\0\0\ttext\1\0\2\23section_separators\5\25component_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\bcmd\afn\bvim\vcolors\22colors.highlights\flualine\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nW\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\20mason-lspconfig\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    config = { "\27LJ\2\nI\0\2\6\0\2\0\a6\2\0\0'\4\1\0B\2\2\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\"mason-null-ls.automatic_setup\frequire5\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\rautopep8\rregister9\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\17clang_format\rregister5\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\rprettier\rregister3\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\vstylua\rregister�\2\1\0\t\0\21\0$6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�2\0\22�9\4\4\0015\6\6\0005\a\5\0=\a\a\6B\4\2\0019\4\b\0039\4\t\0049\5\n\0015\a\r\0003\b\v\0>\b\1\a3\b\f\0=\b\14\a3\b\15\0=\b\16\a3\b\17\0=\b\18\a3\b\19\0=\b\20\aB\5\2\0012\0\0�K\0\1\0K\0\1\0\vstylua\0\rprettier\0\17clang_format\0\rautopep8\1\0\0\0\0\19setup_handlers\15formatting\rbuiltins\21ensure_installed\1\0\0\1\5\0\0\rautopep8\17clang_format\rprettier\vstylua\nsetup\fnull-ls\18mason-null-ls\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\4B\2\2\1K\0\1\0\aui\1\0\0\nicons\1\0\3\24package_uninstalled\b✗\20package_pending\b\22package_installed\b\1\0\1\vborder\frounded\nsetup\nmason\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nK\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\fnull-ls\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\5\0\0\r\0\26\0+6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�K\0\1\0009\4\4\0015\6\6\0005\a\5\0=\a\a\0065\a\b\0005\b\t\0=\b\n\a6\b\v\0009\b\f\b'\n\r\0'\v\14\0'\f\15\0B\b\4\2=\b\16\a=\a\17\6B\4\2\0016\4\1\0'\6\18\0B\4\2\0029\5\19\3\18\a\5\0009\5\20\5'\b\21\0009\t\22\0045\v\24\0005\f\23\0=\f\25\vB\t\2\0A\5\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\bmap\n<M-e>\19highlight_grey\fComment\14highlight\vSearch\16check_comma\2\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fend_key\6$\voffset\3\0\21disable_filetype\1\0\b\27disable_in_visualblock\1\fmap_c_w\1\vmap_bs\2\22enable_afterquote\2\21disable_in_macro\1\21enable_moveright\2\rcheck_ts\2\30enable_check_bracket_line\1\1\2\0\0\20TelescopePrompt\nsetup\bcmp\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3�\tbody\15lsp_expand�\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\19�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\n�-\1\2\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\4\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\5�\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\tjump\rjumpable\21select_prev_item\fvisible�\1\0\2\4\1\a\0\18-\2\0\0009\3\0\0018\2\3\2=\2\0\0015\2\2\0009\3\3\0009\3\4\0038\2\3\2=\2\1\0015\2\6\0009\3\3\0009\3\4\0038\2\3\2\14\0\2\0X\3\1�)\2\0\0=\2\5\1L\1\2\0\4�\1\0\4\tpath\3\1\rnvim_lsp\3\0\vbuffer\3\1\fluasnip\3\1\bdup\tname\vsource\1\0\4\tpath\v(Path)\rnvim_lsp\n(LSP)\vbuffer\r(Buffer)\fluasnip\14(Snippet)\tmenu\tkind�\n\1\0\14\0004\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�2\0I�5\4\4\0003\5\5\0009\6\6\0015\b\n\0005\t\b\0003\n\a\0=\n\t\t=\t\v\b5\t\15\0005\n\r\0005\v\f\0=\v\14\n=\n\16\t5\n\18\0005\v\17\0=\v\14\n=\n\19\t=\t\20\b5\t\23\0009\n\21\0019\n\22\n)\f��B\n\2\2=\n\24\t9\n\21\0019\n\22\n)\f\4\0B\n\2\2=\n\25\t9\n\21\0019\n\26\nB\n\1\2=\n\27\t9\n\21\0019\n\28\n5\f\31\0009\r\29\0019\r\30\r=\r \fB\n\2\2=\n!\t9\n\21\0013\f\"\0005\r#\0B\n\3\2=\n$\t9\n\21\0013\f%\0005\r&\0B\n\3\2=\n'\t=\t\21\b5\t)\0005\n(\0=\n*\t3\n+\0=\n,\t=\t-\b4\t\6\0005\n.\0>\n\1\t5\n/\0>\n\2\t5\n0\0>\n\3\t5\n1\0>\n\4\t5\n2\0>\n\5\t=\t3\bB\6\2\0012\0\0�K\0\1\0K\0\1\0\fsources\1\0\1\tname\rnvim_lua\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\t<Up>\v<Down>\1\0\0\16scroll_docs\fmapping\vwindow\15completion\1\0\1\17winhighlightHNormal:Normal,FloatBorder:PmenuBorder,CursorLine:Visual,Search:None\1\t\0\0\b╭\b─\b╮\b│\b╯\b─\b╰\b│\18documentation\1\0\0\vborder\1\0\2\17winhighlightHNormal:Normal,FloatBorder:PmenuBorder,CursorLine:Visual,Search:None\14scrollbar\b║\1\t\0\0\b╭\b─\b╮\b│\b╯\b─\b╰\b│\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\1\0\"\nEvent\b\nValue\b\15EnumMember\b\tUnit\b塞\tEnum\b練\18TypeParameter\b\16Constructor\b\tText\b\vStruct\b\rConstant\b\vString\b\nColor\b\fSnippet\b\14Reference\b\fBoolean\b◩\fPackage\b\nArray\b\rProperty\b\nClass\b\rOperator\b\rVariable\b\vObject\b\vNumber\b\14Namespace\b\tNull\b\vModule\b\vMethod\b\fKeyword\b\bKey\b\14Interface\b練\rFunction\b\vFolder\b\tFile\b\nField\b\fluasnip\bcmp\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nJ\2\3\t\2\1\0\14\14\0\2\0X\3\1�4\2\0\0009\3\0\2\14\0\3\0X\4\1�-\3\0\0=\3\0\2-\3\1\0\18\5\0\0\18\6\1\0\18\a\2\0G\b\3\0C\3\3\0\3�\4�\vborder�\5\1\0\r\1\27\0008-\0\0\0009\0\0\0006\1\1\0009\1\2\1-\2\0\0009\2\4\2-\4\0\0009\4\5\0049\4\6\0045\5\a\0B\2\3\2=\2\3\0005\2\b\0006\3\t\0\18\5\2\0B\3\2\4H\6\t�'\b\n\0\18\t\6\0&\b\t\b9\t\v\1\18\v\b\0005\f\f\0=\a\r\f=\b\14\fB\t\3\1F\6\3\3R\6�\1274\3\t\0005\4\15\0>\4\1\0035\4\16\0>\4\2\0035\4\17\0>\4\3\0035\4\18\0>\4\4\0035\4\19\0>\4\5\0035\4\20\0>\4\6\0035\4\21\0>\4\a\0035\4\22\0>\4\b\0036\4\1\0009\4\23\0049\4\24\0049\4\25\0046\5\1\0009\5\23\0059\5\24\0053\6\26\0=\6\25\0052\0\0�K\0\1\0\0�\0\26open_floating_preview\tutil\blsp\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╰\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╯\16FloatBorder\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╮\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╭\16FloatBorder\vtexthl\ttext\1\0\0\16sign_define\19DiagnosticSign\npairs\1\0\4\tWarn\t \tHint\t \nError\t \tInfo\t \1\0\4\14underline\2\nsigns\2\17virtual_text\1\18severity_sort\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\afn\bvim\rhandlersA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_keymap\bapi\bvim�\a\1\2\n\0\27\0I3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\5\0'\b\6\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\t\0'\b\n\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\v\0'\b\f\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\19\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\0019\4\25\0+\5\1\0=\5\26\0042\0\0�K\0\1\0\24document_formatting\24server_capabilitiesA<cmd>lua vim.diagnostic.setloclist({ workspace = true })<CR>\n<C-w>-<cmd>lua vim.diagnostic.setloclist()<CR>\n<C-e>-<cmd>lua vim.diagnostic.open_float()<CR>\15<leader>gl+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ga&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>gr.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>gs%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>gk*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>gf*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>gd,<cmd>lua vim.diagnostic.goto_prev()<CR>\15<leader>gp,<cmd>lua vim.diagnostic.goto_next()<CR>\15<leader>gn\6n\1\0\2\fnoremap\2\vsilent\2\0�\2\0\0\4\1\r\0\24-\0\0\0009\0\0\0009\0\1\0B\0\1\0029\1\2\0009\1\3\0019\1\4\1+\2\2\0=\2\5\0019\1\2\0009\1\3\0019\1\4\0015\2\b\0005\3\a\0=\3\t\2=\2\6\0016\1\n\0'\3\v\0B\1\2\0029\1\f\1\18\3\0\0B\1\2\2\18\0\1\0L\0\2\0\0�\25default_capabilities\17cmp_nvim_lsp\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol�\2\1\0\16\0\18\0,6\0\0\0009\0\1\0003\1\2\0\18\2\1\0B\2\1\0013\2\3\0003\3\4\0006\4\5\0'\6\6\0B\4\2\0026\5\5\0'\a\a\0B\5\2\0026\6\b\0\18\b\5\0B\6\2\4X\t\23�6\v\5\0'\r\t\0B\v\2\0028\v\n\v9\v\n\v5\r\v\0=\2\f\r\18\14\3\0B\14\1\2=\14\r\r8\14\n\0049\14\14\14=\14\14\r8\14\n\0049\14\15\14=\14\15\r8\14\n\0049\14\16\14=\14\16\r8\14\n\0049\14\17\14=\14\17\rB\v\2\1E\t\3\3R\t�\1272\0\0�K\0\1\0\14filetypes\rroot_dir\rsettings\17init_options\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\vipairs\24plugins/lsp_servers\26plugins/lsp_languages\frequire\0\0\0\blsp\bvim\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\b\0\0\r\0%\1?6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\3\0009\2\4\0029\2\5\2B\2\1\2:\2\1\0029\2\6\0026\3\3\0009\3\4\0039\3\5\3B\3\1\2:\3\1\0039\3\a\3)\4d\0)\5 \0009\6\b\0015\b\t\0004\t\0\0=\t\n\b5\t\v\0005\n\f\0=\n\r\t=\t\14\b5\t\15\0005\n\16\0005\v\17\0=\v\r\n=\n\18\t=\t\19\b5\t\20\0004\n\0\0=\n\21\t=\t\22\b5\t\23\0004\n\0\0=\n\24\t=\t\25\b5\t\26\0005\n\27\0004\v\0\0=\v\28\n=\n\29\t5\n\30\0005\v\31\0=\4\6\v=\5\a\v!\f\5\3\24\f\0\f=\f \v!\f\4\2\24\f\0\f=\f!\v=\v\"\n=\n#\t=\t$\bB\6\2\1K\0\1\0\tview\nfloat\20open_win_config\bcol\brow\1\0\2\rrelative\veditor\vborder\frounded\1\0\2\23quit_on_focus_loss\2\venable\2\rmappings\tlist\1\0\1\16custom_only\1\1\0\4\21hide_root_folder\1\tside\btop preserve_window_proportions\2\nwidth\3#\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\2\rrenderer\19indent_markers\1\0\5\tnone\6 \vbottom\b─\titem\b│\tedge\b│\vcorner\b└\1\0\2\18inline_arrows\2\venable\2\1\0\a\25root_folder_modifier\a:~\27highlight_opened_files\tnone\14full_name\1\18highlight_git\1\16group_empty\1\17add_trailing\1\17indent_width\3\2\16diagnostics\nicons\1\0\4\thint\b\fwarning\b\tinfo\b\nerror\b\1\0\2\17show_on_dirs\2\venable\2\23ignore_ft_on_setup\1\0\6\23sync_root_with_cwd\1\18hijack_cursor\1\16open_on_tab\1\18open_on_setup\1\17hijack_netrw\1\18disable_netrw\2\nsetup\vheight\nwidth\18nvim_list_uis\bapi\bvim\14nvim-tree\frequire\npcall\1����\3\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\4\0\0\t\0\16\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\0\0006\4\1\0'\5\2\0B\2\3\3\14\0\2\0X\4\1�K\0\1\0009\4\3\0035\6\6\0005\a\4\0004\b\0\0=\b\5\a=\a\a\0065\a\b\0=\a\t\0065\a\n\0=\a\v\0065\a\f\0=\a\r\0065\a\14\0=\a\15\6B\4\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\19ignore_install\1\2\0\0\vphpdoc\21ensure_installed\1\"\0\0\tbash\6c\ncmake\fcomment\bcss\tdart\tdiff\15dockerfile\tfish\14gitignore\ago\fhaskell\thtml\15javascript\njsdoc\tjson\njson5\njsonc\vkotlin\blua\tmake\rmarkdown\vpython\nquery\nregex\trust\tscss\bsql\ttoml\btsx\15typescript\bvue\tyaml\14highlight\1\0\1\17auto_install\2\fdisable\1\0\2&additional_vim_regex_highlighting\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n�\t\0\0\v\0C\0|6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�K\0\1\0009\4\4\0039\5\5\0015\aA\0005\b\t\0005\t\6\0009\n\a\4=\n\b\t=\t\n\b5\t\v\0009\n\a\4=\n\b\t=\t\f\b5\t\r\0009\n\a\4=\n\b\t=\t\14\b5\t\15\0009\n\a\4=\n\b\t=\t\16\b5\t\17\0009\n\18\4=\n\b\t=\t\19\b5\t\20\0009\n\a\4=\n\b\t=\t\21\b5\t\22\0009\n\23\4=\n\b\t=\t\24\b5\t\25\0009\n\18\4=\n\b\t=\t\26\b5\t\27\0009\n\28\4=\n\b\t=\t\29\b5\t\30\0009\n\28\4=\n\b\t=\t\31\b5\t \0009\n\23\4=\n\b\t=\t!\b5\t\"\0009\n\23\4=\n\b\t=\t#\b5\t$\0009\n\18\4=\n\b\t=\t%\b5\t&\0009\n\a\4=\n\b\t=\t'\b5\t(\0009\n\a\4=\n\b\t=\t)\b5\t*\0009\n\a\4=\n\b\t=\t+\b5\t,\0009\n\a\4=\n\b\t=\t-\b5\t.\0009\n\28\4=\n\b\t=\t/\b5\t0\0009\n\23\4=\n\b\t=\t1\b5\t2\0009\n\a\4=\n\b\t=\t3\b5\t4\0009\n\a\4=\n\b\t=\t5\b5\t6\0009\n\18\4=\n\b\t=\t7\b5\t8\0009\n\23\4=\n\b\t=\t9\b5\t:\0009\n;\4=\n\b\t=\t<\b5\t=\0009\n\23\4=\n\b\t=\t>\b5\t?\0009\n\23\4=\n\b\t=\t@\b=\bB\aB\5\2\1K\0\1\0\roverride\1\0\0\bzip\1\0\2\ticon\b\tname\bzip\axz\1\0\2\ticon\b\tname\axz\bvue\ngreen\1\0\2\ticon\b﵂\tname\bvue\brpm\1\0\2\ticon\b\tname\brpm\arb\1\0\2\ticon\b\tname\arb\ats\1\0\2\ticon\b\tname\ats\ttoml\1\0\2\ticon\b\tname\ttoml\apy\1\0\2\ticon\b\tname\apy\bpng\1\0\2\ticon\b\tname\bpng\bout\1\0\2\ticon\b\tname\bout\bmp4\1\0\2\ticon\b\tname\bmp4\bmp3\1\0\2\ticon\b\tname\bmp3\blua\1\0\2\ticon\b\tname\blua\tlock\1\0\2\ticon\b\tname\tlock\akt\1\0\2\ticon\t󱈙\tname\akt\ajs\1\0\2\ticon\b\tname\ajs\bjpg\1\0\2\ticon\b\tname\bjpg\tjpeg\rlavender\1\0\2\ticon\b\tname\tjpeg\tjava\1\0\2\ticon\b\tname\tjava\thtml\npeach\1\0\2\ticon\b\tname\thtml\15Dockerfile\1\0\2\ticon\b\tname\15Dockerfile\bdeb\bred\1\0\2\ticon\b\tname\bdeb\bcss\1\0\2\ticon\b\tname\bcss\bcpp\1\0\2\ticon\b\tname\bcpp\acc\1\0\2\ticon\b\tname\acc\6c\1\0\0\ncolor\tblue\1\0\2\ticon\b\tname\6c\nsetup\vcolors\22colors.highlights\22nvim-web-devicons\frequire\npcall\0" },
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/lap15870-local/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim�\a\1\0\a\0\30\0I3\0\0\0005\1\1\0\18\2\0\0'\4\2\0'\5\3\0\18\6\1\0B\2\4\1\18\2\0\0'\4\4\0'\5\5\0\18\6\1\0B\2\4\1\18\2\0\0'\4\6\0'\5\a\0\18\6\1\0B\2\4\1\18\2\0\0'\4\b\0'\5\t\0\18\6\1\0B\2\4\1\18\2\0\0'\4\n\0'\5\v\0\18\6\1\0B\2\4\1\18\2\0\0'\4\f\0'\5\r\0\18\6\1\0B\2\4\1\18\2\0\0'\4\14\0'\5\15\0\18\6\1\0B\2\4\1\18\2\0\0'\4\16\0'\5\17\0\18\6\1\0B\2\4\1\18\2\0\0'\4\18\0'\5\19\0\18\6\1\0B\2\4\1\18\2\0\0'\4\20\0'\5\21\0\18\6\1\0B\2\4\1\18\2\0\0'\4\22\0'\5\23\0\18\6\1\0B\2\4\1\18\2\0\0'\4\24\0'\5\25\0\18\6\1\0B\2\4\1\18\2\0\0'\4\26\0'\5\27\0\18\6\1\0B\2\4\1\18\2\0\0'\4\28\0'\5\29\0\18\6\1\0B\2\4\1K\0\1\0%<cmd>BufferLineGoToBuffer 10<CR>\15<leader>10$<cmd>BufferLineGoToBuffer 9<CR>\14<leader>9$<cmd>BufferLineGoToBuffer 8<CR>\14<leader>8$<cmd>BufferLineGoToBuffer 7<CR>\14<leader>7$<cmd>BufferLineGoToBuffer 6<CR>\14<leader>6$<cmd>BufferLineGoToBuffer 5<CR>\14<leader>5$<cmd>BufferLineGoToBuffer 4<CR>\14<leader>4$<cmd>BufferLineGoToBuffer 3<CR>\14<leader>3$<cmd>BufferLineGoToBuffer 2<CR>\14<leader>2$<cmd>BufferLineGoToBuffer 1<CR>\14<leader>1 <cmd>BufferLineMovePrev<CR>\14<leader>< <cmd>BufferLineMoveNext<CR>\14<leader>>!<cmd>BufferLineCyclePrev<CR>\20<leader><S-Tab>!<cmd>BufferLineCycleNext<CR>\18<leader><Tab>\1\0\2\fnoremap\2\vsilent\2\0\0", "setup", "bufferline.nvim")
time([[Setup for bufferline.nvim]], false)
time([[packadd for bufferline.nvim]], true)
vim.cmd [[packadd bufferline.nvim]]
time([[packadd for bufferline.nvim]], false)
-- Setup for: flutter-tools.nvim
time([[Setup for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim�\5\1\0\a\0\20\00005\0\0\0003\1\1\0\18\2\1\0'\4\2\0'\5\3\0\18\6\0\0B\2\4\1\18\2\1\0'\4\4\0'\5\5\0\18\6\0\0B\2\4\1\18\2\1\0'\4\6\0'\5\a\0\18\6\0\0B\2\4\1\18\2\1\0'\4\b\0'\5\t\0\18\6\0\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0\18\6\0\0B\2\4\1\18\2\1\0'\4\f\0'\5\r\0\18\6\0\0B\2\4\1\18\2\1\0'\4\14\0'\5\15\0\18\6\0\0B\2\4\1\18\2\1\0'\4\16\0'\5\17\0\18\6\0\0B\2\4\1\18\2\1\0'\4\18\0'\5\19\0\18\6\0\0B\2\4\1K\0\1\0-<cmd>lua vim.diagnostic.open_float()<CR>\15<leader>gl+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ga,<cmd>lua vim.diagnostic.goto_prev()<CR>\15<leader>gp,<cmd>lua vim.diagnostic.goto_next()<CR>\15<leader>gn&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>gr.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>gs%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>gk*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>gf*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>gd\0\1\0\2\fnoremap\2\vsilent\2\0", "setup", "flutter-tools.nvim")
time([[Setup for flutter-tools.nvim]], false)
time([[packadd for flutter-tools.nvim]], true)
vim.cmd [[packadd flutter-tools.nvim]]
time([[packadd for flutter-tools.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim�\2\1\0\b\0\14\0\0243\0\0\0006\1\1\0009\1\2\0015\2\3\0\18\3\0\0'\5\4\0'\6\5\0\18\a\2\0B\3\4\1\18\3\0\0'\5\6\0'\6\a\0\18\a\2\0B\3\4\1\18\3\0\0'\5\b\0'\6\t\0\18\a\2\0B\3\4\0015\3\v\0=\3\n\0015\3\r\0=\3\f\1K\0\1\0\1\0\3\rMAKEFILE\3\1\rMakefile\3\1\14README.md\3\1\27vim_tree_special_files\1\2\0\0\nalpha\29nvim_tree_auto_ignore_ft\30<cmd>NvimTreeFindFile<CR>\15<leader>nf\29<cmd>NvimTreeRefresh<CR>\14<leader>r\28<cmd>NvimTreeToggle<CR>\n<C-n>\1\0\2\fnoremap\2\vsilent\2\6g\bvim\0\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Setup for: close-buffers.nvim
time([[Setup for close-buffers.nvim]], true)
try_loadstring("\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim_\1\0\a\0\4\0\b3\0\0\0005\1\1\0\18\2\0\0'\4\2\0'\5\3\0\18\6\1\0B\2\4\1K\0\1\0\28<cmd>BWipeout other<CR>\15<leader>cb\1\0\2\fnoremap\2\vsilent\2\0\0", "setup", "close-buffers.nvim")
time([[Setup for close-buffers.nvim]], false)
time([[packadd for close-buffers.nvim]], true)
vim.cmd [[packadd close-buffers.nvim]]
time([[packadd for close-buffers.nvim]], false)
-- Setup for: fzf-lua
time([[Setup for fzf-lua]], true)
try_loadstring("\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim�\2\1\0\a\0\f\0\0283\0\0\0005\1\1\0\18\2\0\0'\4\2\0'\5\3\0\18\6\1\0B\2\4\1\18\2\0\0'\4\4\0'\5\5\0\18\6\1\0B\2\4\1\18\2\0\0'\4\6\0'\5\a\0\18\6\1\0B\2\4\1\18\2\0\0'\4\b\0'\5\t\0\18\6\1\0B\2\4\1\18\2\0\0'\4\n\0'\5\v\0\18\6\1\0B\2\4\1K\0\1\0*<cmd>FzfLua diagnostics_workspace<CR>\n<C-w>)<cmd>FzfLua diagnostics_document<CR>\n<C-e>\28<cmd>FzfLua buffers<CR>\n<C-b>\30<cmd>FzfLua live_grep<CR>\n<C-f>\26<cmd>FzfLua files<CR>\n<C-p>\1\0\2\fnoremap\2\vsilent\2\0\0", "setup", "fzf-lua")
time([[Setup for fzf-lua]], false)
time([[packadd for fzf-lua]], true)
vim.cmd [[packadd fzf-lua]]
time([[packadd for fzf-lua]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\n<C-y>\26user_emmet_leader_key\6g\bvim\0", "setup", "emmet-vim")
time([[Setup for emmet-vim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\a�6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16�9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5�9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6�6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2�'\6\r\0X\a\1�'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequire�\1\1\0\6\0\v\0\0186\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\n�9\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0043\5\t\0=\5\n\4B\2\2\1K\0\1\0K\0\1\0\rpre_hook\0\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\npcall\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\a\0\17\0\0236\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\b\0005\6\a\0=\6\t\5=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0=\6\15\5=\5\16\4B\2\2\1K\0\1\0\blsp\rsettings\1\0\4\27renameFilesWithClasses\vprompt\26completeFunctionCalls\2\14showTodos\1\19enableSnippets\2\ncolor\1\0\0\1\0\5\15background\1\fenabled\1\21virtual_text_str\5\17virtual_text\1\15foreground\1\16decorations\15statusline\1\0\0\1\0\2\vdevice\1\16app_version\1\aui\1\0\0\1\0\2\23notification_style\vnative\vborder\frounded\nsetup\18flutter-tools\frequire\npcall\0", "config", "flutter-tools.nvim")
time([[Config for flutter-tools.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\v\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\0046\5\a\0009\5\b\0059\5\t\5=\5\n\4B\2\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\2\22clear_empty_lines\1\tkeys\n<Esc>\1\2\0\0\ajj\nsetup\18better_escape\frequire\npcall\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nJ\2\3\t\2\1\0\14\14\0\2\0X\3\1�4\2\0\0009\3\0\2\14\0\3\0X\4\1�-\3\0\0=\3\0\2-\3\1\0\18\5\0\0\18\6\1\0\18\a\2\0G\b\3\0C\3\3\0\3�\4�\vborder�\5\1\0\r\1\27\0008-\0\0\0009\0\0\0006\1\1\0009\1\2\1-\2\0\0009\2\4\2-\4\0\0009\4\5\0049\4\6\0045\5\a\0B\2\3\2=\2\3\0005\2\b\0006\3\t\0\18\5\2\0B\3\2\4H\6\t�'\b\n\0\18\t\6\0&\b\t\b9\t\v\1\18\v\b\0005\f\f\0=\a\r\f=\b\14\fB\t\3\1F\6\3\3R\6�\1274\3\t\0005\4\15\0>\4\1\0035\4\16\0>\4\2\0035\4\17\0>\4\3\0035\4\18\0>\4\4\0035\4\19\0>\4\5\0035\4\20\0>\4\6\0035\4\21\0>\4\a\0035\4\22\0>\4\b\0036\4\1\0009\4\23\0049\4\24\0049\4\25\0046\5\1\0009\5\23\0059\5\24\0053\6\26\0=\6\25\0052\0\0�K\0\1\0\0�\0\26open_floating_preview\tutil\blsp\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╰\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╯\16FloatBorder\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╮\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╭\16FloatBorder\vtexthl\ttext\1\0\0\16sign_define\19DiagnosticSign\npairs\1\0\4\tWarn\t \tHint\t \nError\t \tInfo\t \1\0\4\14underline\2\nsigns\2\17virtual_text\1\18severity_sort\1\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\afn\bvim\rhandlersA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_keymap\bapi\bvim�\a\1\2\n\0\27\0I3\2\0\0005\3\1\0\18\4\2\0'\6\2\0'\a\3\0'\b\4\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\5\0'\b\6\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\a\0'\b\b\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\t\0'\b\n\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\v\0'\b\f\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\r\0'\b\14\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\15\0'\b\16\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\19\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\1\18\4\2\0'\6\2\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\0019\4\25\0+\5\1\0=\5\26\0042\0\0�K\0\1\0\24document_formatting\24server_capabilitiesA<cmd>lua vim.diagnostic.setloclist({ workspace = true })<CR>\n<C-w>-<cmd>lua vim.diagnostic.setloclist()<CR>\n<C-e>-<cmd>lua vim.diagnostic.open_float()<CR>\15<leader>gl+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ga&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>gr.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>gs%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>gk*<cmd>lua vim.lsp.buf.references()<CR>\15<leader>gf*<cmd>lua vim.lsp.buf.definition()<CR>\15<leader>gd,<cmd>lua vim.diagnostic.goto_prev()<CR>\15<leader>gp,<cmd>lua vim.diagnostic.goto_next()<CR>\15<leader>gn\6n\1\0\2\fnoremap\2\vsilent\2\0�\2\0\0\4\1\r\0\24-\0\0\0009\0\0\0009\0\1\0B\0\1\0029\1\2\0009\1\3\0019\1\4\1+\2\2\0=\2\5\0019\1\2\0009\1\3\0019\1\4\0015\2\b\0005\3\a\0=\3\t\2=\2\6\0016\1\n\0'\3\v\0B\1\2\0029\1\f\1\18\3\0\0B\1\2\2\18\0\1\0L\0\2\0\0�\25default_capabilities\17cmp_nvim_lsp\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol�\2\1\0\16\0\18\0,6\0\0\0009\0\1\0003\1\2\0\18\2\1\0B\2\1\0013\2\3\0003\3\4\0006\4\5\0'\6\6\0B\4\2\0026\5\5\0'\a\a\0B\5\2\0026\6\b\0\18\b\5\0B\6\2\4X\t\23�6\v\5\0'\r\t\0B\v\2\0028\v\n\v9\v\n\v5\r\v\0=\2\f\r\18\14\3\0B\14\1\2=\14\r\r8\14\n\0049\14\14\14=\14\14\r8\14\n\0049\14\15\14=\14\15\r8\14\n\0049\14\16\14=\14\16\r8\14\n\0049\14\17\14=\14\17\rB\v\2\1E\t\3\3R\t�\1272\0\0�K\0\1\0\14filetypes\rroot_dir\rsettings\17init_options\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\vipairs\24plugins/lsp_servers\26plugins/lsp_languages\frequire\0\0\0\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\b\0\0\r\0%\1?6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\3\0009\2\4\0029\2\5\2B\2\1\2:\2\1\0029\2\6\0026\3\3\0009\3\4\0039\3\5\3B\3\1\2:\3\1\0039\3\a\3)\4d\0)\5 \0009\6\b\0015\b\t\0004\t\0\0=\t\n\b5\t\v\0005\n\f\0=\n\r\t=\t\14\b5\t\15\0005\n\16\0005\v\17\0=\v\r\n=\n\18\t=\t\19\b5\t\20\0004\n\0\0=\n\21\t=\t\22\b5\t\23\0004\n\0\0=\n\24\t=\t\25\b5\t\26\0005\n\27\0004\v\0\0=\v\28\n=\n\29\t5\n\30\0005\v\31\0=\4\6\v=\5\a\v!\f\5\3\24\f\0\f=\f \v!\f\4\2\24\f\0\f=\f!\v=\v\"\n=\n#\t=\t$\bB\6\2\1K\0\1\0\tview\nfloat\20open_win_config\bcol\brow\1\0\2\rrelative\veditor\vborder\frounded\1\0\2\23quit_on_focus_loss\2\venable\2\rmappings\tlist\1\0\1\16custom_only\1\1\0\4\21hide_root_folder\1\tside\btop preserve_window_proportions\2\nwidth\3#\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\2\rrenderer\19indent_markers\1\0\5\tnone\6 \vbottom\b─\titem\b│\tedge\b│\vcorner\b└\1\0\2\18inline_arrows\2\venable\2\1\0\a\25root_folder_modifier\a:~\27highlight_opened_files\tnone\14full_name\1\18highlight_git\1\16group_empty\1\17add_trailing\1\17indent_width\3\2\16diagnostics\nicons\1\0\4\thint\b\fwarning\b\tinfo\b\nerror\b\1\0\2\17show_on_dirs\2\venable\2\23ignore_ft_on_setup\1\0\6\23sync_root_with_cwd\1\18hijack_cursor\1\16open_on_tab\1\18open_on_setup\1\17hijack_netrw\1\18disable_netrw\2\nsetup\vheight\nwidth\18nvim_list_uis\bapi\bvim\14nvim-tree\frequire\npcall\1����\3\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\5\1\3\1\r-\0\0\0009\0\0\0-\2\0\0009\2\1\2'\4\2\0B\2\2\0A\0\0\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\5�\b%:t\vexpand\nempty\2>\0\0\3\1\1\0\v-\0\0\0009\0\0\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\5�\rwinwidth�\1\0\0\6\1\5\0\25-\0\0\0009\0\0\0'\2\1\0B\0\2\2-\1\0\0009\1\2\1'\3\3\0\18\4\0\0'\5\4\0&\4\5\4B\1\3\2\r\2\1\0X\2\v�\21\2\1\0)\3\0\0\1\3\2\0X\2\4�\21\2\1\0\21\3\0\0\0\2\3\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\5�\6;\t.git\ffinddir\n%:p:h\vexpand�\1\0\0\3\2\r\0\0285\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\a\1=\1\b\0-\1\0\0009\1\a\1=\1\t\0-\1\0\0009\1\n\1=\1\v\0-\1\1\0009\1\f\1B\1\1\0028\1\1\0\v\1\0\0X\2\2�-\2\0\0009\1\n\2L\1\2\0\4�\5�\tmode\6R\bred\6V\6v\rlavender\6c\npeach\6i\ngreen\6n\1\0\0\tblueI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\b�\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\b�\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\2\0\0\b\4\a\0 5\0\0\0005\1\1\0-\2\0\0'\4\2\0-\5\1\0B\5\1\2'\6\3\0-\a\2\0009\a\4\a&\4\a\4B\2\2\1-\2\3\0009\2\5\2B\2\1\0028\2\2\0-\3\3\0009\3\5\3B\3\1\0028\3\3\1\14\0\2\0X\4\4�-\4\3\0009\4\5\4B\4\1\2\18\2\4\0\14\0\3\0X\4\1�'\3\6\0\18\4\3\0\18\5\2\0&\4\5\4L\4\2\0\6�\t�\4�\5�\t \tmode\vmantle\f guibg=\27hi! LualineMode guifg=\1\0\a\6c\tגּ \6n\t \6R\t \6v\t﬏ \6V\t﬏ \6s\t \6i\t \1\0\a\6c\fCOMMAND\6n\vNORMAL\6R\fREPLACE\6v\vVISUAL\6V\vVISUAL\6s\fSNIPPET\6i\vINSERT\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b▊�\16\1\0\18\0v\0�\0016\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�2\0�9\4\4\0036\5\5\0009\5\6\0056\6\5\0009\6\a\0065\a\t\0003\b\b\0=\b\n\a3\b\v\0=\b\f\a3\b\r\0=\b\14\a5\b\29\0005\t\15\0005\n\23\0005\v\21\0005\f\17\0009\r\16\4=\r\18\f9\r\19\4=\r\20\f=\f\22\v=\v\24\n5\v\26\0005\f\25\0009\r\16\4=\r\18\f9\r\19\4=\r\20\f=\f\22\v=\v\27\n=\n\28\t=\t\30\b5\t\31\0004\n\0\0=\n \t4\n\0\0=\n!\t4\n\0\0=\n\"\t4\n\0\0=\n#\t4\n\0\0=\n$\t4\n\0\0=\n%\t=\t&\b5\t'\0004\n\0\0=\n \t4\n\0\0=\n!\t4\n\0\0=\n\"\t4\n\0\0=\n#\t4\n\0\0=\n$\t4\n\0\0=\n%\t=\t(\b3\t)\0003\n*\0003\v+\0\18\f\n\0005\14/\0003\15,\0>\15\1\0145\15.\0009\16-\4=\16\18\15=\0150\0145\0151\0=\0152\14B\f\2\1\18\f\n\0005\0144\0003\0153\0>\15\1\0145\0155\0=\0152\0149\15\f\a=\0156\14B\f\2\1\18\f\n\0005\0147\0009\15\n\a\15\0\15\0X\16\1�9\15\f\a=\0156\0145\0158\0=\0152\0145\0159\0009\16\16\4=\16\18\15=\0150\14B\f\2\1\18\f\n\0005\14:\0009\15\n\a=\0156\0145\15;\0=\0152\0145\15=\0009\16<\4=\16\18\15=\0150\14B\f\2\1\18\f\n\0005\14>\0009\15\f\a=\0156\0145\15?\0=\0152\0145\15A\0009\16@\4=\16\18\15=\0150\14B\f\2\1\18\f\n\0005\14B\0009\15\f\a=\0156\0145\15C\0=\15D\0145\15E\0=\0152\0145\15H\0005\16G\0009\17F\4=\17\18\16=\16I\0155\16K\0009\17J\4=\17\18\16=\16L\0155\16N\0009\17M\4=\17\18\16=\16O\15=\15P\14B\f\2\1\18\f\n\0005\14R\0003\15Q\0>\15\1\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14S\0005\15U\0009\16T\4=\16\18\15=\0150\0145\15V\0=\0152\14B\f\2\1\18\f\v\0005\14W\0005\15X\0=\15Y\0145\15Z\0=\15D\0145\15\\\0005\16[\0009\17M\4=\17\18\16=\16]\0155\16^\0009\17J\4=\17\18\16=\16_\0155\16`\0009\17T\4=\17\18\16=\16a\0155\16b\0009\17T\4=\17\18\16=\16c\15=\15d\0145\15e\0=\0152\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14f\0005\15g\0=\0152\14B\f\2\1\18\f\v\0005\14h\0006\15i\0009\15j\15=\15k\0145\15l\0009\16F\4=\16\18\15=\0150\0145\15m\0=\0152\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14n\0005\15o\0=\0152\0145\15p\0009\16J\4=\16\18\15=\0150\0149\15\f\a=\0156\14B\f\2\1\18\f\v\0005\14s\0003\15q\0>\15\1\0145\15r\0009\16-\4=\16\18\15=\0150\0145\15t\0=\0152\14B\f\2\0019\fu\1\18\14\b\0B\f\2\0012\0\0�K\0\1\0K\0\1\0\nsetup\1\0\1\nright\3\0\1\0\0\1\0\0\0\1\0\1\bgui\tbold\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rprogress\1\0\2\tleft\3\1\nright\3\1\1\0\1\bgui\tbold\bfmt\nupper\vstring\1\2\0\0\15o:encoding\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rfiletype\1\0\2\tleft\3\1\nright\3\1\22diagnostics_color\thint\1\0\0\tinfo\1\0\0\twarn\1\0\0\nerror\1\0\0\1\0\0\1\0\4\thint\t \twarn\t \tinfo\t \nerror\t \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\2\tleft\3\1\nright\3\1\1\0\1\bgui\tbold\tblue\1\2\0\0\rlocation\1\0\0\0\15diff_color\fremoved\1\0\0\bred\rmodified\1\0\0\npeach\nadded\1\0\0\1\0\0\ngreen\1\0\2\tleft\3\1\nright\3\1\fsymbols\1\0\3\fremoved\t \rmodified\b柳\nadded\t \1\2\0\0\tdiff\1\0\1\bgui\tbold\rlavender\1\0\2\tleft\3\1\nright\3\1\1\2\1\0\vbranch\ticon\b\1\0\1\bgui\tbold\rsurface2\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rfilesize\1\0\1\bgui\tbold\1\0\2\tleft\3\1\nright\3\1\1\2\0\0\rfilename\tcond\1\0\2\tleft\3\0\nright\3\1\1\0\1\ncolor\16LualineMode\0\fpadding\1\0\2\tleft\3\0\nright\3\1\ncolor\1\0\0\1\0\0\bsky\0\0\0\0\22inactive_sections\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\vmantle\afg\1\0\0\ttext\1\0\2\23section_separators\5\25component_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\bcmd\afn\bvim\vcolors\22colors.highlights\flualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\4\0\0\t\0\16\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\0\0006\4\1\0'\5\2\0B\2\3\3\14\0\2\0X\4\1�K\0\1\0009\4\3\0035\6\6\0005\a\4\0004\b\0\0=\b\5\a=\a\a\0065\a\b\0=\a\t\0065\a\n\0=\a\v\0065\a\f\0=\a\r\0065\a\14\0=\a\15\6B\4\2\1K\0\1\0\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\19ignore_install\1\2\0\0\vphpdoc\21ensure_installed\1\"\0\0\tbash\6c\ncmake\fcomment\bcss\tdart\tdiff\15dockerfile\tfish\14gitignore\ago\fhaskell\thtml\15javascript\njsdoc\tjson\njson5\njsonc\vkotlin\blua\tmake\rmarkdown\vpython\nquery\nregex\trust\tscss\bsql\ttoml\btsx\15typescript\bvue\tyaml\14highlight\1\0\1\17auto_install\2\fdisable\1\0\2&additional_vim_regex_highlighting\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\20mason-lspconfig\frequire\npcall\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: mason-null-ls.nvim
time([[Config for mason-null-ls.nvim]], true)
try_loadstring("\27LJ\2\nI\0\2\6\0\2\0\a6\2\0\0'\4\1\0B\2\2\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\"mason-null-ls.automatic_setup\frequire5\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\rautopep8\rregister9\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\17clang_format\rregister5\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\rprettier\rregister3\0\2\5\2\2\0\6-\2\0\0009\2\0\2-\4\1\0009\4\1\4B\2\2\1K\0\1\0\3�\4�\vstylua\rregister�\2\1\0\t\0\21\0$6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�2\0\22�9\4\4\0015\6\6\0005\a\5\0=\a\a\6B\4\2\0019\4\b\0039\4\t\0049\5\n\0015\a\r\0003\b\v\0>\b\1\a3\b\f\0=\b\14\a3\b\15\0=\b\16\a3\b\17\0=\b\18\a3\b\19\0=\b\20\aB\5\2\0012\0\0�K\0\1\0K\0\1\0\vstylua\0\rprettier\0\17clang_format\0\rautopep8\1\0\0\0\0\19setup_handlers\15formatting\rbuiltins\21ensure_installed\1\0\0\1\5\0\0\rautopep8\17clang_format\rprettier\vstylua\nsetup\fnull-ls\18mason-null-ls\frequire\npcall\0", "config", "mason-null-ls.nvim")
time([[Config for mason-null-ls.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\no\0\0\6\2\3\0\14-\0\0\0009\0\0\0-\2\1\0+\3\2\0+\4\1\0+\5\2\0B\0\5\2-\1\0\0009\1\1\1\18\3\0\0'\4\2\0+\5\1\0B\1\4\1K\0\1\0\0\0\3�\vnormal\18nvim_feedkeys\27nvim_replace_termcodes�\2\1\3\b\1\16\0\28\18\5\0\0009\3\0\0'\6\1\0'\a\2\0B\3\4\2\18\5\3\0009\3\0\3'\6\3\0'\a\4\0B\3\4\0025\4\5\0=\1\6\4=\0\a\4\15\0\2\0X\5\6�5\5\t\0>\3\2\5>\2\3\0055\6\n\0>\6\4\5=\5\b\0045\5\v\0=\1\f\0053\6\r\0=\6\14\5=\4\15\0052\0\0�L\5\2\0\2�\topts\ron_press\0\bval\1\0\1\ttype\vbutton\1\0\2\fnoremap\2\vsilent\2\1\2\0\0\6n\vkeymap\rshortcut\ttext\1\0\6\ahl\27DiagnosticFloatingInfo\rposition\vcenter\19align_shortcut\nright\16hl_shortcut\fSpecial\nwidth\3\24\vcursor\3\5\r<leader>\bSPC\5\a%s\tgsub�\6\1\0\15\0(\2T6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0L�6\2\3\0009\2\4\0026\3\3\0009\3\5\0033\4\6\0005\5\a\0004\6\a\0\18\a\4\0'\t\b\0'\n\t\0'\v\n\0B\a\4\2>\a\1\6\18\a\4\0'\t\v\0'\n\f\0'\v\r\0B\a\4\2>\a\2\6\18\a\4\0'\t\14\0'\n\15\0'\v\16\0B\a\4\2>\a\3\6\18\a\4\0'\t\17\0'\n\18\0'\v\19\0B\a\4\2>\a\4\6\18\a\4\0'\t\20\0'\n\21\0'\v\22\0B\a\4\2>\a\5\6\18\a\4\0'\t\23\0'\n\24\0'\v\25\0B\a\4\0?\a\0\0=\6\26\0055\6\27\0=\6\28\0056\6\3\0009\6\4\0069\6\29\6B\6\1\2:\6\1\0069\6\30\6)\a\15\0005\b\31\0=\5 \b5\t$\0004\n\3\0005\v!\0006\f\"\0009\f#\f!\14\a\6\24\14\1\14B\f\2\2=\f\26\v>\v\1\n9\v \b>\v\2\n=\n%\t9\n&\1\18\f\t\0B\n\2\1\18\n\3\0'\f'\0B\n\2\0012\0\0�K\0\1\0K\0\1\0001autocmd FileType alpha setlocal nofoldenable\nsetup\vlayout\1\0\0\nfloor\tmath\1\0\1\ttype\fpadding\foptions\1\0\0\vheight\18nvim_list_uis\topts\1\0\2\fspacing\3\2\rposition\vcenter\bval\16<cmd>qa<CR>\14  Quit\6q9<cmd>e $HOME/.config/nvim/lua/default_config.lua<CR>\18  Settings\6s\18<cmd>ene!<CR>\18  New File\6n\28<cmd>NvimTreeToggle<CR>\27  Project structure\6o\30<cmd>FzfLua live_grep<CR>\19  Find Word\6f\26<cmd>FzfLua files<CR>\19  Find File\6p\1\0\1\ttype\ngroup\0\bcmd\bapi\bvim\nalpha\frequire\npcall\r����\4\1����\3\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n�\t\0\0\v\0C\0|6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�K\0\1\0009\4\4\0039\5\5\0015\aA\0005\b\t\0005\t\6\0009\n\a\4=\n\b\t=\t\n\b5\t\v\0009\n\a\4=\n\b\t=\t\f\b5\t\r\0009\n\a\4=\n\b\t=\t\14\b5\t\15\0009\n\a\4=\n\b\t=\t\16\b5\t\17\0009\n\18\4=\n\b\t=\t\19\b5\t\20\0009\n\a\4=\n\b\t=\t\21\b5\t\22\0009\n\23\4=\n\b\t=\t\24\b5\t\25\0009\n\18\4=\n\b\t=\t\26\b5\t\27\0009\n\28\4=\n\b\t=\t\29\b5\t\30\0009\n\28\4=\n\b\t=\t\31\b5\t \0009\n\23\4=\n\b\t=\t!\b5\t\"\0009\n\23\4=\n\b\t=\t#\b5\t$\0009\n\18\4=\n\b\t=\t%\b5\t&\0009\n\a\4=\n\b\t=\t'\b5\t(\0009\n\a\4=\n\b\t=\t)\b5\t*\0009\n\a\4=\n\b\t=\t+\b5\t,\0009\n\a\4=\n\b\t=\t-\b5\t.\0009\n\28\4=\n\b\t=\t/\b5\t0\0009\n\23\4=\n\b\t=\t1\b5\t2\0009\n\a\4=\n\b\t=\t3\b5\t4\0009\n\a\4=\n\b\t=\t5\b5\t6\0009\n\18\4=\n\b\t=\t7\b5\t8\0009\n\23\4=\n\b\t=\t9\b5\t:\0009\n;\4=\n\b\t=\t<\b5\t=\0009\n\23\4=\n\b\t=\t>\b5\t?\0009\n\23\4=\n\b\t=\t@\b=\bB\aB\5\2\1K\0\1\0\roverride\1\0\0\bzip\1\0\2\ticon\b\tname\bzip\axz\1\0\2\ticon\b\tname\axz\bvue\ngreen\1\0\2\ticon\b﵂\tname\bvue\brpm\1\0\2\ticon\b\tname\brpm\arb\1\0\2\ticon\b\tname\arb\ats\1\0\2\ticon\b\tname\ats\ttoml\1\0\2\ticon\b\tname\ttoml\apy\1\0\2\ticon\b\tname\apy\bpng\1\0\2\ticon\b\tname\bpng\bout\1\0\2\ticon\b\tname\bout\bmp4\1\0\2\ticon\b\tname\bmp4\bmp3\1\0\2\ticon\b\tname\bmp3\blua\1\0\2\ticon\b\tname\blua\tlock\1\0\2\ticon\b\tname\tlock\akt\1\0\2\ticon\t󱈙\tname\akt\ajs\1\0\2\ticon\b\tname\ajs\bjpg\1\0\2\ticon\b\tname\bjpg\tjpeg\rlavender\1\0\2\ticon\b\tname\tjpeg\tjava\1\0\2\ticon\b\tname\tjava\thtml\npeach\1\0\2\ticon\b\tname\thtml\15Dockerfile\1\0\2\ticon\b\tname\15Dockerfile\bdeb\bred\1\0\2\ticon\b\tname\bdeb\bcss\1\0\2\ticon\b\tname\bcss\bcpp\1\0\2\ticon\b\tname\bcpp\acc\1\0\2\ticon\b\tname\acc\6c\1\0\0\ncolor\tblue\1\0\2\ticon\b\tname\6c\nsetup\vcolors\22colors.highlights\22nvim-web-devicons\frequire\npcall\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n�\5\0\0\a\0\29\00046\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0004\6\0\0=\6\n\0054\6\0\0=\6\v\0054\6\0\0=\6\f\0054\6\0\0=\6\r\0054\6\0\0=\6\14\0054\6\0\0=\6\15\0054\6\0\0=\6\16\0054\6\0\0=\6\17\0054\6\0\0=\6\18\0054\6\0\0=\6\19\0054\6\0\0=\6\20\0054\6\0\0=\6\21\5=\5\22\0044\5\0\0=\5\23\0044\5\0\0=\5\24\0045\5\25\0=\5\26\4B\2\2\0016\2\1\0'\4\27\0B\2\2\0029\2\28\2B\2\1\1K\0\1\0\tinit\vcolors\17integrations\1\0\6\bcmp\2\vnotify\1\tmini\1\14telescope\2\rgitsigns\2\rnvimtree\2\22custom_highlights\20color_overrides\vstyles\14operators\ntypes\15properties\rbooleans\fnumbers\14variables\fstrings\rkeywords\14functions\nloops\17conditionals\rcomments\1\0\0\17dim_inactive\1\0\3\nshade\tdark\fenabled\1\15percentage\4��̙\3���\3\15background\1\0\2\nlight\nlatte\tdark\14macchiato\1\0\6\fflavour\14macchiato\fno_bold\1\14no_italic\1\16term_colors\1\23show_end_of_buffer\1\27transparent_background\1\nsetup\15catppuccin\frequire\npcall\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\4B\2\2\1K\0\1\0\aui\1\0\0\nicons\1\0\3\24package_uninstalled\b✗\20package_pending\b\22package_installed\b\1\0\1\vborder\frounded\nsetup\nmason\frequire\npcall\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\4B\2\2\1K\0\1\0\npaths\1\0\0\1\2\0\0A~/.local/share/nvim/site/pack/packer/start/friendly-snippets\14lazy_load luasnip/loaders/from_vscode\frequire\npcall\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nU\0\1\5\1\4\0\f9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\4�-\1\0\0009\1\3\0019\3\0\0D\1\2\0K\0\1\0\2�\16fnamemodify\t%.md\nmatch\tname�\4\1\0\b\0\r\0\0216\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\r�6\2\3\0009\2\4\0029\3\5\0015\5\v\0005\6\6\0005\a\a\0=\a\b\0063\a\t\0=\a\n\6=\6\f\5B\3\2\0012\0\0�K\0\1\0K\0\1\0\foptions\1\0\0\19name_formatter\0\14indicator\1\0\2\ticon\b▎\nstyle\ticon\1\0\22\rtab_size\3\16\22max_prefix_length\3\n\20max_name_length\3\14\20separator_style\tthin\25enforce_regular_tabs\1\23right_trunc_marker\b\fsort_by\aid\22left_trunc_marker\b\15close_icon\b\18modified_icon\b●\22buffer_close_icon\b\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\27always_show_bufferline\1\18close_command\16bdelete! %d\fnumbers\tnone\24persist_buffer_sort\2\24show_tab_indicators\2\20show_close_icon\1\28show_buffer_close_icons\1\22show_buffer_icons\2\16diagnostics\1\nsetup\afn\bvim\15bufferline\frequire\npcall\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\n�\16\0\0\t\0;\0R6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\f\0005\6\5\0005\a\6\0=\a\a\0065\a\b\0005\b\t\0=\b\n\a=\a\v\6=\6\n\0055\6\14\0005\a\r\0=\a\15\0065\a\16\0=\a\17\6=\6\18\0055\6\24\0005\a\20\0009\b\19\2=\b\21\a9\b\22\2=\b\23\a=\a\25\0065\a\27\0009\b\26\2=\b\21\a9\b\28\2=\b\23\a=\a\29\6=\6\30\0055\6\31\0=\6 \0055\6\"\0005\a!\0=\a#\6=\6$\0055\6%\0005\a'\0009\b&\2=\b(\a=\a\30\6=\6\25\0055\6)\0005\a*\0009\b&\2=\b(\a=\a\30\6=\6+\0055\6,\0005\a-\0009\b&\2=\b(\a=\a\30\6=\6\29\0055\6.\0005\a/\0009\b&\2=\b(\a=\a\30\0065\a1\0005\b0\0=\b2\a5\b3\0=\b4\a5\b5\0=\b6\a5\b7\0=\b8\a=\a9\6=\6:\5B\3\2\1K\0\1\0\16diagnostics\nsigns\tHint\1\0\2\vtexthl\19DiagnosticHint\ttext\b\tInfo\1\0\2\vtexthl\19DiagnosticInfo\ttext\b\tWarn\1\0\2\vtexthl\19DiagnosticWarn\ttext\b\nError\1\0\0\1\0\2\vtexthl\20DiagnosticError\ttext\b\1\0\0\1\0\a\15file_icons\2\17icon_padding\5\15diag_icons\2\rcwd_only\1\vprompt\20Diagnostics❯ \16color_icons\2\14git_icons\2\1\0\0\1\0\5\vprompt\16Buffers❯ \18sort_lastused\2\16color_icons\2\15file_icons\2\14git_icons\2\tgrep\1\0\0\1\0\v\14grep_optsV--binary-files=without-match --line-number --recursive --color=auto --perl-regexp\17input_prompt\17Grep For❯ \frg_glob\1\vprompt\vRg❯ \frg_optsV--column --line-number --no-heading --color=always --smart-case --max-columns=512\16no_header_i\1\14no_header\1\16color_icons\2\15file_icons\2\14git_icons\2\17multiprocess\2\fdefault\1\0\0\14file_edit\1\0\b\ffd_opts<--color=never --type f --hidden --follow --exclude .git\vprompt\14Files❯ \frg_opts7--color=never --files --hidden --follow -g '!.git'\14find_opts2-type f -not -path '*/\\.git/*' -printf '%P\\n'\16color_icons\2\15file_icons\2\14git_icons\2\17multiprocess\2\15fzf_colors\vheader\1\0\0\1\3\0\0\afg\fComment\rfzf_opts\1\0\5\v--info\vinline\v--ansi\5\r--border\tnone\r--layout\freverse\r--height\t100%\factions\fbuffers\15buf_vsplit\1\0\0\14buf_split\nfiles\1\0\0\vctrl-v\16file_vsplit\vctrl-s\1\0\0\15file_split\vkeymap\bfzf\1\0\2\vctrl-u\17half-page-up\vctrl-d\19half-page-down\fbuiltin\1\0\0\1\0\2\v<S-up>\20preview-page-up\r<S-down>\22preview-page-down\1\0\1\22file_icon_padding\5\fpreview\fwinopts\1\0\t\15cursorline\1\18cursorlineopt\tboth\15signcolumn\ano\19relativenumber\1\tlist\1\vnumber\2\15foldmethod\vmanual\15foldenable\1\17cursorcolumn\1\1\0\v\17flip_columns\3x\ndelay\0032\14scrollbar\1\vlayout\tflex\16title_align\vcenter\rvertical\rdown:45%\twrap\vnowrap\ntitle\1\15horizontal\14right:50%\vhidden\rnohidden\vborder\vborder\ahl\1\0\4\ntitle\vNormal\vnormal\vNormal\vsearch\14IncSearch\vborder\16FloatBorder\1\0\6\15fullscreen\1\vheight\4��̙\3���\3\nwidth\4����\t����\3\brow\4�̙�\6����\3\bcol\4\0����\3\vborder\frounded\nsetup\20fzf-lua.actions\ffzf-lua\frequire\npcall\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\fnull-ls\frequire\npcall\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3�\tbody\15lsp_expand�\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\19�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\n�-\1\2\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\4\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\5�\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\1�\3�\tjump\rjumpable\21select_prev_item\fvisible�\1\0\2\4\1\a\0\18-\2\0\0009\3\0\0018\2\3\2=\2\0\0015\2\2\0009\3\3\0009\3\4\0038\2\3\2=\2\1\0015\2\6\0009\3\3\0009\3\4\0038\2\3\2\14\0\2\0X\3\1�)\2\0\0=\2\5\1L\1\2\0\4�\1\0\4\tpath\3\1\rnvim_lsp\3\0\vbuffer\3\1\fluasnip\3\1\bdup\tname\vsource\1\0\4\tpath\v(Path)\rnvim_lsp\n(LSP)\vbuffer\r(Buffer)\fluasnip\14(Snippet)\tmenu\tkind�\n\1\0\14\0004\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�2\0I�5\4\4\0003\5\5\0009\6\6\0015\b\n\0005\t\b\0003\n\a\0=\n\t\t=\t\v\b5\t\15\0005\n\r\0005\v\f\0=\v\14\n=\n\16\t5\n\18\0005\v\17\0=\v\14\n=\n\19\t=\t\20\b5\t\23\0009\n\21\0019\n\22\n)\f��B\n\2\2=\n\24\t9\n\21\0019\n\22\n)\f\4\0B\n\2\2=\n\25\t9\n\21\0019\n\26\nB\n\1\2=\n\27\t9\n\21\0019\n\28\n5\f\31\0009\r\29\0019\r\30\r=\r \fB\n\2\2=\n!\t9\n\21\0013\f\"\0005\r#\0B\n\3\2=\n$\t9\n\21\0013\f%\0005\r&\0B\n\3\2=\n'\t=\t\21\b5\t)\0005\n(\0=\n*\t3\n+\0=\n,\t=\t-\b4\t\6\0005\n.\0>\n\1\t5\n/\0>\n\2\t5\n0\0>\n\3\t5\n1\0>\n\4\t5\n2\0>\n\5\t=\t3\bB\6\2\0012\0\0�K\0\1\0K\0\1\0\fsources\1\0\1\tname\rnvim_lua\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\t<Up>\v<Down>\1\0\0\16scroll_docs\fmapping\vwindow\15completion\1\0\1\17winhighlightHNormal:Normal,FloatBorder:PmenuBorder,CursorLine:Visual,Search:None\1\t\0\0\b╭\b─\b╮\b│\b╯\b─\b╰\b│\18documentation\1\0\0\vborder\1\0\2\17winhighlightHNormal:Normal,FloatBorder:PmenuBorder,CursorLine:Visual,Search:None\14scrollbar\b║\1\t\0\0\b╭\b─\b╮\b│\b╯\b─\b╰\b│\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\1\0\"\nEvent\b\nValue\b\15EnumMember\b\tUnit\b塞\tEnum\b練\18TypeParameter\b\16Constructor\b\tText\b\vStruct\b\rConstant\b\vString\b\nColor\b\fSnippet\b\14Reference\b\fBoolean\b◩\fPackage\b\nArray\b\rProperty\b\nClass\b\rOperator\b\rVariable\b\vObject\b\vNumber\b\14Namespace\b\tNull\b\vModule\b\vMethod\b\fKeyword\b\bKey\b\14Interface\b練\rFunction\b\vFolder\b\tFile\b\nField\b\fluasnip\bcmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\5\0\0\r\0\26\0+6\0\0\0006\2\1\0'\3\2\0B\0\3\0036\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\0\0X\4\3�\14\0\2\0X\4\1�K\0\1\0009\4\4\0015\6\6\0005\a\5\0=\a\a\0065\a\b\0005\b\t\0=\b\n\a6\b\v\0009\b\f\b'\n\r\0'\v\14\0'\f\15\0B\b\4\2=\b\16\a=\a\17\6B\4\2\0016\4\1\0'\6\18\0B\4\2\0029\5\19\3\18\a\5\0009\5\20\5'\b\21\0009\t\22\0045\v\24\0005\f\23\0=\f\25\vB\t\2\0A\5\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\bmap\n<M-e>\19highlight_grey\fComment\14highlight\vSearch\16check_comma\2\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fend_key\6$\voffset\3\0\21disable_filetype\1\0\b\27disable_in_visualblock\1\fmap_c_w\1\vmap_bs\2\22enable_afterquote\2\21disable_in_macro\1\21enable_moveright\2\rcheck_ts\2\30enable_check_bracket_line\1\1\2\0\0\20TelescopePrompt\nsetup\bcmp\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vue ++once lua require("packer.load")({'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
