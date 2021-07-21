local function reg(mappings, default)
  for mode, mode_map in pairs(mappings) do
    for _, mapping in pairs(mode_map) do
      local options = #mapping == 3 and table.remove(mapping) or default
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

local mappings = {
  i = { -- Insert mode
    { "jk", "<ESC>" },
    { "kj", "<ESC>" },
    { "jj", "<ESC>" },

    { "<A-j>", "<Esc>:m .+1<CR>==gi" },
    { "<A-k>", "<Esc>:m .-2<CR>==gi" },

    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  n = { -- Normal mode
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },
    { "<C-Up>", ":resize -2<CR>", { silent = true } },
    { "<C-Down>", ":resize +2<CR>", { silent = true } },
    { "<C-Left>", ":vertical resize -2<CR>", { silent = true } },
    { "<C-Right>", ":vertical resize +2<CR>", { silent = true } },
    { "<A-j>", ":m .+1<CR>==" },
    { "<A-k>", ":m .-2<CR>==" },
    { "]q", ":cnext<CR>" },
    { "[q", ":cprev<CR>" },
  },
  t = { -- Terminal mode
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    { "<Esc", "<C-\\><C-N> "},
  },
  v = { -- Visual/Select mode
    { "<", "<gv" },
    { ">", ">gv" },
  },
  x = { -- Visual mode
    { "K", ":move '<-2<CR>gv-gv" },
    { "J", ":move '>+1<CR>gv-gv" },

    { "<A-j>", ":m '>+1<CR>gv-gv" },
    { "<A-k>", ":m '<-2<CR>gv-gv" },
  },
  [""] = {
    { "<C-q>", ":call QuickFixToggle()<CR>" },
  },
}

if vim.fn.has "mac" == 1 then
  mappings["n"][5][1] = "<A-Up>"
  mappings["n"][6][1] = "<A-Down>"
  mappings["n"][7][1] = "<A-Left>"
  mappings["n"][8][1] = "<A-Right>"
end

reg(mappings, { silent = true, noremap = true })

vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

