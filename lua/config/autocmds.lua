-- Colorscheme Watcher
local dir = vim.fn.expand("~/.config/hypr/scheme")
local watcher = vim.uv.new_fs_event()
local timer = vim.uv.new_timer()

watcher:start(
	dir,
	{},
	vim.schedule_wrap(function(err, filename)
		if err or filename ~= "current.lua" then
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
