local M, fn = {}, vim.fn


function M.line_column()
    local line = fn.line(".")
    local column = fn.col(".")
    return line .. ":" .. column
end

function M.current_line_percent()
    local current_line = fn.line(".")
    local total_line = fn.line("$")
    if current_line == 1 then
      return " Top "
    elseif current_line == fn.line("$") then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "% "
end

function M.scrollbar_instance(scroll_bar_chars)
    local current_line = fn.line('.')
    local total_lines = fn.line('$')
    local default_chars = {'__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██'}
    local chars = scroll_bar_chars or default_chars
    local index = 1

    if  current_line == 1 then
      index = 1
    elseif current_line == total_lines then
      index = #chars
    else
      local line_no_fraction = fn.floor(current_line) / fn.floor(total_lines)
      index = fn.float2nr(line_no_fraction * #chars)
      if index == 0 then
        index = 1
      end
    end
    return chars[index]
end

return M