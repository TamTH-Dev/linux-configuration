local M = {}

function M.barbar()
  return function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    -- Move to previous/next
    map('n', '<leader><S-Tab>', ':BufferPrevious<cr>', opts)
    map('n', '<leader><Tab>', ':BufferNext<cr>', opts)
    -- Re-order to previous/next
    map('n', '<leader><', ':BufferMovePrevious<cr>', opts)
    map('n', '<leader>>', ' :BufferMoveNext<cr>', opts)
    -- Goto buffer in position...
    map('n', '<leader>1', ':BufferGoto 1<cr>', opts)
    map('n', '<leader>2', ':BufferGoto 2<cr>', opts)
    map('n', '<leader>3', ':BufferGoto 3<cr>', opts)
    map('n', '<leader>4', ':BufferGoto 4<cr>', opts)
    map('n', '<leader>5', ':BufferGoto 5<cr>', opts)
    map('n', '<leader>6', ':BufferGoto 6<cr>', opts)
    map('n', '<leader>7', ':BufferGoto 7<cr>', opts)
    map('n', '<leader>8', ':BufferGoto 8<cr>', opts)
    map('n', '<leader>9', ':BufferGoto 9<cr>', opts)
    map('n', '<leader>10', ':BufferGoto 10<cr>', opts)
    map('n', '<leader>0', ':BufferLast<cr>', opts)
    -- Close all buffer but accept the current one
    map('n', '<leader>cb', ':BufferCloseAllButCurrent<cr>', opts)
    -- Sort buffer
    map('n', '<leader>bb', ':BufferOrderByBufferNumber<cr>', opts)
    map('n', '<leader>bd', ':BufferOrderByDirectory<cr>', opts)
    map('n', '<leader>bl', ':BufferOrderByLanguage<cr>', opts)
  end
end

function M.bufferline()
  return function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<leader><Tab>', ':BufferLineCycleNext<cr>', opts)
    map('n', '<leader><S-Tab>', ':BufferLineCyclePrev<cr>', opts)
    -- Re-order to previous/next
    map('n', '<leader>>', ' :BufferLineMoveNext<cr>', opts)
    map('n', '<leader><', ':BufferLineMovePrev<cr>', opts)
    -- Goto buffer in position...
    map('n', '<leader>1', ':BufferLineGoToBuffer 1<cr>', opts)
    map('n', '<leader>2', ':BufferLineGoToBuffer 2<cr>', opts)
    map('n', '<leader>3', ':BufferLineGoToBuffer 3<cr>', opts)
    map('n', '<leader>4', ':BufferLineGoToBuffer 4<cr>', opts)
    map('n', '<leader>5', ':BufferLineGoToBuffer 5<cr>', opts)
    map('n', '<leader>6', ':BufferLineGoToBuffer 6<cr>', opts)
    map('n', '<leader>7', ':BufferLineGoToBuffer 7<cr>', opts)
    map('n', '<leader>8', ':BufferLineGoToBuffer 8<cr>', opts)
    map('n', '<leader>9', ':BufferLineGoToBuffer 9<cr>', opts)
    map('n', '<leader>10', ':BufferLineGoToBuffer 10<cr>', opts)
  end
end

function M.close_tag()
  return function()
    local global = vim.g
    global.closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts,*.vue,*.jsx,*.tsx,*.vuex'
    global.closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.vuex'
    global.closetag_filetypes = 'html,xhtml,phtml,js,ts,vue,jsx,tsx,vuex'
    global.closetag_xhtml_filetypes = 'xhtml,jsx,tsx,vuex'
    -- Make the list of non-closing tags case-sensitive (e.g. `<Link>` will be>
    global.closetag_emptyTags_caseSensitive = 1
  end
end

function M.dashboard()
  return function()
    local global = vim.g
    local cmd = vim.cmd
    local api = vim.api

    global.dashboard_default_executive = 'telescope'

    global.dashboard_custom_header = {
        '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
        '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
        '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
        '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
        '          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
        '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
        '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
        ' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
        ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
        '    ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆       ',
        '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
    }

    global.dashboard_custom_section = {
      a = {
        description = { '  Find File' },
        command = 'Telescope find_files',
      },
      b = {
        description = { '  Find Word' },
        command = 'Telescope live_grep',
      },
      c = {
        description = { '  Recent Files' },
        command = 'Telescope oldfiles',
      },
      d = {
        description = { '  Settings' },
        command = 'e $HOME/.config/nvim/lua/default_config.lua',
      },
      e = {
        description = { '  Quit' },
        command = 'qa',
      },
    }

    cmd([[let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 1, 1))]])

    api.nvim_exec(
      [[
      let g:dashboard_custom_footer = ['Madvim loaded '..packages..' plugins  ']
  ]],
      false
    )

    api.nvim_exec([[
       autocmd FileType dashboard nnoremap <silent> <buffer> q :q<CR>
    ]], false)
  end
