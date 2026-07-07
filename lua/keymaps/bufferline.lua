local map = vim.keymap.set

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bprevious | bdelete #<CR>", { desc = "Close current buffer" }, { silent = true })
