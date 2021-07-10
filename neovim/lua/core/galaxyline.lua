local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }
local vimode, i, c, u, p =
    require("core.galaxyline_opt.vimmode_provider"),
    require("misc.icons"),
    require("misc_colors"),
    require("core.galaxyline_opt.utils"),
    require("core.galaxyline_opt.providers")

gls.left[1] = {
ViMode = {
    provider = vimode.get_mode,
    highlight = {c.Color('act1'), c.Color('DarkGoldenrod2')}
}
}

gls.left[2] = {
ViModeSeparator = {
    provider = vimode.separator,
    highlight = {c.Color('DarkGoldenrod2'), c.Color('act1')}
}
}

gls.left[3] = {
FileSize = {
    provider = p.get_file_size,
    separator = i.border.left,
    separator_highlight = {c.Color('purple'), c.Color('act1')},
    highlight = {c.Color('base'), c.Color('act1')}
}
}

gls.left[4] = {
FileIcon = {
    provider = p.get_file_icon,
    highlight = {c.Color('base'), c.Color('purple')},
}
}

gls.left[5] = {
FileType = {
    provider = p.get_file_type,
    condition = u.buffer_not_empty,
    highlight = {c.Color('base'), c.Color('purple')},
}
}

gls.left[6] = {
FileTypeSeparator = {
    provider = p.filetype_separator
}
}

gls.left[7] = {
DiagnosticError = {
    provider = p.get_diagnostic_error,
    icon = "  " .. i.diagnostic.error,
    highlight = {c.Color('error'), c.Color('act1')}
}
}

gls.left[8] = {
DiagnosticWarn = {
    provider = p.get_diagnostic_warn,
    icon = "  " .. i.diagnostic.warn,
    highlight = {c.Color('warning'), c.Color('act1')}
}
}

gls.left[9] = {
DiagnosticInfo = {
    provider = p.get_diagnostic_info,
    icon = "  " .. i.diagnostic.info,
    highlight = {c.Color('info'), c.Color('act1')}
}
}

gls.left[10] = {
DiagnosticEndSpace = {
    provider = p.d_end_space,
    highlight = {c.Color('act1'), c.Color('act1')}
}
}

gls.left[11] = {
DiagnosticSeperator = {
    provider = p.d_separator,
    highlight = {c.Color('purple'), c.Color('act1')}
}
}

gls.left[12] = {
GitBranch = {
    provider = p.get_git_branch_formatted,
    icon = i.git,
    condition = u.buffer_not_empty
},
}

gls.left[13] = {
GitSeparator = {
    provider = p.git_separator,
    condition = u.buffer_not_empty
}
}

gls.left[14] = {
Space = {
    provider = p.space,
    highlight = {c.Color('blue'), c.Color('purple')}
}
}

gls.right[1] = {
FileFormat = {
    provider = p.get_file_format,
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
    separator = i.border.right,
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
