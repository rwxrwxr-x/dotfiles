local M, fn, api = {}, vim.fn, vim.api
local map = { noremap = true, silent = true }
M.config = function()
  O.plugin.floatterm = {
    active = false,
    dimensions = {
      height = 0.6,
      width = 0.9,
      x = 0.5,
      y = 0.3,
    },
    border = "double",
  }
end

M.setup = function()
  local status_ok, fterm = pcall(require, "FTerm")
  if not status_ok then
    return
  end

  fterm.setup(O.plugin.floatterm)

  -- Create LazyGit Terminal
  local term = require "FTerm.terminal"
  local lazy = term:new():setup { cmd = "lazygit", dimensions =
                 { height = 0.9, width = 0.9, x = 0.5, y = 0.3},
  }

  local function is_installed(exe)
    return fn.executable(exe) == 1
  end

  function _G.__fterm_lazygit()
    if is_installed "lazygit" ~= true then
      print "Please install lazygit. Check documentation for more information"
      return
    end
    lazy:toggle()
  end

  O.plugin.which_key.mappings["gg"] = "LazyGit"
  api.nvim_set_keymap("n", "<leader>t", "<CMD>lua require('FTerm').toggle()<CR>", map)
  api.nvim_set_keymap("n", "<leader>gg", "<CMD>lua _G.__fterm_lazygit()<CR>", map)

  api.nvim_set_keymap(
    "t",
    "<Esc>",
    "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", map
  )
  api.nvim_set_keymap("n", "<A-l>", "<CMD>lua _G.__fterm_lazygit()<CR>", map)
  api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-n><CMD>lua _G.__fterm_lazygit()<CR>", map)
end

return M
