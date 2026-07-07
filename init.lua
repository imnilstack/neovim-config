-- Leader Keybind
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Requires
require("config.lazy")
require("config.options")
require("config.autocmds")
require("keymaps.init")
require("colors.caelestia-dynamic-colors").setup()
