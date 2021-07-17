local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

local i, c, u, vi, diag, f, git, p =
    require("core.misc.icons"),
    require("core.misc.colors"),
    require("core.galaxyline-opt.utils"),
    require("core.galaxyline-opt.vimode"),
    require("core.galaxyline-opt.lsp"),
    require("core.galaxyline-opt.file"),
    require("core.galaxyline-opt.git"),
    require("core.galaxyline-opt.providers")

gls.left[1] = {
  ViMode = {
    provider = vi.get_mode,
    highlight = {c.Color('act1'), c.Color('DarkGoldenrod2')}
  }
}

gls.left[2] = {
  ViModeSeparator = {
    provider = vi.separator,
    highlight = {c.Color('DarkGoldenrod2'), c.Color('act1')}
  }
}

gls.left[3] = {
  FileSize = {
      provider = f.get_file_size,
      -- condition = u.buffer_not_empty,
      separator = i.border.left,
      separator_highlight = {c.Color('purple'), c.Color('act1')},
      highlight = {c.Color('base'), c.Color('act1')}
  }
}

gls.left[4] = {
  FileIcon = {
    provider = f.get_file_icon,
    highlight = {c.Color('base'), c.Color('purple')},
  }
}

gls.left[5] = {
  FileType = {
      provider = f.get_file_type,
      -- condition = u.buffer_not_empty,
      highlight = {c.Color('base'), c.Color('purple')},
  }
}

gls.left[6] = {
  FileTypeSeparator = {
    provider = f.filetype_separator
  }
}

gls.left[7] = {
  DiagnosticError = {
      provider = diag.get_diagnostic_error,
      icon = "  " .. i.diagnostic.error,
      highlight = {c.Color('error'), c.Color('act1')}
  }
}

gls.left[8] = {
  DiagnosticWarn = {
      provider = diag.get_diagnostic_warn,
      icon = "  " .. i.diagnostic.warn,
      highlight = {c.Color('warning'), c.Color('act1')}
  }
}

gls.left[9] = {
  DiagnosticInfo = {
      provider = diag.get_diagnostic_info,
      icon = "  " .. i.diagnostic.info,
      highlight = {c.Color('info'), c.Color('act1')}
  }
}

gls.left[10] = {
  DiagnosticEndSpace = {
      provider = diag.d_end_space,
      highlight = {c.Color('act1'), c.Color('act1')}
  }
}

gls.left[11] = {
  DiagnosticSeperator = {
      provider = diag.d_separator,
      highlight = {c.Color('purple'), c.Color('act1')}
  }
}

gls.left[12] = {
  GitBranch = {      
    provider = git.get_git_branch_formatted,
    icon = i.git,
    condition = u.buffer_not_empty
  },
}

gls.left[13] = {
  GitSeparator = {
    provider = git.git_separator,
    condition = u.buffer_not_empty
  }
}

gls.left[14] = {
  Space = {
    provider = u.space,
    highlight = {c.Color('blue'), c.Color('purple')}
  }
}

gls.right[1] = {
  FileFormat = {
    provider = f.get_file_format,
    highlight = {c.Color('base'), c.Color('purple')}
  }
}

gls.right[2] = {
  LineInfo = {
      provider = p.line_column,
      separator = " | ",
      separator_highlight = {c.Color('base'), c.Color('purple')},
      highlight = {c.Color('base'), c.Color('purple')}
  }
}
gls.right[3] = {
  PerCent = {
      provider = p.current_line_percent,
      separator = i.border.right,
      separator_highlight = {c.Color('purple'), c.Color('act1')},
      highlight = {c.Color('base'), c.Color('act1')}
  }
}

gls.right[4] = {
  FileEncode = {
    provider = function()
      return " UTF-8 "
    end,
    separator = i.border.left,
    separator_highlight = {c.Color('purple'), c.Color('act1')},
    highlight = {c.Color('base'), c.Color('purple')}
  }
}

gls.right[5] = {
  ScrollBar = {
      provider = p.scrollbar_instance,
      highlight = {c.Color('yellow'), c.Color('purple')}
  }
}