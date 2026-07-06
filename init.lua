-- Leader Keybind
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Requires
require("config.lazy")
require("colors.caelestia-dynamic-colors").setup()

-- Custom Mappings
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- remove arrow keys cuz trash
--[[vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")]]

vim.keymap.set("n", "<leader>tl", function()
    local wo = vim.wo

    if wo.number and not wo.relativenumber then
        -- absolute -> relative
        wo.number = false
        wo.relativenumber = true
	print("Line Numbering: Relative")

    elseif not wo.number and wo.relativenumber then
        -- relative -> absolute + relative
        wo.number = true
        wo.relativenumber = true
	print("Line Numbering: Absolute + Relative")

    else
        -- absolute + relative -> absolute
        wo.number = true
        wo.relativenumber = false
	print("Line Numbering: Absolute")

    end
end, { desc = "Cycle line number modes" })

vim.keymap.set("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
  print("Wrap: " .. (vim.wo.wrap and "ON" or "OFF"))
end, { desc = "Toggle line wrap" })

-- Other Settings
vim.opt.number = true
vim.opt.relativenumber = false

-- Colorscheme Watcher
local dir = vim.fn.expand("~/.config/hypr/scheme")
local watcher = vim.uv.new_fs_event()
local timer = vim.uv.new_timer()

watcher:start(dir, {}, vim.schedule_wrap(function(err, filename)
    if err or filename ~= "current.conf" then
        return
    end

    timer:stop()
    timer:start(100, 0, vim.schedule_wrap(function()
        package.loaded["colors.caelestia-dynamic-colors"] = nil
        require("colors.caelestia-dynamic-colors").setup()
        vim.cmd("redraw!")
    end))
end))
