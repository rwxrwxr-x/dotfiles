local cmd, opt, g, fn= vim.cmd, vim.opt, vim.g, vim.fn

CONFIG_PATH = fn.stdpath "config"
DATA_PATH = fn.stdpath "data"
CACHE_PATH = fn.stdpath "cache"
TERMINAL = fn.expannd "$TERMINAL"
USER = fn.expand "$USER"

O = {
    leader_key = "space",
    colorscheme = "spacegray",
    line_wrap_cursor_movement = true,
    transparent_window = false,
    format_on_save = true,
    vsnip_dir = fn.stdpath "config" .. "/snippets",

    default_options = {
        backup = false,
        clipboard = "unnamedplus", -- access the system clipboard
        cmdheight = 2, -- more space in the neovim command line
        colorcolumn = "99999", -- fixes indentline
        completeopt = { "menuone", "noselect" },
        conceallevel = 0, -- so that `` is visible in markdown files
        fileencoding = "utf-8", -- the encoding written to a file
        hidden = true, -- required to keep multiple buffers and open multiple buffers
        hlsearch = false, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        mouse = "a",
        pumheight = 10, -- pop up menu height
        showmode = false, 
        showtabline = 2, -- always show tabs
        smartcase = true, -- smart case
        smartindent = true, -- make indenting smarter again
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        swapfile = false, -- creates a swapfile
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
        title = true, -- set the title of window to the value of the titlestring
        undodir = CACHE_PATH .. "/undo", -- set an undo directory
        undofile = true, -- enable persisten undo
        updatetime = 300, -- faster completion
        writebackup = false, 
        expandtab = true, -- convert tabs to spaces
        shiftwidth = 2, -- the number of spaces inserted for each indentation
        tabstop = 2, -- insert 2 spaces for a tab
        cursorline = true, -- highlight the current line
        number = true, -- set numbered lines
        relativenumber = false, -- set relative numbered lines
        numberwidth = 4, -- set number column width to 2 {default 4}
        signcolumn = "yes",
        wrap = false, 
        spell = false,
        spelllang = "en",
        scrolloff = 8, 
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

require("core.gitsigns")
require("core.compe")
require("core.dashboard")
require("core.floatterm")


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
    g.mapleader = ' '
else
    g.mapleader = O.leader_key
end

for _, p in pairs(disabled_built_ins) do
    g["loaded_" .. p] = 1
end

for k,v in pairs(O.default_options) do
    opt[k] = v
end
