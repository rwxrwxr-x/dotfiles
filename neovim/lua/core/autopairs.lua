
local s, ap = pcall(require, "nvim-autopairs")
if not s then
    return
end
local np, R, fn =
    require "nvim-autopairs",
    require "nvim-autopairs.rule",
    vim.fn

_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if fn.pumvisible() ~= 0 then
    if fn.complete_info()["selected"] ~= -1 then
      return fn["compe#confirm"](np.esc "<cr>")
    else
      return np.esc "<cr>"
    end
  else
    return np.autopairs_cr()
  end
end

if package.loaded["compe"] then
    require("nvim-autopairs.completion.compe").setup {
      map_cr = true, --  map <CR> on insert mode
      map_complete = true, -- it will auto insert `(` after select function or method item
    }
end

np.setup {
    check_ts = true,
    ts_config = {
        lua = { "string "},
        javascript = { "template_string"},
        java = false,
    }
}
require("nvim-treesitter.configs").setup { autopairs = { enable = true } }

local ts_conds = require "nvim-autopairs.ts-conds"

-- press % => %% is only inside comment or string
np.add_rules {
  R("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  R("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}
