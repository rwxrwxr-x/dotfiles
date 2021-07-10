local fn, api = vim.fn, vim.api
local c = require("misc.colors")

local M = {}

function M.statusFG(item, col)
    api.nvim_command("hi Galaxy" .. item .. " guifg=" .. c.Color(col)())
end
function M.statusBG(item, col)
    api.nvim_command("hi Galaxy" .. item .. " guibg=" .. c.Color(col)())
end
function M.statusHi(item, colorfg, colorbg)
    api.nvim_command(
        "hi Galaxy" .. item .. " guifg=" .. c.Color(colorfg)() .. " guibg=" .. c.Color(colorbg)()
    )
end

function M.statusHiB(item, colorfg, colorbg)
    api.nvim_command(
        "hi Galaxy" .. item .. " guifg=" .. c.Color(colorfg)() .. " guibg=" .. c.Color(colorbg)() .. " gui=bold"
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