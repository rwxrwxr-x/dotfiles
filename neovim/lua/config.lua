local fn = vim.fn
CONFIG_PATH = fn.stdpath "config"
DATA_PATH   = fn.stdpath "data"
CACHE_PATH  = fn.stdpath "cache"
TERMINAL    = fn.expand "$TERMINAL"
USER        = fn.expand "$USER"

O = {
  leader_key = "space",
  colorscheme = "spacegray",
  line_wrap_cursor_movement = true,
  transparent_window = false,
  format_on_save = true,
  vsnip_dir = vim.fn.stdpath "config" .. "/snippets",

  vim_options = { -- builtin vim options
    backup          = false,
    clipboard       = "autoselect",
    cmdheight       = 1, 
    colorcolumn     = "",
    completeopt     = "menu,preview",
    conceallevel    = 0,
    fileencoding    = "utf-8",
    guifont         = "",
    hidden          = false,
    hlsearch        = false,
    ignorecase      = true,
    mouse           = "",
    pumheight       = 0,
    showmode        = false,
    showtabline     = 1,
    smartcase       = false,
    smartindent     = false,
    splitbelow      = false,
    splitright      = false,
    swapfile        = false,
    termguicolors   = false,
    timeoutlen      = 1000, 
    title           = false,
    undodir         = ".",
    undofile        = false,
    updatetime      = 4000,
    writebackup     = false,
    expandtab       = false,
    shiftwidth      = 8,
    tabstop         = 8,
    cursorline      = false,
    number          = false,
    relativenumber  = false,
    numberwidth     = 4,
    signcolumn      = "yes",
    wrap            = false,
    spell           = false,
    spelllang       = "en",
    scrolloff       = 0,
  },

  plugin = {},

  -- TODO: refactor for tree
  auto_close_tree = 0,
  nvim_tree_disable_netrw = 0,

  lsp = {
    document_highlight = true,
    popup_border = "single",
  },

  user_autocommands = {
    { "FileType", "qf", "set nobuflisted" },
  },

  formatters = {
    filetype = {},
  },

  -- TODO move all of this into lang specific files, only require when using
  lang = {
    cmake = {
      formatter = {
        exe = "clang-format",
        args = {},
      },
    },
    clang = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      cross_file_rename = true,
      header_insertion = "never",
      filetypes = { "c", "cpp", "objc" },
      formatter = {
        exe = "clang-format",
        args = {},
      },
    },
    css = {
      virtual_text = true,
    },
    dart = {
      sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
      formatter = {
        exe = "dart",
        args = { "format" },
      },
    },
    docker = {},
    efm = {},
    elm = {},
    emmet = { active = false },
    elixir = {},
    graphql = {},
    go = {
      formatter = {
        exe = "gofmt",
        args = {},
      },
    },
    html = {},
    java = {
      java_tools = {
        active = false,
      },
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
    json = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "python",
        args = { "-m", "json.tool" },
      },
    },
    kotlin = {},
    latex = {
      auto_save = false,
      ignore_errors = {},
    },
    lua = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "stylua",
        args = {},
        stdin = false,
      },
    },
    php = {
      format = {
        format = {
          default = "psr12",
        },
      },
      environment = {
        php_version = "7.4",
      },
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "php", "phtml" },
      formatter = {
        exe = "phpcbf",
        args = { "--standard=PSR12", vim.api.nvim_buf_get_name(0) },
        stdin = false,
      },
    },
    python = {
      -- @usage can be flake8 or yapf
      linter = "",
      isort = false,
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      analysis = {
        type_checking = "basic",
        auto_search_paths = true,
        use_library_code_types = true,
      },
      formatter = {
        exe = "yapf",
        args = {},
      },
    },
    ruby = {
      diagnostics = {
        virtualtext = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "rb", "erb", "rakefile", "ruby" },
      formatter = {
        exe = "rufo",
        args = { "-x" },
      },
    },
    rust = {
      rust_tools = {
        active = false,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=>", -- prefix for all the other hints (type, chaining)
      },
      -- @usage can be clippy
      formatter = {
        exe = "rustfmt",
        args = { "--emit=stdout", "--edition=2018" },
      },
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    sh = {
      -- @usage can be 'shellcheck'
      linter = "",
      -- @usage can be 'shfmt'
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "shfmt",
        args = { "-w" },
        stdin = false,
      },
    },
    svelte = {},
    tailwindcss = {
      active = false,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    },
    terraform = {
      formatter = {
        exe = "terraform",
        args = { "fmt" },
        stdin = false,
      },
    },
    tsserver = {
      -- @usage can be 'eslint' or 'eslint_d'
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
    vim = {},
    yaml = {
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
  },
}

require("core.gitsigns").config()
require("core.compe").config()
require("core.dashboard").config()
require("core.floatterm").config()
require("core.telescope").config()
require("core.treesitter").config()
require("core.which-key").config()

V = O.vim_options -- vim settings pointer

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

function O.init()
  local cmd, opt, g = vim.cmd, vim.opt, vim.g

  opt.shortmess:append "c"
  cmd "filetype plugin on"
  cmd('let &titleold="' .. TERMINAL .. '"')
  cmd "set inccommand=split"
  cmd "set iskeyword+=-"

  if O.line_wrap_cursor_movement then
    cmd "set whichwrap+=<,>,[,],h,l"
  end

  for k, v in pairs(O.vim_options) do
    opt[k] = v
  end

  for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
  end

  if O.leader_key == " " or O.leader_key == "space" then
    g.mapleader = ' '
  else
    g.mapleader = O.leader_key
  end
end