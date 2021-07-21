-- ## GENERAL ##
-- O - global options variable
-- V - global vim options variable (V == O.v)
-- leader_key is space
    O.leader_key = " "
-- ## VIM BUILTIN OPTIONS AREA ##
-- backup:    creates a backup file
    V.backup            = false
-- clipboard: allows neovim to access the system clipboard
    V.clipboard         = "unnamedplus"
-- cmdheight: more space in the neovim command line for displaying messages
    V.cmdheight         = 2
 -- colorcolumn:   fixes indentline for now
    V.colorcolumn       = "99999"
-- completeopt:
    V.completeopt       = { "menuone", "noselect" }
-- conceallevel:  so that `` is visible in markdown files
    V.conceallevel      = 0
 -- cursorline: highlight the current line
    V.cursorline        = true
 -- expandtab: convert tabs to spaces
    V.expandtab         = true
 -- fileencoding: the encoding written to a file
    V.fileencoding      = "utf-8"
 -- guifont: the font used in graphical neovim applications
    V.guifont           = "monospace:h17"
 -- hidden: required to keep multiple buffers and open multiple buffers
    V.hidden            = true
 -- hlsearch: highlight all matches on previous search pattern
    V.hlsearch          = false
 -- ignorecase: ignore case in search patterns
    V.ignorecase        = true
 -- mouse: allow the mouse to be used in neovim
    V.mouse             = "a"
 -- number: set numbered lines
    V.number            = true -- set numbered lines
-- numberwidht: set number column width to 2 {default 4}
    V.numberwidth       = 4
 -- pumheight: pop up menu height
    V.pumheight         = 10
 -- relativenumber: set relative numbered lines
    V.relativenumber    = false
 -- scrolloff: 
    V.scrolloff         = 8
-- shiftwidth: the number of spaces inserted for each indentation
    V.shiftwidth        = 2
 -- showmode: shows current mode (line insert, visal, etc)
    V.showmode            = false
-- showtabline: always show tabs
    V.showtabline       = 2
-- signcolumn: always show the sign column, otherwise it would shift the text each time
    V.signcolumn        = "yes"
 -- smartcase: 
    V.smartcase         = true
 -- smartindent: make indenting smarter again
    V.smartindent       = true
 -- spell: 
    V.spell             = false
 -- spelllang:
    V.spelllang         = "en"
 -- splitbelow: force all horizontal splits to go below current window
    V.splitbelow        = true
 -- splitright: force all vertical splits to go to the right of current window
    V.splitright        = true
 -- swapfile: creates a swapfile
    V.swapfile          = false
 -- tabstop: insert spaces for a tab
    V.tabstop           = 2
 -- termguicolors: set term gui colors (most terminals support this)
    V.termguicolors     = true
 -- timeoutlen: time to wait for a mapped sequence to complete (in milliseconds)
    V.timeoutlen        = 100
 -- title: set the title of window to the value of the titlestring 
    V.title             = true
 -- undodir: set on undo dir 
    V.undodir           = CACHE_PATH .. "/undo"
 -- undofile: enable persistent undo
    V.undofile          = true
 -- updatetime: faster completion 
    V.updatetime        = 300
 -- wrap: display lines as one long line
    V.wrap              = true
 -- writebackup: if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited 
    V.writebackup       = false

-- ## VIM BUILTIN OPTIONS AREA END ##


-- general
O.format_on_save = true
O.completion.autocomplete = true
O.colorscheme = "spacegray"
O.auto_close_tree = 0

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.floatterm.active = true

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = {}
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

-- python
-- O.python.linter = 'flake8'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true
-- to change default formatter from yapf to black
-- O.lang.python.formatter.exe = "black"
-- O.lang.python.formatter.args = {"-"}

-- go
-- to change default formatter from gofmt to goimports
-- O.lang.formatter.go.exe = "goimports"

-- javascript
O.lang.tsserver.linter = nil

-- latex
-- O.lang.latex.auto_save = false
-- O.lang.latex.ignore_errors = { }


-- Additional Plugins
-- O.user_plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- O.user_which_key = {
--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>echo 'first custom command'<cr>", "Description for a" },
--     b = { "<cmd>echo 'second custom command'<cr>", "Description for b" },
--   },
-- }
