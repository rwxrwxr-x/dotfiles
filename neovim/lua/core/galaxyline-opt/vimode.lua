local vim = vim
local i = require("core.misc.icons")
local u = require("core.galaxyline-opt.utils")

local M = {}

function M.get_mode()
    local mode = {
        c      = {i.mode.c, 'plum3'},
        ce     = {i.mode.c, 'plum3'},
        cv     = {i.mode.c, 'plum3'},
        i      = {i.mode.i, 'chartreuse3'},
        ic     = {i.mode.i, 'chartreuse3'},
        n      = {i.mode.n, 'DarkGoldenrod2'},
        no     = {i.mode.n, 'DarkGoldenrod2'},
        r      = {i.mode.r, 'chocolate'},
        rm     = {i.mode.r, 'chocolate'},
        R      = {i.mode.r, 'purple'},
        Rv     = {i.mode.r, 'purple'},
        s      = {i.mode.s, 'SkyBlue2'},
        S      = {i.mode.s, 'SkyBlue2'},
        t      = {i.mode.t, 'gray'},
        V      = {i.mode.v, 'gray'},
        v      = {i.mode.v, 'gray'},
        ["r?"] = {i.mode.r, 'chocolate'},
        [""]  = {"🅢 ", 'SkyBlue2'},
        [""]  = {" ", 'gray'},
        ["!"]  = {"! ", 'plum3'}
    }

    local vimMode = mode[vim.fn.mode()]
    if mode[vim.fn.mode()] ~= nil then
        u.statusBG("ViMode", vimMode[2])
        return "  " .. vimMode[1] .. "  "
    else
        u.statusBG("ViMode", 'error')
        return " ? "
    end

end

function M.separator()
    local mode_color = {
        c      = 'plum3',
        ce     = 'plum3',
        cv     = 'plum3',
        i      = 'chartreuse3',
        ic     = 'chartreuse3',
        n      = 'DarkGoldenrod2',
        no     = 'DarkGoldenrod2',
        r      = 'chocolate',
        rm     = 'chocolate',
        R      = 'purple',
        Rv     = 'purple',
        s      = 'SkyBlue2',
        S      = 'SkyBlue2',
        t      = 'gray',
        V      = 'gray',
        v      = 'gray',
        ["r?"] = 'chocolate',
        [""]  = 'SkyBlue2',
        [""]  = 'gray',
        ["!"]  = 'plum3'
    }

    local m_color = 'error'
    if mode_color[vim.fn.mode()] ~= nil then
        m_color = mode_color[vim.fn.mode()]
    end

    if not u.buffer_not_empty() or vim.bo.filetype == 'dashboard' then
        u.statusHi("ViModeSeparator", m_color, 'purple')
        return i.border.left
    else
        u.statusHi("ViModeSeparator", m_color, 'act1')
        return i.border.right
    end
end

return M
