local fn, api = vim.fn, vim.api
local c = require("core.misc.colors")

local M = {}

function M.statusFG(item, col)
    api.nvim_command("hi Galaxy" .. item .. " guifg=" .. c.get_color(col)())
end
function M.statusBG(item, col)
    api.nvim_command("hi Galaxy" .. item .. " guibg=" .. c.get_color(col)())
end
function M.statusHi(item, colorfg, colorbg)
    api.nvim_command(
        "hi Galaxy" .. item .. " guifg=" .. c.get_color(colorfg)() .. " guibg=" .. c.get_color(colorbg)()
    )
end

function M.statusHiB(item, colorfg, colorbg)
    api.nvim_command(
        "hi Galaxy" .. item .. " guifg=" .. c.get_color(colorfg)() .. " guibg=" .. c.get_color(colorbg)() .. " gui=bold"
    )
end

function M.space()
    return " "
end

function M.buffer_not_empty()
    if fn.empty(fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

function M.checkwidth()
    local squeeze_width = fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

return M