local M, api, fn, u, i, bo, b, lsp = {},
 vim.api,
  vim.fn,
   require("core.galaxyline-opt.utils"),
    require("core.misc.icons"),
     vim.bo,
      vim.b,
      require("core.galaxyline-opt.lsp")

function M.get_root_dir(path)
    -- return parent path for specified entry (either file or directory)
    local function pathname(path)
        local prefix = ""
        local i = path:find("[\\/:][^\\/:]*$")
        if i then
            prefix = path:sub(1, i - 1)
        end

        return prefix
    end

    -- Checks if provided directory contains git directory
    local function has_git_dir(dir)
        local git_dir = dir .. "/.git"
        if M.isdir(git_dir) then
            return git_dir
        end
    end

    local function has_git_file(dir)
        local gitfile = io.open(dir .. "/.git")
        if not gitfile then
            return false
        end

        local git_dir = gitfile:read():match("gitdir: (.*)")
        gitfile:close()

        return git_dir and dir .. "/" .. git_dir
    end

    -- Set default path to current directory
    if not path or path == "." then
        path = io.popen "cd":read "*l"
    end

    -- Calculate parent path now otherwise we won't be
    -- able to do that inside of logical operator
    local parent_path = pathname(path)

    return has_git_dir(path)
        or has_git_file(path)
        -- Otherwise go up one level and make a recursive call
        or (parent_path ~= path and M.get_root_dir(parent_path) or nil)
end

function M.check_workspace()
    local current_file = fn.expand("%:p")
    if current_file == '' or current_file == nil then return false end
    local current_dir
    -- if file is a symlinks
    if fn.getftype(current_file) == "link" then
        local real_file = fn.resolve(current_file)
        current_dir = fn.fnamemodify(real_file, ":h")
    else
        current_dir = fn.expand("%:p:h")
    end
    local result = M.get_root_dir(current_dir)
    if not result then
        return false
    end
    return true
end

local function file_readonly()
    if bo.filetype == "help" then
      return ""
    end
    if bo.readonly == true then
      return " "
    end
    return ""
end

function M.format_file_size(file)
    local size = fn.getfsize(file)
    if size == 0 or size == -1 or size == -2 then
      return "   Ω  "
    end
    if size < 1024 then
      size = size .. "b"
    elseif size < 1024 * 1024 then
      size = string.format("%.1f", size / 1024) .. "k"
    elseif size < 1024 * 1024 * 1024 then
      size = string.format("%.1f", size / 1024 / 1024) .. "m"
    else
      size = string.format("%.1f", size / 1024 / 1024 / 1024) .. "g"
    end
    return "  - " .. size .. " "
end

function M.get_file_size()
    local file = fn.expand("%:p")
    if string.len(file) == 0 then
      return ""
    end
    return M.format_file_size(file)
end

function M.get_file_type()
    local ft = bo.filetype
    local filetype = (function()
      if ft == "py" then
        return "python"
      elseif ft == "sh" then
        return "shell"
      elseif ft == "cpp" then
        return "C++"
      elseif ft == "cs" then
        return "C#"
      elseif ft == "css" then
        return "Cascading Style Sheets"
      elseif ft == "fish" then
        return "Friendly Interactive SHell"
      elseif ft == "haml" then
        return "HTML Abstraction Markup Language"
      elseif ft == "html" then
        return "HyperText Markup Langauge"
      elseif ft == "json" then
        return "JavaScript Object Notation"
      elseif ft == "less" then
        return "LEaner Style Sheets"
      elseif ft == "objc" then
        return "Objective C"
      elseif ft == "objcpp" then
        return "Objective C++"
      elseif ft == "php" then
        return "PHP Hypertext Processor"
      elseif ft == "ron" then
        return "Rusty Object Notation"
      elseif ft == "sass" then
        return "Syntastically Awesome Style Sheets"
      elseif ft == "scss" then
        return "Sassy Cascading Style Sheets"
      elseif ft == "toml" then
        return "Tom's Obvious, Minimal Language"
      elseif ft == "yaml" then
        return "Yet Another Markup Language"
      elseif ft == "zsh" then
        return "Z SHell"
      else
        return ft:gsub("^%l", string.upper)
      end
    end)()
    return " " .. filetype .. " "
end

function M.get_file_icon()
    local icon = ""
    if fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
      icon = fn.WebDevIconsGetFileTypeSymbol()
      return icon .. " "
    end
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if not ok then
      print("Does not found any icon plugin")
      return
    end
    local f_name, f_extension = fn.expand("%:t"), fn.expand("%:e")
    icon = devicons.get_icon(f_name, f_extension)
    if icon == nil then
        icon = ""
    end
    return " " .. icon .. " "
end

-- get current file name
function M.get_current_file_name()
    local file = fn.expand("%:t")
    if fn.empty(file) == 1 then
      return ""
    end
    if string.len(file_readonly()) ~= 0 then
      return file .. file_readonly()
    end
    if bo.modifiable then
      if bo.modified then
        return file .. "   "
      end
    end
    if bo.filetype == "toggleterm" then
      return "Term " .. b.toggle_number
    else
      return file .. " "
    end
end

function M.filetype_separator()
    if not lsp.has_diagnostics() and not M.check_workspace() then
      u.statusHi("FileTypeSeparator", 'purple', 'act1')
      return ""
    elseif bo.filetype == "" and not M.check_workspace() then
      return ""
    else
      u.statusHi("FileTypeSeparator", 'purple', 'act1')
      return i.border.right
   end
end


function M.exists(file)
    if file == '' or file == nil then return false end
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            return true
        end
    end
    return ok, err
end

function M.isdir(path)
    if path == '' or path == nil then return false end
    return M.exists(path .. "/")
end

function M.get_file_format()
    return bo.fileformat
end


return M