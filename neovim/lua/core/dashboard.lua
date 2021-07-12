local M, g = {}, vim.g

M.config = function()
    O.plugin.dashboard = {
        active = false,
        custom_header = {
            "{{ header }}"
        },
    }
end

M.setup = function()
    g.dashboard_disable_at_vimenter = 0

    g.dashboard_custom_header = O.plugin.dashboard.custom_header

    g.dashboard_default_executive = O.plugin.dashboard.search_handler

    g.dashboard_custom_section = O.plugin.dashboard.custom_section

    vim.cmd "let g:dashboard_session_directory = $HOME..'/.config/nvim/.sessions'"
    vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"
  
    vim.api.nvim_exec(
      [[
      let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' plugins']
  ]],
      false
    )
end

return M
