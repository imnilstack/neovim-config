local gs = require("gitsigns")
local map = vim.keymap.set

map("n", "]h", gs.next_hunk)
map("n", "[h", gs.prev_hunk)

map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gb", gs.blame_line, { desc = "Blame line" })
