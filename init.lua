-- Leader Keybind
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Requires
require("config.lazy")
require("keymaps.init")
require("colors.caelestia-dynamic-colors").setup()

-- Other Settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true

-- Colorscheme Watcher
local dir = vim.fn.expand("~/.config/hypr/scheme")
local watcher = vim.uv.new_fs_event()
local timer = vim.uv.new_timer()

watcher:start(
	dir,
	{},
	vim.schedule_wrap(function(err, filename)
		if err or filename ~= "current.conf" then
			return
		end

		timer:stop()
		timer:start(
			100,
			0,
			vim.schedule_wrap(function()
				package.loaded["colors.caelestia-dynamic-colors"] = nil
				require("colors.caelestia-dynamic-colors").setup()
				vim.cmd("redraw!")
			end)
		)
	end)
)
