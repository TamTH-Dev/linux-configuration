local is_colors_loaded, highlights = pcall(require, 'colors.highlights')
local is_galaxyline_loaded, gl = pcall(require, 'galaxyline')
local is_provider_vcs_loaded, vcs = pcall(require, 'galaxyline.provider_vcs')
local is_provider_extensions_loaded, extensions = pcall(require, 'galaxyline.provider_extensions')
local is_conditions_loaded, condition = pcall(require, 'galaxyline.condition')
local is_provider_fileinfo_loaded, fileinfo = pcall(require, 'galaxyline.provider_fileinfo')
if not (is_colors_loaded or is_galaxyline_loaded or is_provider_vcs_loaded or is_provider_extensions_loaded or is_conditions_loaded or is_provider_fileinfo_loaded) then
   return
end

local fn = vim.fn
local bo = vim.bo
local cmd = vim.cmd
local gls = gl.section

-- Supporters
local GitBranch = vcs.get_git_branch
local ScrollBar = extensions.scrollbar_instance
local buffer_not_empty = condition.buffer_not_empty
local hide_in_width = condition.hide_in_width
local check_git_workspace = condition.check_git_workspace
local file_icon_color = fileinfo.get_file_icon_color

local is_git_workspace_showed = function()
  return hide_in_width() and check_git_workspace()
end

local is_file_type_valid = function()
  local f_type = bo.filetype
  if not f_type or f_type == '' then
      return false
  end
  return true
end

-- Color
local colors = highlights.colors

local is_buffer_number_valid = function()
  local buffers = {}
  for _,val in ipairs(vim.fn.range(1,vim.fn.bufnr('$'))) do
    if vim.fn.bufexists(val) == 1 and vim.fn.buflisted(val) == 1 then
      table.insert(buffers,val)
    end
  end
  for _, nr in ipairs(buffers) do
    if nr == vim.fn.bufnr('') then
      return true
    end
  end
end

local get_mode_color = function()
  local mode_colors = {
    n = colors.blue,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }
  local color = mode_colors[fn.mode()]
  if color == nil then
    color = colors.red
  end
  return color
end

-- Short line list
gl.short_line_list = { 'NvimTree', 'packer' }

-- Left section
gls.left[1] = {
  EmptyBar = {
    provider = function()
      cmd('hi GalaxyEmptyBar guifg='..get_mode_color())
      return '▊'
    end,
    highlight = { colors.red, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'VISUAL',
        [''] = 'VISUAL',
        v = 'VISUAL',
        R = 'REPLACE',
      }
      local icons = {
        n = ' ',
        i = ' ',
        c = 'גּ ',
        V = '﬏ ',
        [''] = '﬏ ',
        v = '﬏ ',
        R = ' ',
      }
      cmd('hi GalaxyViMode guifg='..get_mode_color())
      local alias_mode = alias[fn.mode()]
      local icon = icons[fn.mode()]
      if not alias_mode then
        alias_mode = fn.mode()
      end
      if not icon then
        icon = ''
      end
      return icon..alias_mode
    end,
    highlight = { colors.bg, colors.bg },
    separator = '  ',
    separator_highlight = { colors.bg, colors.bg }
  }
}

gls.left[3] ={
  FileIcon = {
    condition = buffer_not_empty,
    provider = 'FileIcon',
    highlight = { file_icon_color, colors.bg }
  }
}

gls.left[4] = {
  FileName = {
    condition = buffer_not_empty,
    provider = 'FileName',
    highlight = { colors.fg, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg }
  }
}

gls.left[5] = {
  GitIcon = {
    condition = is_git_workspace_showed,
    provider = function() return '' end,
    highlight = { colors.orange, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg }
  }
}

gls.left[6] = {
  GitBranch = {
    condition = is_git_workspace_showed,
    provider = function()
      local branch_name = GitBranch()
      if not branch_name then
        return 'Undefined'
      end
      if (branch_name and string.len(branch_name) > 28) then
        return string.sub(branch_name, 1, 25)..'...'
      end
      return branch_name
    end,
    highlight = { colors.fg,colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg }
  }
}

gls.left[7] = {
  DiffAdd = {
    condition = is_git_workspace_showed,
    provider = 'DiffAdd',
    icon = '  ',
    highlight = { colors.green, colors.bg }
  }
}

gls.left[8] = {
  DiffModified = {
    condition = is_git_workspace_showed,
    provider = 'DiffModified',
    icon = '  ',
    highlight = { colors.orange, colors.bg }
  }
}

gls.left[9] = {
  DiffRemove = {
    condition = is_git_workspace_showed,
    provider = 'DiffRemove',
    icon = '  ',
    highlight = { colors.red,colors.bg }
  }
}

gls.left[10] = {
  Space = {
    condition = is_git_workspace_showed,
    provider = 'WhiteSpace',
    highlight = { colors.cyan, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg }
  }
}

gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = { colors.red, colors.bg },
  }
}

gls.left[12] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = { colors.orange, colors.bg }
  }
}

gls.left[13] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ',
    highlight = { colors.magenta, colors.bg }
  }
}

gls.left[14] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' ',
    highlight = { colors.blue, colors.bg }
  }
}

-- Right section
gls.right[1]= {
  BufferNumber = {
    condition = hide_in_width,
    provider = 'BufferNumber',
    icon = '﬘ ',
    highlight = { colors.green, colors.bg }
  }
}

gls.right[2] = {
  Separator = {
    condition = is_buffer_number_valid,
    provider = function()
      return '| '
    end,
    highlight = { colors.white, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg },
  },
}

gls.right[3]= {
  GetLspClient = {
    condition = hide_in_width,
    provider = 'GetLspClient',
    icon = ' ',
    highlight = { colors.yellow, colors.bg },
  }
}

gls.right[4]= {
  FileFormat = {
    condition = hide_in_width,
    provider = function()
      return bo.filetype
    end,
    icon = ' ',
    highlight = { colors.blue, colors.bg },
    separator = ' | ',
    separator_highlight = { colors.fg, colors.bg }
  }
}

gls.right[5] = {
  LineInfo = {
    condition = hide_in_width,
    provider = 'LineColumn',
    icon = ' ',
    highlight = { colors.magenta, colors.bg },
    separator = ' | ',
    separator_highlight = { colors.fg, colors.bg }
  },
}

gls.right[6] = {
  PerCent = {
    condition = hide_in_width,
    provider = 'LinePercent',
    icon = '',
    highlight = { colors.red, colors.bg },
    separator = ' | ',
    separator_highlight = { colors.fg, colors.bg }
  }
}

gls.right[7] = {
  ScrollBar = {
    condition = hide_in_width,
    provider = function()
      return ScrollBar()..' '
    end,
    highlight = { colors.red, colors.bg }
  }
}

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    condition = is_file_type_valid,
    provider = 'FileTypeName',
    highlight = { colors.fg, colors.bg }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    condition = is_file_type_valid,
    provider= 'BufferIcon',
    highlight = { colors.fg, colors.bg }
  }
}
