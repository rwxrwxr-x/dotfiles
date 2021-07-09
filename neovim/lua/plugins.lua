local exec = vim.api.nvim_command
local fc = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

return require("packer").startup(function(use)
    -- packer can manage itself as on optioonal
    use "wbthomason/packer.nvim"
    use { "neovim/nvim-lspconfig" }
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall",
      event = "VimEnter",
      config = function()
        require("lspinstall").setup()
      end,
    }
    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "tjdevries/astronauta.nvim" }
    use { "terrortylor/nvim-comment",
        event = "BufRead",
        config = function()
          local status_ok, nvim_comment = pcall(require, "nvim_comment")
          if not status_ok then
            return
          end
          nvim_comment.setup()
        end,
      }
    use { "kyazdani42/nvim-web-devicons" }
    use {
        "airblade/vim-rooter",
        config = function()
          vim.g.rooter_silent_chdir = 1
        end,
      }
    use {
        "Pocco81/DAPInstall.nvim",
        -- event = "BufWinEnter",
        -- event = "BufRead",
        disable = not O.plugin.dap.active,
      }
    use { "sebdah/vim-delve "}
    if vim.fn.executable("go") then
        -- Go
        use {
          "fatih/vim-go",
          ft = "go",
          run = ":GoUpdateBinaries"
        }
      end
    use {
    "mhinz/vim-signify",
    opt = true,
    config = function()
        vim.g.signify_sign_add = ""
        vim.g.signify_sign_delete = ""
        vim.g.signify_sign_delete_first_line = ""
        vim.g.signify_sign_change = ""
        vim.g.signify_sign_change = ""
    end
    }
       -- Hive
    use {
        "zebradil/hive.vim",
        ft = "hive"
    }

    -- Shell
    use {
        "arzg/vim-sh",
        ft = "sh"
    }

    -- Zsh
    use {
        "chrisbra/vim-zsh",
        ft = "zsh"
    }
    -- PostgreSQL
    use {
        "lifepillar/pgsql.vim",
        ft = "pgsql"
    }
    -- Vue
    use {
        "posva/vim-vue",
        ft = "vue"
    }
    use {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
      }
end)