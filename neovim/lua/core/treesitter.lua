local M = {}
M.config = function()
  O.treesitter = {
    ensure_installed = {"all"}, 
    ignore_install = {},
    matchup = {
      enable = false,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      disable = { "latex" },
    },
    context_commentstring = {
      enable = false,
      config = { css = "// %s" },
    },
    indent = { },
    autotag = { enable = false },
    textobjects = {
      swap = {
        enable = false,
      },
      select = {
        enable = false,
      },
    },
    textsubjects = {
      enable = false,
      keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
    },
    playground = {
      enable = false,
      disable = {},
      updatetime = 25,
      persist_queries = false,
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    rainbow = {
      enable = false,
      extended_mode = true,
      max_file_lines = 1000,
    },
  }
end

M.setup = function()
  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter_configs.setup(O.treesitter)
end

return M
