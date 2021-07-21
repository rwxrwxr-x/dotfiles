require "config" -- global O
require "mappings"
pcall(vim.cmd, "luafile " .. CONFIG_PATH .. "/options.lua")
require "plugins"
O.init()