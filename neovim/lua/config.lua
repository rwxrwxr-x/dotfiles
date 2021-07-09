CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expannd "$TERMINAL"
USER = vim.fn.expand "$USER"

local cmd = vim.cmd
local opt = vim.opt

O = {
    leader_key = "space",
    colorscheme = "spacegray",
    line_wrap_cursor_movement = true,
    transparent_window = false,
    format_on_save = true,
    vsnip_dir = vim.fn.stdpath "config" .. "/snippets",

    default_options = {
    },
    plugin = {},
    lsp = {
        document_highlight = true,
        popup_border = "single",
    },
    user_which_key = {},

    user_autocommands = {
    { "FileType", "qf", "set nobuflisted" },
    },

    formatters = {
    filetype = {},
    },
    lang = {
        cmake = {},
        clang = {},
        css = {},
        docker = {},
        emmet = {},
        go = {},
        html = {},
        json = {},
        lua = {},
        python = {},
        sh = {},
        tsserver = {},
        yaml = {},
    },
}

cmd "filetype plugin on"
cmd('let &titleold="' .. TERMINAL .. '"')
cmd "set inccommand=split"
cmd "set iskeyword+=-"

if O.line_wrap_cursor_movement then
  cmd "set whichwrap+=<,>,[,],h,l"
end

opt.shortmess:append "c"

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
  }

if O.leader_key == " " or O.leader_key == "space" then
    vim.g.mapleader = ' '
else
    vim.g.mapleader = O.leader_key
end

for _, p in pairs(disabled_built_ins) do
    vim.g["loaded_" .. p] = 1
end

for k,v in pairs(O.default_options) do
    vim.opt[k] = v
end
