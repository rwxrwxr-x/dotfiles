local M, i, u, fn, api, lsp, f = {},
    require("core.misc.icons"),
    require("core.galaxyline-opt.utils"),
    vim.fn,
    vim.api,
    require("core.galaxyline-opt.lsp"),
    require("core.galaxyline-opt.file")


function M.git_separator()
    if lsp.has_diagnostics() and not f.check_workspace() then
      u.statusFG("GitSeparator", 'purple', 'act1')
      return ""
    elseif not lsp.has_diagnostics() and f.check_workspace() then
      u.statusHi("GitSeparator", 'purple','act1')
      return i.border.left
    elseif lsp.has_diagnostics() and not f.check_workspace() then
      return ""
    else
      return ""
    end
end


function M.get_branch()
    if ft == "help" then
        return
    end
    local current_file = fn.expand("%:p")
    local current_dir

    -- if file is a symlinks
    if fn.getftype(current_file) == "link" then
        local real_file = fn.resolve(current_file)
        current_dir = fn.fnamemodify(real_file, ":h")
    else
        current_dir = fn.expand("%:p:h")
    end

    local _, gitbranch_pwd = pcall(api.nvim_buf_get_var, 0, "gitbranch_pwd")
    local _, gitbranch_path = pcall(api.nvim_buf_get_var, 0, "gitbranch_path")
    if gitbranch_path and gitbranch_pwd then
        if gitbranch_path:find(current_dir) and string.len(gitbranch_pwd) ~= 0 then
            return gitbranch_pwd
        end
    end
    local git_dir = f.get_root_dir(current_dir)
    if not git_dir then
        return
    end
    local git_root
    if not git_dir:find("/.git") then
        git_root = git_dir
    end
    git_root = git_dir:gsub("/.git", "")
  
    -- If git directory not found then we're probably outside of repo
    -- or something went wrong. The same is when head_file is nil
    local head_file = git_dir and io.open(git_dir .. "/HEAD")
    if not head_file then
        return
    end
  
    local HEAD = head_file:read()
    head_file:close()
  
    -- if HEAD matches branch expression, then we're on named branch
    -- otherwise it is a detached commit
    local branch_name = HEAD:match("ref: refs/heads/(.+)")
    if branch_name == nil then
        return
    end
  
    api.nvim_buf_set_var(0, "gitbranch_pwd", branch_name)
    api.nvim_buf_set_var(0, "gitbranch_path", git_root)
  
    return branch_name .. " "
end

function M.get_git_branch_formatted()
    if lsp.has_diagnostics() then
      u.statusBG("GitBranch", 'purple')
    else
      u.statusBG("GitBranch", 'act1')
    end
    return M.get_branch()
end

return M