end

function M.emmet()
  return function()
    local global = vim.g
    -- Remap the default emmet's leader key
    global.user_emmet_leader_key = '<C-y>'
  end
end

function M.indent_blankline()
  return function()
    local global = vim.g

    global.indent_blankline_buftype_exclude = {
    'help', 'startify', 'dashboard', 'packer', 'alpha', 'NvimTree'
    }
    global.indent_blankline_filetype_exclude = {
    'help', 'startify', 'dashboard', 'packer', 'alpha', 'NvimTree'
    }
    global.indent_blankline_char_list = {'', '┊', '┆', '¦', '|', '¦', '┆', '┊', ''}
    global.indent_blankline_show_trailing_blankline_indent = false
    global.indent_blankline_show_first_indent_level = false
    global.indent_blankline_bufname_exclude = { 'README.md' }
    global.indent_blankline_context_patterns = {
      'class', 'return', 'function', 'method', '^if', 'if', '^while', 'jsx_element', '^for', 'for',
      '^object', '^table', 'block', 'arguments', 'if_statement', 'else_clause', 'jsx_element',
      'jsx_self_closing_element', 'try_statement', 'catch_clause', 'import_statement',
      'operation_type'
    }
    global.indent_blankline_use_treesitter = true
    global.indent_blankline_show_current_context = true
    global.indent_blankline_enabled = true
  end
end

function M.multiple_cursors()
  return function()
    local global = vim.g
    global.multi_cursor_use_default_mapping = 0
    global.multi_cursor_start_word_key = '<C-s>'
    global.multi_cursor_select_all_word_key = '<A-s>'
    global.multi_cursor_next_key = '<C-s>'
    global.multi_cursor_prev_key = '<C-p>'
    global.multi_cursor_skip_key = '<C-x>'
    global.multi_cursor_quit_key = '<Esc>'
  end
end

function M.neoformat()
  return function ()
    local global = vim.g
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    -- Enable formatters for python
    global.neoformat_enabled_python = { 'yapf', 'autopep8', 'black' }
    map('n', '<leader>f', '<cmd>Neoformat<cr>', opts)
  end
end

function M.nvimtree()
  return function()
    local map = vim.api.nvim_set_keymap
    local global = vim.g
    local opts = { noremap = true, silent = true }

    map('n', '<C-n>', ':NvimTreeToggle<cr>', opts)
    map('n', '<leader>r', ':NvimTreeRefresh<cr>', opts)
    map('n', '<leader>nf', ':NvimTreeFindFile<cr>', opts)
    -- Don't auto open tree on specific filetypes
    global.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard', 'alpha' }
    -- List of filenames that gets highlighted with NvimTreeSpecialFile
    global.vim_tree_special_files = {
      ['README.md'] = 1,
      Makefile = 1,
      MAKEFILE = 1
    }
    -- Root format
    global.nvim_tree_root_folder_modifier = ':~'
    -- Custom icons
    global.nvim_tree_icons = {
      default= '',
      symlink= '',
      git= {
        unstaged= '±',
        staged= '',
        unmerged= '',
        renamed= '',
        untracked= '',
        deleted= '',
        ignored= ''
      },
      folder= {
        arrow_open= '',
        arrow_closed= '',
        default= '',
        open= '',
        empty= '',
        empty_open= '',
        symlink= '',
        symlink_open= '',
      },
      lsp= {
        error= '',
        warning= '',
        info= '',
        hint= '',
      }
    }
  end
end

function M.telescope()
  return function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<C-p>', ':Telescope find_files hidden=true<cr>', opts)
    map('n', '<C-f>', ':Telescope live_grep<cr>', opts)
    map('n', '<C-b>', ':Telescope buffers<cr>', opts)
    map('n', '<C-e>', ':Telescope lsp_document_diagnostics<cr>', opts)
    map('n', '<C-w>', ':Telescope lsp_workspace_diagnostics<cr>', opts)
  end
end

return M
